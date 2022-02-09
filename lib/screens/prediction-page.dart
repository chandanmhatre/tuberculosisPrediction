import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';

import '../model/upload-image.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({Key? key}) : super(key: key);

  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  double health = 0, tb = 0;
  File imageFile = File('');
  String btnName = 'Upload Chest X-Ray';
  bool isLoading = false;
  final UploadImageToFirebase UploadImage = UploadImageToFirebase();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: WidgetUtils.buildAppBar(context, "Tuberculosis Prediction"),
        body: ListView(
          children: [
            const SizedBox(height: 30),
            Center(
              child: WidgetUtils.styledButton(
                  btnName, () => isLoading ? null : uploadImage()),
            ),
            const SizedBox(height: 10),
            setImageView(imageFile),
            const SizedBox(height: 30),
            imageFile.path.isNotEmpty
                ? Center(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : WidgetUtils.styledButton(
                            'Predict', () => sendRequest(imageFile.path)),
                  )
                : const SizedBox(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  void uploadImage() async {
    final _picker = ImagePicker();
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      if (mounted) {
        setState(() {
          btnName = 'Change X-ray';
          imageFile = File(image.path);
        });
      }
    }
  }

  Widget setImageView(File imgName) {
    Widget imageView = SizedBox();
    if (imgName.path.isNotEmpty) {
      imageView = GestureDetector(
          onTap: () => null, //openImage(imgName),
          child: Image.file(
            imgName,
          ));
    }
    return imageView;
  }

  openImage(
    File imageFile,
  ) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white,
      transitionDuration: const Duration(milliseconds: 100),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InteractiveViewer(
                        boundaryMargin: const EdgeInsets.all(double.infinity),
                        minScale: 0.5,
                        maxScale: 10,
                        child: Image.file(
                          imageFile,
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * .85,
                        )),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  sendRequest(filePath) async {
    if (imageFile.path.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest(
          'POST', Uri.parse("http://13.58.176.87:5000/predict"));
      request.files.add(await http.MultipartFile.fromPath('image', filePath));
      request.fields.addAll({"disease": "tb"});
      try {
        var res = await request.send();
        if (res.statusCode == 200) {
          var body = await res.stream.bytesToString();
          Map covidRisk = jsonDecode(body)['predictions'];
          setState(() {
            health = covidRisk['Healthy'];
            tb = covidRisk['TB'];
            isLoading = false;
          });
          String imgeName = filePath
              .toString()
              .substring(filePath.toString().lastIndexOf('cache/') + 6);
          UploadImage.uploadFile(filePath, imgeName).then((value) {});
          return WidgetUtils.showPopUp(
            'Result of TB disease using \nX-Ray image',
            context,
            () => Navigator.pop(context),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Healthy :' + (health * 100).toString() + ' %'),
                Text('Tuberculosis :' + (tb * 100).toString() + ' %'),
              ],
            ),
          );
        } else {
          return WidgetUtils.confirmDialog(
              "Internal server error,Please try again later...",
              () => null,
              context);
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        return WidgetUtils.confirmDialog(e.toString(), () => null, context);
      }
    } else {
      setState(() {
        isLoading = false;
      });
      return WidgetUtils.showToast("Please upload X-Ray image", context);
    }
  }
}
