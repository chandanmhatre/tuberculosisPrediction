import 'package:flutter/material.dart';
import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';

class AboutTBScreen extends StatefulWidget {
  const AboutTBScreen({Key? key}) : super(key: key);

  @override
  _AboutTBScreenState createState() => _AboutTBScreenState();
}

class _AboutTBScreenState extends State<AboutTBScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: WidgetUtils.buildAppBar(context, "Information About TB"),
            body: ListView(
              children: [
                WidgetUtils.expandedCard('What is tuberculosis?',
                    'TB is a serious disease caused by a germ (bacteria) that spreads through the air when a person with active TB disease in their lungs coughs, sneezes, sings or talks.'),
                WidgetUtils.expandedCard('What are the types of TB?',
                    'TB is of two types- Pulmonary and Extra pulmonary. \nTB of the lungs is called Pulmonary TB and accounts for 80% of all TB cases.\n\nTB affecting any other part/organ of the body like brain, lymph nodes, bones, joints, kidneys,larynx, intestines, eyes etc. is called Extra-pulmonary TB.\n\nOnly microbiological confirmed pulmonary TB patients are infectious. Patients can suffer from both pulmonary and extra-pulmonary TB simultaneously.'),
                WidgetUtils.expandedCard('How does TB spread?',
                    'Although TB is an infectious disease, all forms of TB are not infectious.\n\nWhen a pulmonary microbiological confirmed TB patient coughs or sneezes, TB bacteria spread into the air as droplets. People nearby may breathe in these bacteria and become infected.\n\n An intfectious case of TB, if untreated, can infect 10-15 people in one year.\n\nextra-pulmonary TB is not infectious.\n\nTB does not spread through handshakes, using public toilets, sharing food and utensils,blood transfusion and casual contact.'),
                WidgetUtils.expandedCard('What are the risk factors for TB?',
                    'Close prolonged contact with a sputum positive pulmonary TB patient.\nOvercrowding\nSmoking\nHIV infection\nMalnutrition\nDiabetes Mellitus\nPatients on immunosuppressive drugs (anti-cancer, Corticosteroids etc.)\nCertain lung diseases like Silicosis'),
                WidgetUtils.expandedCard(
                    'What is the difference between TB infection and TB disease?',
                    'In most people who breathe in TB bacteria the body immune system is able to fight the TB bacteria and stop them from multiplying. This is called TB infection. People who are infected with TB do not feel sick, do not have any symptoms and cannot spread TB.\n\nIf an infected person immune system cannot stop the bacteria from multiplying, the bacteria eventually cause symptoms of active TB which is called TB disease. Only 10% of all people with TB infection may suffer from the TB disease.\n\nPeople with conditions like HIV, Diabetes Mellitus, Malnutrition and those on treatment with immunosuppressant drugs (anti-cancer, corticosteroids etc) are at a greater risk of developing TB disease once infected.'),
                WidgetUtils.expandedCard(
                    'Generally which age group is more affected by TB?',
                    'TB can occur at any age but is commonly seen in persons between 15-45 years of age which is the economically productive age group.\n\nDisease occurs in both the genders. However, males are affected more as compared to females.'),
                WidgetUtils.expandedCard('What are the symptoms of TB?',
                    'Symptoms of TB are specific to the site affected although there are some symptoms common to all types of TB.\n\nSymptoms of Pulmonary TB are: Persistent cough for 2 weeks or more\nChest pain\nShortness of breath Blood in sputum\n\nSymptoms of Extra Pulmonary TB depend on the site/organ involved.\nBrain TB- Meningitis\nLymph node TB-Enlarged Lymph nodes\nBone TB- Destruction of bones and Joints.\nAbdominal TB -Intestinal Obstruction\n\nCommon symptoms:\nWeight loss\nFatigue\nEvening rise of temperature (Fever)'),
                WidgetUtils.expandedCard('Is TB curable?',
                    "TB is completely curable if the prescribed drugs are taken for the full duration."),
                WidgetUtils.expandedCard('What treatment is available for TB?',
                    "TB is treated through a combination of following drugs:\nIsoniazid (INH)\nRifampicin\nPyrazinamide\nEthambutol\nStreptomycin\n\nCombination of drugs is administered to kill all the bacteria and prevent them from becoming resistant to one or more drugs.\nThe treatment is given for 6-9 months."),
                WidgetUtils.expandedCard(
                    'Are there any side effects of anti TB treatment?',
                    "Very few people develop side-effects to anti TB drugs.\n\nMost of these side-effects are minor and include vomiting, nausea, loss of appetite, joint pain, orange/red urine and skin rash. These can be easily managed with simple medicines and without stopping the anti TB drugs.\nIn some very rare cases serious side effects like deafness and jaundice may develop which may require temporary withdrawal of some of the anti TB drugs."),
                WidgetUtils.expandedCard('Is there a vaccine for TB?',
                    "CG (Bacille Calmette-Guerin) vaccine is currently the only vaccine available against TB.\nThough BCG appears to reduce the risk of serious childhood forms of TB it is not effective in preventing TB in adults and children."),
                WidgetUtils.expandedCard(' How can TB be prevented?',
                    'In the absence of an effective vaccine the only way to prevent TB is by early detection and treatment of infectious TB patients.\nPatients with sputum positive pulmonary disease should cover their mouth while coughing, sneezing and talking to reduce the transmission of TB bacteria.'),
                WidgetUtils.expandedCard('How are TB and HIV related?',
                    'HIV is the strongest risk factor for tuberculosis among adults as it debilitates the immune system.\nAn HIV positive person is 20-40 times more likely to develop TB disease once infected with TB bacilli as compared to an HIV negative person.')
              ],
            )));
  }
}
