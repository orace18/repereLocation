import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final int? maxLines;  // Paramètre optionnel pour définir maxLines
  final int? minLines;  // Paramètre optionnel pour définir minLines
  final Icon? suffixIcon;  // Paramètre optionnel pour l'icône à droite

  CustomTextField({
    required this.label,
    this.maxLines,  // Initialisation du paramètre maxLines
    this.minLines,  // Initialisation du paramètre minLines
    this.suffixIcon,  // Initialisation du paramètre suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        maxLines: maxLines,  // Applique maxLines si défini
        minLines: minLines,  // Applique minLines si défini
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          suffixIcon: suffixIcon,  // Applique l'icône à droite si définie
        ),
      ),
    );
  }
}
