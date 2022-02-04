// import 'package:flutter/material.dart';
// import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';
// import 'package:tuberculosis_prediction/Utils/drawer.dart';
//
// class PredictionScreen extends StatefulWidget {
//   const PredictionScreen({Key? key}) : super(key: key);
//
//   @override
//   _PredictionScreenState createState() => _PredictionScreenState();
// }
//
// class _PredictionScreenState extends State<PredictionScreen> {
//   final GlobalKey<FormState> _key = GlobalKey<FormState>();
//   List dropDownItem = ['true', 'false'];
//   Map diseaseMap = {};
//   List diseaseLength = [];
//   String fever = '',
//       sickness = '',
//       weightLoss = '',
//       nightSweats = '',
//       pain = '',
//       appetite = '',
//       chills = '';
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: WillPopScope(
//         onWillPop: () => Future(() => false),
//         child: Scaffold(
//           appBar: WidgetUtils.buildAppBar(
//               context, "Tuberculosis Prediction App",
//               isDrawer: true),
//           endDrawer: const NowDrawer(),
//           body: GestureDetector(
//             onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//             child: Form(
//               key: _key,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     WidgetUtils.dropDownButton("Loss of appetite",
//                         "Loss of appetite", appetite, dropDownItem, (v) {
//                       setState(() {
//                         appetite = v;
//                         if (v == 'true') {
//                           diseaseMap['appetite'] = v.toString();
//                         } else {
//                           diseaseMap.remove('appetite');
//                         }
//                       });
//                     }, validator: (v) => validator(v)),
//                     WidgetUtils.dropDownButton(
//                         "fever", "fever", fever, dropDownItem, (v) {
//                       setState(() {
//                         fever = v;
//                         if (v == 'true') {
//                           diseaseMap['fever'] = v.toString();
//                         } else {
//                           diseaseMap.remove('fever');
//                         }
//                       });
//                     }, validator: (v) => validator(v)),
//                     WidgetUtils.dropDownButton("sickness or weakness",
//                         "sickness or weakness", sickness, dropDownItem, (v) {
//                       setState(() {
//                         sickness = v;
//                         if (v == 'true') {
//                           diseaseMap['sickness'] = v.toString();
//                         } else {
//                           diseaseMap.remove('sickness');
//                         }
//                       });
//                     }, validator: (v) => validator(v)),
//                     WidgetUtils.dropDownButton(
//                         "weight loss", "weight loss", weightLoss, dropDownItem,
//                         (v) {
//                       setState(() {
//                         weightLoss = v;
//                         if (v == 'true') {
//                           diseaseMap['weightLoss'] = v.toString();
//                         } else {
//                           diseaseMap.remove('weightLoss');
//                         }
//                       });
//                     }, validator: (v) => validator(v)),
//                     WidgetUtils.dropDownButton("night sweats", "night sweats",
//                         nightSweats, dropDownItem, (v) {
//                       setState(() {
//                         nightSweats = v;
//                         if (v == 'true') {
//                           diseaseMap['nightSweats'] = v.toString();
//                         } else {
//                           diseaseMap.remove('nightSweats');
//                         }
//                       });
//                     }, validator: (v) => validator(v)),
//                     WidgetUtils.dropDownButton(
//                         "pain with breathing or coughing",
//                         "pain with breathing or coughing",
//                         pain,
//                         dropDownItem, (v) {
//                       setState(() {
//                         pain = v;
//                         if (v == 'true') {
//                           diseaseMap['pain'] = v.toString();
//                         } else {
//                           diseaseMap.remove('pain');
//                         }
//                       });
//                     }, validator: (v) => validator(v)),
//                     WidgetUtils.dropDownButton(
//                         "Chills", "Chills", chills, dropDownItem, (v) {
//                       setState(() {
//                         chills = v;
//                         if (v == 'true') {
//                           diseaseMap['chills'] = v.toString();
//                         } else {
//                           diseaseMap.remove('chills');
//                         }
//                       });
//                     }, validator: (v) => validator(v)),
//                     WidgetUtils.styledButton(
//                         'Get Results', () => getPredictions()),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   validator(v) {
//     if (v == null) {
//       return 'required';
//     }
//   }
//
//   getPredictions() async {
//     if (_key.currentState!.validate()) {
//       if (fever == 'true' &&
//           sickness == 'true' &&
//           appetite == "true" &&
//           weightLoss == 'true') {
//         return WidgetUtils.confirmDialog(
//             'You have high risk of having tuberculosis disease',
//             () => null,
//             context);
//       } else if (fever == 'true' && sickness == 'true' && appetite == "true" ||
//           weightLoss == 'true' && pain == 'true' && appetite == "true") {
//         return WidgetUtils.confirmDialog(
//             'You have risk of having tuberculosis disease',
//             () => null,
//             context);
//       } else if (appetite == 'true' && pain == 'true' ||
//           appetite == 'true' && fever == 'true') {
//         return WidgetUtils.confirmDialog(
//             'You have risk of having tuberculosis disease',
//             () => null,
//             context);
//       } else if (appetite != 'true' &&
//           pain != 'true' &&
//           weightLoss != "true" &&
//           fever != 'true') {
//         return WidgetUtils.confirmDialog(
//             'You have no risk of having tuberculosis disease',
//             () => null,
//             context);
//       } else if (diseaseMap.length >= 4) {
//         return WidgetUtils.confirmDialog(
//             'You have risk of having tuberculosis disease',
//             () => null,
//             context);
//       } else {
//         return WidgetUtils.confirmDialog(
//             'You have no risk of having tuberculosis disease',
//             () => null,
//             context);
//       }
//     }
//   }
// }
