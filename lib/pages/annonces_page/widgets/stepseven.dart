import 'package:flutter/material.dart';
import 'package:kimo/helpers/constantes.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StepSevenPage extends StatefulWidget {
  @override
  _StepSevenPageState createState() => _StepSevenPageState();
}

class _StepSevenPageState extends State<StepSevenPage> {
  List<File> imageFiles = [];
  final ImagePicker _picker = ImagePicker();

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
    return Column(
      children: [
        OutlinedButton.icon(
          icon: Icon(Icons.add_a_photo),
          label: Text("Ajouter une image"),
          onPressed: _pickImage,
        ),
        SizedBox(height: 8.0),
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
      ],
    );
  }
}
