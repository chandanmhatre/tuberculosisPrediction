import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';
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
          appBar: WidgetUtils.buildAppBar(
              context, "Tuberculosis Prediction App",
              icon: null),
          body: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  card(
                    "Information about TB",
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutTBScreen()));
                    },
                  ),
                  const SizedBox(width: 20),
                  card(
                    "Side Effects",
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SideEffectScreen()));
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  card(
                    "Nutrition Advice",
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NutritionAdvice()));
                    },
                  ),
                  const SizedBox(width: 20),
                  card(
                    "BMI calculator",
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BMICalculator()));
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  card(
                    "Predict Tuberculosis",
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PredictionScreen()));
                    },
                  ),
                  const SizedBox(width: 20),
                  card(
                    "Health News",
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsScreen()));
                    },
                  )
                ],
              ),
            ],
          )),
    ));
  }

  Widget card(String label, Function()? onTap) {
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
              const Icon(FontAwesomeIcons.info, size: 70),
              const SizedBox(height: 30),
              FittedBox(
                  child: Text(
                label,
                style: const TextStyle(color: Colors.blue),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
