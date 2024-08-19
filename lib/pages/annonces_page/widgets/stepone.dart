import 'package:flutter/material.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/annonces_page/widgets/field.dart';

class StepOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(label: "Immobilier"),
        CustomTextField(
          label: "Caractéristiques",
          maxLines: 3,
          minLines: 1,
        ),
      ],
    );
  }
}
