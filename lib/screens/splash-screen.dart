import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuberculosis_prediction/screens/authScreens/login-screen.dart';

import 'home-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    waitAndNavigate();
  }

  waitAndNavigate() async {
    await Future.delayed(const Duration(milliseconds: 1200), () {});
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: Image.asset(
          'assets/images/tb.png',
          fit: BoxFit.contain,
        ),
      )),
    ));
  }
}
