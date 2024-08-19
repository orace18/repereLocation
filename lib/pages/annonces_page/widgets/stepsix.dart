import 'package:flutter/material.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/annonces_page/widgets/dropdown.dart';
import 'package:kimo/pages/annonces_page/widgets/field.dart';

class StepSixPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(label: "Téléphone (WhatsApp ou non)", suffixIcon: Icon(Icons.phone)),
        CustomDropdown(label: "Type"),
        CustomDropdown(label: "Durée de visibilité"),
      ],
    );
  }
}
