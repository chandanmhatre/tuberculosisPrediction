// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:tuberculosis_prediction/screens/hardcore-prediction-page.dart';
//
// class NowDrawer extends StatefulWidget {
//   const NowDrawer({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<NowDrawer> createState() => _NowDrawerState();
// }
//
// class _NowDrawerState extends State<NowDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: Container(
//       color: const Color.fromARGB(255, 65, 191, 255),
//       child: Column(children: [
//         SizedBox(
//             height: MediaQuery.of(context).size.height * 0.1,
//             width: MediaQuery.of(context).size.width * 0.85,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 24.0, right: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.baseline,
//                 textBaseline: TextBaseline.alphabetic,
//                 children: [
//                   Image.asset("assets/images/logo.png"),
//                 ],
//               ),
//             )),
//         const Divider(height: 50, thickness: 2),
//         listTile(
//             const Icon(FontAwesomeIcons.disease),
//             "Previous Prediction",
//             () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const PredictionScreen()))),
//       ]),
//     ));
//   }
//
//   ListTile listTile(
//     Icon? icon,
//     String label,
//     Function()? onTap,
//   ) {
//     return ListTile(
//         leading: icon,
//         title: Text(
//           label,
//           style: const TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         onTap: onTap);
//   }
//
//   addStaticMenu(String menuName, IconData? icon, Function()? onTap) {
//     return ListTile(
//         leading: Icon(
//           icon,
//           color: Colors.white,
//         ),
//         title: Text(
//           menuName,
//           style: const TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         onTap: onTap);
//   }
// }
