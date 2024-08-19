import 'package:flutter/material.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/annonces_page/widgets/dropdown.dart';
import 'package:kimo/pages/annonces_page/widgets/field.dart';

class StepFivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdown(label: "Villes"),
        CustomDropdown(label: "Quartier"),
        CustomTextField(
          label: "Prix",
          suffixIcon: Icon(Icons.attach_money),
        ),
      ],
    );
  }
}
