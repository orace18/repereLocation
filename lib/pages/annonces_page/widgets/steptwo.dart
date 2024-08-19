import 'package:flutter/material.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:kimo/pages/annonces_page/widgets/field.dart';

class StepTwoPage extends StatefulWidget {
  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  bool isNegotiable = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(label: "Superficie"),
          CustomTextField(label: "Pièces"),
          SizedBox(height: 16.0),
          Text("Est-ce négociable ?"),
          SwitchListTile(
            title: Text("Négociable"),
            value: isNegotiable,
            onChanged: (value) {
              setState(() {
                isNegotiable = value;
              });
            },
            activeColor: kimoBlue,
          ),
        ],
      ),
    );
  }
}
