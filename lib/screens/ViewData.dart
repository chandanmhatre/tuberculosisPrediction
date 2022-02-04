// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:tuberculosis_prediction/Utils/Utils.dart';
// import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';
// import 'package:tuberculosis_prediction/screens/hardcore-prediction-page.dart';
//
// class ViewData extends StatefulWidget {
//   const ViewData({Key? key}) : super(key: key);
//
//   @override
//   _ViewDataState createState() => _ViewDataState();
// }
//
// class _ViewDataState extends State<ViewData> {
//   late List<DataRow> predictionData = [];
//   static const List<String> headers = [
//     "Date",
//     "Pregnancies",
//     "Glucose",
//     "Blood Pressure",
//     "Skin Thickness",
//     "Insulin",
//     "BMI",
//     "Diabetes Pedegree Function",
//     "Age",
//     "Risk"
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: WidgetUtils.buildAppBar(context, "Previous Prediction"),
//           body: StreamBuilder<List<User>>(
//             stream: stream(),
//             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//               if (snapshot.hasError) {
//                 return Text("Something Went Wrong!${snapshot.error}");
//               } else if (snapshot.hasData) {
//                 var data = snapshot.data;
//                 predictionData.clear();
//                 prepareTableCells(data);
//                 return buildForm();
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           )),
//     );
//   }
//
//   SingleChildScrollView buildForm() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(20.0),
//       scrollDirection: Axis.vertical,
//       child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: WidgetUtils.buildTable(headers, predictionData)),
//     );
//   }
//
//   void prepareTableCells(data) {
//     data.forEach((User user) {
//       predictionData.add(_buildDataRow(user));
//     });
//   }
//
//   DataRow _buildDataRow(User user) {
//     String date = Utils.formatDate(user.date!, 'd-M-y');
//     return DataRow(cells: <DataCell>[
//       _buildDataCell(date),
//       _buildDataCell(user.pregnancies.toString()),
//       _buildDataCell(user.glucose.toString()),
//       _buildDataCell(user.bloodPressure.toString()),
//       _buildDataCell(user.skinThickness.toString()),
//       _buildDataCell(user.insulin.toString()),
//       _buildDataCell(user.BMI.toString()),
//       _buildDataCell(user.diabetesPedegreeFunction.toString()),
//       _buildDataCell(user.age.toString()),
//       _buildDataCell(user.risk.toString()),
//     ]);
//   }
//
//   DataCell _buildDataCell(String value) {
//     return DataCell(Text(
//       value,
//       style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.blue,
//           overflow: TextOverflow.ellipsis),
//     ));
//   }
//
//   Stream<List<User>> stream() => FirebaseFirestore.instance
//       .collection('data')
//       .snapshots()
//       .map((event) => event.docs.map((e) => User.fromJson(e.data())).toList());
// }
