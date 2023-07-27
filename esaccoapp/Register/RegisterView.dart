// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterView extends StatefulWidget {
  final String userId;
  RegisterView({required this.userId});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController ninNoController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.userId);
    return Container(
        child: Scaffold(
            backgroundColor: Colors.green.shade900,
            body: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Gap(80),
                      Text(
                        'Welcome on board!',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Gap(30),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  controller: fNameController,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      filled: true,
                                      hintStyle: TextStyle(color: Colors.grey),
                                      hintText: 'first name',
                                      fillColor: Colors.white),
                                  validator: (value) => value!.isNotEmpty
                                      ? null
                                      : "Please enter your name",
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  controller: lNameController,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      filled: true,
                                      hintStyle: TextStyle(color: Colors.grey),
                                      hintText: 'last name',
                                      fillColor: Colors.white),
                                  validator: (value) => value!.isNotEmpty
                                      ? null
                                      : "Please enter your name",
                                ),
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: ninNoController,
                          decoration: InputDecoration(
                              // suffixIcon: Icon(Icons.email_outlined),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'NIN number',
                              fillColor: Colors.white),
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : "Please enter your nin",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          //  obscureText: true,
                          enableSuggestions: false,
                          controller: contactController,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.call),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'Phone number',
                              fillColor: Colors.white),
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : "Please enter your contact",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          //  obscureText: true,
                          enableSuggestions: false,
                          // controller: _password,
                          decoration: InputDecoration(
                              //suffixIcon: Icon(Icons.remove_red_eye_sharp),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'Bank account no.',
                              fillColor: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          // obscureText: true,
                          enableSuggestions: false,
                          controller: cityController,
                          decoration: InputDecoration(
                              //   suffixIcon: Icon(Icons.map),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'City',
                              fillColor: Colors.white),
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : "Please enter your city",
                        ),
                      ),
                      Gap(20),
                      Text(
                        'Next of kin',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          // obscureText: true,
                          enableSuggestions: false,
                          // controller: _password,
                          decoration: InputDecoration(
                              //suffixIcon: Icon(Icons.remove_red_eye_sharp),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'Enter fullname',
                              fillColor: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          //   obscureText: true,
                          enableSuggestions: false,
                          // controller: _password,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.call),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'Phone number',
                              fillColor: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          // obscureText: true,
                          enableSuggestions: false,
                          // controller: _password,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email_outlined),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'email',
                              fillColor: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          //obscureText: true,
                          enableSuggestions: false,
                          // controller: _password,
                          decoration: InputDecoration(
                              // suffixIcon: Icon(Icons.remove_red_eye_sharp),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'City',
                              fillColor: Colors.white),
                        ),
                      ),
                      Gap(50),
                      SizedBox(
                        width: 250,
                        child: TextButton(
                          onPressed: () {
                            if (_validateAndSave()) {
                              _saveRegistrationDetails(
                                  fNameController.text.trim(),
                                  lNameController.text.trim(),
                                  ninNoController.text.trim(),
                                  contactController.text.trim(),
                                  cityController.text.trim());
                              Navigator.pushNamed(context, '/NavigationBar');
                            }
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            side: BorderSide(color: Colors.white),
                            backgroundColor: Colors.green.shade900,
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Gap(20)
                    ],
                  ),
                )
              ],
            )));
  }

  void _saveRegistrationDetails(
      String fName, String lName, String ninNo, String contact, String city) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('users').add({
      'firstName': fName,
      'lastName': lName,
      'ninNumber': ninNo,
      'phone number': contact,
      'city': city
    }).then((value) {
      print('Successfullly registered');
    });
  }
}
