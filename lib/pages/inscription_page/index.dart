import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:kimo/helpers/constantes.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kimoBlue, // Background color for the entire screen
      body: Column(
        children: [
          AppBar(
            title: Text(
              "Inscription",
              style: TextStyle(color: kimoBlanche),
            ),
            leading: Icon(Icons.chevron_left, size: 30),
            backgroundColor: kimoBlue,
            elevation: 0,
            toolbarHeight: 100, // Increase the height of the AppBar
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
                child: ListView(
                  children: [
                    // User type dropdown with chevron icon
                    FormBuilderDropdown(
                      name: 'user_type',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(width: 0.5),
                        ),
                        hintText: 'Choisir le type utilisateur',
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      items: [
                        DropdownMenuItem(
                            value: 'UserType1', child: Text('User Type 1')),
                        DropdownMenuItem(
                            value: 'UserType2', child: Text('User Type 2')),
                      ],
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 16),

                    // Full name field
                    FormBuilderTextField(
                      name: 'fullname',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(width: 0.5),
                        ),
                        hintText: 'Nom et Prénom',
                        suffixIcon: Icon(Icons.person),
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 16),

                    // Phone number field
                    FormBuilderTextField(
                      name: 'phone',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(width: 0.5),
                        ),
                        hintText: 'Téléphone',
                        suffixIcon: Icon(Icons.phone),
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 16),

                    // Country dropdown with chevron icon
                    FormBuilderDropdown(
                      name: 'country',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(width: 0.5),
                        ),
                        hintText: 'Pays',
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      items: [
                        DropdownMenuItem(
                            value: 'Country1', child: Text('Country 1')),
                        DropdownMenuItem(
                            value: 'Country2', child: Text('Country 2')),
                      ],
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 16),

                    // Email field
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

                    // Password field with toggle visibility
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

                    // Confirm password field with toggle visibility
                    FormBuilderTextField(
                      name: 'confirm_password',
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(width: 0.5),
                        ),
                        hintText: 'Confirmer votre mot de passe',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 16),

                    // Terms and conditions checkbox
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: FormBuilderCheckbox(
                        name: 'accept_terms',
                        initialValue: false,
                        title: Text(
                          "En cliquant sur terminer vous acceptez nos termes et conditions générales d'utilisation",
                        ),
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        validator: FormBuilderValidators.required(
                          errorText:
                              "Vous devez accepter les termes et conditions",
                        ),
                      ),
                    ),
                    SizedBox(height: 32),

                    // Sign-up button
                    OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ??
                            false) {
                          // Handle signup logic
                          Get.offAllNamed("/home");
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: kimoBlue,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text('S\'inscrire',
                          style: TextStyle(color: kimoBlanche)),
                    ),
                    SizedBox(height: 16),

                    // Divider with "ou" text
                    Row(
                      children: [
                        Expanded(
                            child: Divider(thickness: 1, color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('ou',
                              style: TextStyle(color: Colors.grey)),
                        ),
                        Expanded(
                            child: Divider(thickness: 1, color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Log in button
                    OutlinedButton(
                      onPressed: () {
                        Get.toNamed('/connexion');
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: kimoBlue),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        'Se connecter',
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
