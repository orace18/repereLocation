import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/annonces_page/widgets/dropdown.dart';
import 'dart:io';

import 'package:kimo/pages/annonces_page/widgets/field.dart';
import 'package:kimo/pages/demandes_page/index.dart';

class StepTwoPage extends StatefulWidget {
  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  bool? isNegotiable = true;
  List<File> imageFiles = []; // Liste pour stocker les fichiers d'images sélectionnées

  final ImagePicker _picker = ImagePicker(); // Initialisation de ImagePicker

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFiles.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            // Logique de retour
          },
        ),
        title: Text("Annoncer / Étape 2"),
        centerTitle: true,
        backgroundColor: kimoBlanche,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                label: "Prix",
                suffixIcon: Icon(Icons.attach_money),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: RadioListTile(
                        title: Text("Négociable"),
                        value: true,
                        groupValue: isNegotiable,
                        onChanged: (value) {
                          setState(() {
                            isNegotiable = value as bool?;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: RadioListTile(
                        title: Text("Non négociable"),
                        value: false,
                        groupValue: isNegotiable,
                        onChanged: (value) {
                          setState(() {
                            isNegotiable = value as bool?;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              CustomTextField(
                label: "Téléphone (WhatsApp ou non)",
                suffixIcon: Icon(Icons.phone),
              ),
              SizedBox(height: 16.0),
              // Bouton d'ajout d'image
              OutlinedButton.icon(
                icon: Icon(Icons.add_a_photo),
                label: Text("Ajouter une image"),
                onPressed: _pickImage, // Appel de la méthode pour choisir une image
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: kimoBlanche,
                ),
              ),
              SizedBox(height: 8.0), // Espacement entre le bouton et les images
              if (imageFiles.isNotEmpty)
                Container(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageFiles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                          children: [
                            Image.file(
                              imageFiles[index],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    imageFiles.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              SizedBox(height: 16.0),
              CustomTextField(
                label: "Localisation",
                suffixIcon: Icon(Icons.location_on),
              ),
              SizedBox(height: 16.0),
              CustomDropdown(label: "Type"),
              SizedBox(height: 16.0),
              CustomDropdown(label: "Durée de visibilité"),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  // Logique pour soumettre le formulaire
                  Get.to(DemandePage());
                },
                child: Text("Soumettre", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
