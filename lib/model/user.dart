import 'package:cloud_firestore/cloud_firestore.dart';
//
// Future saveData() async {
//   final saveData = FirebaseFirestore.instance.collection('data').doc();
//   final userData = User(
//     id: saveData.id,
//     userName: "kapil",
//     pregnancies: stringToDouble(pregnanciesController.text),
//     age: stringToDouble(ageController.text),
//     risk: risk,
//     bloodPressure: stringToDouble(bpController.text),
//     BMI: stringToDouble(bmiController.text),
//     diabetesPedegreeFunction: stringToDouble(dbController.text),
//     glucose: stringToDouble(glucoseController.text),
//     insulin: stringToDouble(insulinController.text),
//     skinThickness: stringToDouble(skinController.text),
//     date: DateTime.now(),
//   );
//   final json = userData.toJson();
//   await saveData.set(json);
// }
// }

class User {
  DateTime? date;
  String? id, userName;
  int? risk;
  double? pregnancies,
      glucose,
      bloodPressure,
      skinThickness,
      insulin,
      BMI,
      diabetesPedegreeFunction,
      age;
  User(
      {this.id = '',
      required this.date,
      required this.userName,
      required this.pregnancies,
      required this.age,
      required this.risk,
      required this.bloodPressure,
      required this.BMI,
      required this.diabetesPedegreeFunction,
      required this.glucose,
      required this.insulin,
      required this.skinThickness});
  Map<String, dynamic> toJson() => {
        "id": id,
        "disease": "diabetes",
        "userName": userName,
        "pregnancies": pregnancies,
        "glucose": glucose,
        "bloodPressure": bloodPressure,
        "skinThickness": skinThickness,
        "insulin": insulin,
        "BMI": BMI,
        "diabetesPedegreeFunction": diabetesPedegreeFunction,
        "age": age,
        "risk": risk,
        "date": date,
      };
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        userName: json['userName'],
        pregnancies: json['pregnancies'],
        age: json['age'],
        risk: json['risk'],
        bloodPressure: json['bloodPressure'],
        BMI: json['BMI'],
        diabetesPedegreeFunction: json['diabetesPedegreeFunction'],
        glucose: json['glucose'],
        insulin: json['insulin'],
        skinThickness: json['skinThickness'],
        date: (json['date'] as Timestamp).toDate(),
      );
}
