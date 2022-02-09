import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';

class SideEffectScreen extends StatefulWidget {
  const SideEffectScreen({Key? key}) : super(key: key);

  @override
  _SideEffectScreenState createState() => _SideEffectScreenState();
}

class _SideEffectScreenState extends State<SideEffectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: WidgetUtils.buildAppBar(context, "Side Effects"),
            body: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 30),
                Center(
                  child: Card(
                    child: Container(
                        color: Colors.lightBlue.shade50,
                        width: MediaQuery.of(context).size.width * .9,
                        child: Column(
                          children: const [
                            SizedBox(height: 20),
                            Text(
                              'Important Information :',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  '1) Not Everyone suffers from Unpleasant Side Effects.\n\n2) If you get side effects, mild ones will disappear with time. If you continue to experience unpleasant feelings or side effects, please inform your Treatment supporter, ASHA, ANM or doctor.\n\n3) Early action prevents side effects.\n\n4) Irregular and inappropriate TB treatment makes you prone to develop Drug Resistant TB.\n\n5) Do not Share your Drugs or advice treatment to others.\n\n6) Do not Smoke or Drink alcohol as it can worsen the side effects.\n\n7)Always carry your TB Patient-ID card with you.'),
                            ),
                            SizedBox(height: 20),
                          ],
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('List of side effects',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                WidgetUtils.expandedCard(
                    "Nausea/Vomiting/Loose Stools/ Diarrhoea",
                    'Take medicines embedded in banana.\n\nDo not take all the medicines together.\n\nTake medicines with little water or milk at bed time.\n\nAvoid smoking and drinking alcohol.\n\nStay hydrated (drink enough water).\n\nEat nutritious food.\n\nEat nutritious food.\n\nDo not stop or reduce the dose of anti-TB.\n\nmedicines on your own.\n\nInform your Treatment Supporter, healthcare worker or doctor without any delay'),
                WidgetUtils.expandedCard(
                    'Lose of Appetite', 'May indicate harm to liver'),
                WidgetUtils.expandedCard('Burning/Numbness in Hands and Feet',
                    'Inform and consult your Treatment Supporter, healthcare worker or doctor.\n\nCan be prevented by taking vitamin B6 on doctor advice'),
                WidgetUtils.expandedCard('Flu like symptoms',
                    'Usually mild and subsides on its own.\n\nMay be due to flu infection.Inform and consult your Treatment Supporter, healthcare worker or doctor'),
                WidgetUtils.expandedCard('Itching and Rashes',
                    'Apply moisturizing cream.\n\nDo not expose rashes to sunlight.\n\nRashes usually subside with time.\n\nIf rash develops in the mouth or nose or involves very large body area or is associated with fever;inform and consult your Treatment Supporter, healthcare worker or doctor immediately'),
                WidgetUtils.expandedCard('Reduced Vision',
                    'Inform and consult your Treatment Supporter, healthcare worker or doctor immediately.\n\nUsually resolves on stopping Ethambutol.\n\nIf Ethambutol is stopped, it needs to be replaced by another drug to fully treat TB'),
                WidgetUtils.expandedCard('Pain in joins/muscles/tendons',
                    'Usually harmless, Can be treated with pain killers.\n\nInform and consult your Treatment Supporter, healthcare worker or doctor immediately'),
                WidgetUtils.expandedCard('Swelling of face/neck',
                    'Inform and consult your Treatment Supporter, healthcare worker or doctor'),
                WidgetUtils.expandedCard('Tiredness/ Lethargy',
                    'Inform and consult your Treatment Supporter, healthcare worker or doctor.\n\nNeeds to be evaluated and can be treated with nutritious food and appropriate drugs'),
                WidgetUtils.expandedCard('Convolution/ Suicidal Thoughts',
                    'Inform and consult your Treatment Supporter, healthcare worker or doctor immediately')
              ]),
            )));
  }
}
