import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:na/pages/registration_page.dart';

import '../common/theme_helper.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'widgets/header_widget.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  // pour stocker les valeurs des champs saisir par utilisateur
  TextEditingController userNameController = TextEditingController();
  TextEditingController userLastNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 160,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 70, 30, 20),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                      ),
                      Container(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: ThemeHelper()
                              .textInputDecoration('Nom', 'Entrez votre Nom'),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: 'error'),
                            ],
                          ),
                          controller: userLastNameController,
                        ),
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        //key: formstate,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: ThemeHelper().textInputDecoration(
                              'Prenom', 'Entrez votre Prenom'),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: 'error'),
                            ],
                          ),
                          controller: userNameController,
                        ),
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        child: TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                              "E-mail", "Entrez votre E-mail"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (!(val!.isEmpty) &&
                                !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    .hasMatch(val)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                          controller: userEmailController,
                        ),
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        child: TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                              "Num de téléphone",
                              "Entrez votre num de téléphone"),
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (!(val!.isEmpty) &&
                                !RegExp(r"^(\d+)*$").hasMatch(val)) {
                              return "Enter a valid phone number";
                            }
                            return null;
                          },
                          controller: userPhoneController,
                        ),
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration(
                              "Mot de passe*", "Entrez votre mot de passe"),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: 'error'),
                            ],
                          ),
                          controller: userPasswordController,
                        ),
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                      SizedBox(height: 15.0),
                      FormField<bool>(
                        builder: (state) {
                          return Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: checkboxValue,
                                      onChanged: (value) {
                                        setState(() {
                                          checkboxValue = value!;
                                          state.didChange(value);
                                        });
                                      }),
                                  Text(
                                    "J'ai lu et j'accepte tous les conditions",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  state.errorText ?? '',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Theme.of(context).errorColor,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        validator: (value) {
                          if (!checkboxValue) {
                            return 'You need to accept terms and conditions';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "ENREGISTRER".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              _FormKey.currentState?.validate();
                              var userName = userNameController.text.trim();
                              var userLastName =
                                  userLastNameController.text.trim();
                              var userPhone = userPhoneController.text.trim();
                              var userEmail = userEmailController.text.trim();
                              var userPassword =
                                  userPasswordController.text.trim();

                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: userEmail, password: userPassword)
                                  .then((value) => {
                                        log("user created"),
                                        FirebaseFirestore.instance
                                            .collection("users")
                                            .doc()
                                            .set({
                                          'userName': userName,
                                          'userLastName': userLastName,
                                          'userPhone': userPhone,
                                          'userEmail': userEmail,
                                          'userPassword': userPassword,
                                          'createdAt': DateTime.now(),
                                        }),
                                        log("Data Added"),
                                      });

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            }),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void AwesomeDialoge(
      {required BuildContext context,
      required String Title,
      required Text Body}) {}
}
