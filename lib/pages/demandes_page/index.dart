import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:kimo/helpers/constantes.dart';

class DemandePage extends StatefulWidget {
  @override
  _RequestFormPageState createState() => _RequestFormPageState();
}

class _RequestFormPageState extends State<DemandePage> {
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

  InputDecoration _inputDecoration(String labelText, {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: labelText,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: kimoBlue,
          width: 2.0,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
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
        title: Text("Demande"),
        centerTitle: true,
        backgroundColor: kimoBlanche,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Champ pour le titre
              TextFormField(
                decoration: _inputDecoration('Chaise, chambre'),
              ),
              SizedBox(height: 16.0),
              
              // Champ pour les caractéristiques
              TextFormField(
                decoration: _inputDecoration('Caractéristiques'),
                maxLines: 4, // Permet d'avoir une zone de texte plus grande
              ),
              SizedBox(height: 16.0),
              
              // Champ pour le prix
              TextFormField(
                decoration: _inputDecoration('Prix', suffixIcon: Icon(Icons.attach_money)),
              ),
              SizedBox(height: 10.0),

              // Boutons radio pour Négociable/Non négociable
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: _boxDecoration(),
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
                  SizedBox(width: 10.0), // Ajout d'un espace entre les deux boutons radio
                  Expanded(
                    child: Container(
                      decoration: _boxDecoration(),
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
              
              // Dropdown pour sélection de la commune
              DropdownButtonFormField(
                decoration: _inputDecoration('Sélectionnez une commune'),
                items: ['Commune 1', 'Commune 2', 'Commune 3']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0),
              
              // Dropdown pour sélection de la ville
              DropdownButtonFormField(
                decoration: _inputDecoration('Sélectionnez une ville'),
                items: ['Ville 1', 'Ville 2', 'Ville 3']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0),

              // Dropdown pour sélection du quartier
              DropdownButtonFormField(
                decoration: _inputDecoration('Sélectionnez un quartier'),
                items: ['Quartier 1', 'Quartier 2', 'Quartier 3']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              SizedBox(height: 16.0),

              // Champ pour le téléphone
              TextFormField(
                decoration: _inputDecoration('Téléphone', suffixIcon: Icon(Icons.phone)),
              ),
              SizedBox(height: 16.0),

              // Bouton d'ajout d'image et affichage des images sélectionnées
              OutlinedButton.icon(
                icon: Icon(Icons.add_a_photo),
                label: Text("Ajouter des images"),
                onPressed: _pickImage,
              ),
              SizedBox(height: 8.0),

              // Affichage des images sélectionnées
              if (imageFiles.isNotEmpty)
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: imageFiles.map((file) {
                    return Stack(
                      children: [
                        Image.file(
                          file,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                imageFiles.remove(file);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              SizedBox(height: 16.0),

              // Durée de visibilité
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: _boxDecoration(),
                      child: RadioListTile(
                        title: Text("Jours"),
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
                  SizedBox(width: 16.0), // Ajout d'un espace entre les deux boutons radio
                  Expanded(
                    child: Container(
                      decoration: _boxDecoration(),
                      child: RadioListTile(
                        title: Text("Mois"),
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

              // Champ pour entrer la durée
              TextFormField(
                decoration: _inputDecoration('Entrez le nombre'),
              ),
              SizedBox(height: 20.0),

              // Bouton Soumettre
              OutlinedButton(
                onPressed: () {
                  // Logique pour soumettre le formulaire
                },
                child: Text(
                  "Soumettre",
                  style: TextStyle(color: kimoBlanche, fontWeight:  FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), backgroundColor: kimoBlue, // Couleur du bouton Soumettre
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


