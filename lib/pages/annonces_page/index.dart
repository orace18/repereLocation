import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/annonces_page/widgets/stepfive.dart';
import 'package:kimo/pages/annonces_page/widgets/stepfour.dart';
import 'package:kimo/pages/annonces_page/widgets/stepone.dart';
import 'package:kimo/pages/annonces_page/widgets/stepseven.dart';
import 'package:kimo/pages/annonces_page/widgets/stepsix.dart';
import 'package:kimo/pages/annonces_page/widgets/stepthree.dart';
import 'package:kimo/pages/annonces_page/widgets/steptwo.dart';
import 'package:kimo/pages/demandes_page/index.dart';

class MultiStepFormPage extends StatefulWidget {
  @override
  _MultiStepFormPageState createState() => _MultiStepFormPageState();
}

class _MultiStepFormPageState extends State<MultiStepFormPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Annonces"),
        backgroundColor: kimoBlanche,

      ),
      body: Column(
        children: [
          EasyStepper(
            activeStep: currentStep,
            activeStepBorderColor: Color(0xFF2B662D),
            activeStepIconColor: kimoBlue,
            finishedStepBackgroundColor: kimoBlue,
            steps: [
              EasyStep(title: 'Étape 1', icon: Icon(Icons.looks_one, color: kimoBlue,)),
              EasyStep(title: 'Étape 2', icon: Icon(Icons.looks_two, color: kimoBlue)),
              EasyStep(title: 'Étape 3', icon: Icon(Icons.looks_3, color: kimoBlue)),
              EasyStep(title: 'Étape 4', icon: Icon(Icons.looks_4, color: kimoBlue)),
              EasyStep(title: 'Étape 5', icon: Icon(Icons.looks_5, color: kimoBlue)),
              EasyStep(title: 'Étape 6', icon: Icon(Icons.looks_6, color: kimoBlue)),
              EasyStep(title: 'Étape 7', icon: Icon(Icons.check_box, color: kimoBlue)),
            ],
            onStepReached: (index) {
              setState(() {
                currentStep = index;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Ajout de la marge
                child: getStepPage(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 0)
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        currentStep--;
                      });
                    },
                    child: Text("Précédent"),
                  ),
                OutlinedButton(
                  onPressed: () {
                    if (currentStep < 6) {
                      setState(() {
                        currentStep++;
                      });
                    } else {
                      // Logique de soumission finale du formulaire
                      Get.to(DemandePage());
                    }
                  },
                  style: OutlinedButton.styleFrom(
                        backgroundColor: kimoBlue,
                        minimumSize: Size(200, 50),
                      ),
                  child: Text(currentStep == 6 ? "Soumettre" : "Suivant", style: TextStyle(color: kimoBlanche, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getStepPage() {
    switch (currentStep) {
      case 0:
        return StepOnePage();
      case 1:
        return StepTwoPage();
      case 2:
        return StepThreePage();
      case 3:
        return StepFourPage();
      case 4:
        return StepFivePage();
      case 5:
        return StepSixPage();
      case 6:
        return StepSevenPage();
      default:
        return StepOnePage();
    }
  }
}
