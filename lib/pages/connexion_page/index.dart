import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:kimo/helpers/constantes.dart';

class ConnexionPage extends StatefulWidget {

  @override
  _ConnexionPageState createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage>{

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kimoBlue,
      body: Column(
        children: [
          AppBar(
            leading: Icon(Icons.chevron_left, size: 30),
            title: Text("Connexion", style: TextStyle(color: kimoBlanche)),
            backgroundColor: kimoBlue,
            elevation: 0,
            toolbarHeight: 100,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(width: 0.5),
                        ),
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.email),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'password',
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(width: 0.5),
                        ),
                        hintText: 'Mot de passe',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 16),

                    SizedBox(height: 32),
                    OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          // Handle login logic
                          Get.offAllNamed("/home");
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: kimoBlue,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'Se connecter',
                        style: TextStyle(color: kimoBlanche),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(thickness: 1, color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('ou', style: TextStyle(color: Colors.grey)),
                        ),
                        Expanded(
                            child: Divider(thickness: 1, color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {
                        Get.toNamed("/inscription");
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: kimoBlue),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'S\'inscrire',
                        style: TextStyle(color: kimoBlue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
