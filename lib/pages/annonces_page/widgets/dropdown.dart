import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;

  CustomDropdown({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: [
          DropdownMenuItem(value: "Option 1", child: Text("Option 1")),
          DropdownMenuItem(value: "Option 2", child: Text("Option 2")),
        ],
        onChanged: (value) {
          // Logique de sélection
        },
      ),
    );
  }
}
