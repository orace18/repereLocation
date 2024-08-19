import 'package:flutter/material.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/annonces_page/widgets/field.dart';

class StepThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(label: "Chambre"),
        CustomTextField(label: "Ménage"),
      ],
    );
  }
}
