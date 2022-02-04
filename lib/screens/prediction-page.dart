import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({Key? key}) : super(key: key);

  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  double health = 0;
  double tb = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: WidgetUtils.buildAppBar(context, "Tuberculosis Prediction"),
        body: Column(
          children: [
            const SizedBox(height: 30),
            const Text('Predict'),
            Text('Result' + health.toString()),
            Text('Result' + tb.toString()),
            const Spacer(),
            Center(
              child: WidgetUtils.styledButton(
                  'Upload Chest X-Ray', () => uploadImage()),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  void uploadImage() async {
    final _picker = ImagePicker();
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
    print('Image Picked');
    sendRequest(image!.path);
  }

  void sendRequest(filename) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://13.58.176.87:5000/predict"));
    request.files.add(await http.MultipartFile.fromPath('image', filename));
    request.fields.addAll({"disease": "tb"});
    try {
      var res = await request.send();
      var body = await res.stream.bytesToString();
      Map covidRisk = jsonDecode(body)['predictions'];
      setState(() {
        health = covidRisk['Healthy'];
        tb = covidRisk['TB'];
        print(covidRisk);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
