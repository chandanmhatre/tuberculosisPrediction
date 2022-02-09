import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';
import 'package:tuberculosis_prediction/screens/authScreens/login-screen.dart';
import 'package:tuberculosis_prediction/screens/bmi-calculator.dart';
import 'package:tuberculosis_prediction/screens/news-screen.dart';
import 'package:tuberculosis_prediction/screens/prediction-page.dart';
import 'package:tuberculosis_prediction/screens/side-effect.dart';

import 'about-tb.dart';
import 'nutrition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
          appBar:
              WidgetUtils.buildAppBar(context, "Tuberculosis Prediction App",
                  action: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerTheme: const DividerThemeData(
                          color: Colors.black,
                        ),
                      ),
                      child: PopupMenuButton<int>(
                        elevation: 5,
                        padding: const EdgeInsets.only(right: 20),
                        offset: const Offset(0, 60),
                        itemBuilder: (context) => [
                          PopupMenuItem<int>(
                            value: 0,
                            child: Row(
                              children: const [
                                Icon(Icons.logout, color: Colors.redAccent),
                                SizedBox(width: 8),
                                Text(
                                  'Sign Out',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                        onSelected: (value) async {
                          if (value == 0) {
                            await FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                (Route<dynamic> route) => false);
                          }
                        },
                      ),
                    ),
                  ],
                  icon: null),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    card("Predict Tuberculosis", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PredictionScreen()));
                    }, 'assets/images/tb.png'),
                    const SizedBox(width: 20),
                    card("Health News", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsScreen()));
                    }, 'assets/images/news.png')
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    card("Information about TB", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutTBScreen()));
                    }, 'assets/images/info.png'),
                    const SizedBox(width: 20),
                    card("Side Effects", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SideEffectScreen()));
                    }, 'assets/images/side-effects.png')
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    card("Nutrition Advice", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NutritionAdvice()));
                    }, 'assets/images/nutrition.png'),
                    const SizedBox(width: 20),
                    card("BMI calculator", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BMICalculator()));
                    }, 'assets/images/bmi.png')
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          )),
    ));
  }

  Widget card(String label, Function()? onTap, String imgPath) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.lightBlue.shade50,
        elevation: 5,
        child: SizedBox(
          height: height * .2,
          width: width * .4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: height * .12,
                  width: width * .28,
                  child: Image.asset(imgPath, fit: BoxFit.fill)),
              const SizedBox(height: 20),
              FittedBox(
                  child: Text(
                label,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
