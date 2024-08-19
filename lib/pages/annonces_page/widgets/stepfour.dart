import 'package:flutter/material.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/annonces_page/widgets/field.dart';
import 'package:kimo/pages/annonces_page/widgets/dropdown.dart';

class StepFourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(label: "Mobilier"),
        CustomTextField(label: "Titre foncier"),
        CustomTextField(label: "Autres"),
        CustomDropdown(label: "Pays"),
      ],
    );
  }
}
