import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/annonces_page/widgets/dropdown.dart';
import 'package:kimo/pages/annonces_page/widgets/field.dart';

class StepOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: kimoGrise,),
          onPressed: () {
            // Logique de retour
          },
        ),
        title: Text("Annoncer / Étape 1"),
        centerTitle: true,
        backgroundColor: kimoBlanche,
      ),
      body: SingleChildScrollView(  // Ajout de SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(label: "Immobilier"),
              CustomTextField(
                label: "Caractéristiques",
                maxLines: 3,  // Limite à 3 lignes
                minLines: 1,  // Commence avec une seule ligne
              ),
              CustomTextField(label: "Superficie"),
              CustomTextField(label: "Pièces"),
              CustomTextField(label: "Chambre"),
              CustomTextField(label: "Ménage"),
              CustomTextField(label: "Mobilier"),
              CustomTextField(label: "Titre foncier"),
              CustomTextField(label: "Autres"),
              CustomDropdown(label: "Pays"),
              CustomDropdown(label: "Villes"),
              CustomDropdown(label: "Quartier"),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.toNamed("/steptwo");
                },
                child: Text("Suivant", style: TextStyle(color: kimoBlanche, fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: kimoBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
