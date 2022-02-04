import 'package:flutter/material.dart';
import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';

class NutritionAdvice extends StatefulWidget {
  const NutritionAdvice({Key? key}) : super(key: key);

  @override
  _NutritionAdviceState createState() => _NutritionAdviceState();
}

class _NutritionAdviceState extends State<NutritionAdvice> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: WidgetUtils.buildAppBar(context, "Nutrition Advice"),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: Card(
                          child: Container(
                              color: Colors.blue.shade50,
                              width: MediaQuery.of(context).size.width * .9,
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const Text(
                                    "Food & TB",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: RichText(
                                        text: const TextSpan(
                                            text:
                                                'There is no special food that is required by a person with TB. A person with TB does not need special food, although they they should try and have a balanced diet.',
                                            style:
                                                TextStyle(color: Colors.black),
                                            children: [
                                          TextSpan(
                                              text:
                                                  '\n\nSome people with TB believe that more expensive foods are better than less expensive ones. This is not true. For example, it is not true that expensive varieties of rice are better than cheaper ones.'),
                                          TextSpan(
                                              text:
                                                  '\n\nThere are also no foods that can cure TB. Some people say that foods such as vinegar can cure TB but this is not correct. It is only TB drugs that can cure TB.'),
                                          TextSpan(
                                              text:
                                                  '\n\nIt is often better that a person with TB has the same diet as normal but possibly with some changes being made to increase their intake of food. People with TB often have a poor appetite initially, but having more frequent food intake can be helpful.'),
                                          TextSpan(
                                              text:
                                                  '\n\nWithin a few weeks of starting TB treatment, the person’s appetite should increase and come back to normal. A person with TB should aim to have three meals and three snacks each day to increase the amount of food they eat.'),
                                        ])),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: WidgetUtils.expandedCard(
                            "A healthy balanced diet for a person with TB.",
                            'A person with TB should aim to have a healthy balanced diet. A healthy balanced diet can be achieved by having foods from four basic food groups. These are:\n\n  1) Cereals, millets and pulses.\n\n  2) Vegetables and fruits.\n\n  3) Milk and milk products, meat, eggs & fish.\n\n  4) Oils, fats and nuts and oils seeds.\n\nA food group is a collection of foods that share similar nutritional properties. If the food eaten contains food from all the above food groups, then the diet is considered healthy. Not all the food groups need to be eaten at every meal.'),
                      ),
                      const Text(
                        "Food & TB, essential nutrients",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
