import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../firebase_options.dart';
import '../Register/RegisterView.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController firstName;
  late final TextEditingController lastName;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    firstName.dispose();
    lastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.greenAccent.shade100,
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ListView(
                  children: [
                    Column(
                      children: [
                        Gap(80),
                        Text(
                          'Welcome on board!',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Gap(20),
                        Text(
                          "Let's hope you meet up to your tasks.",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Gap(10),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: firstName,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        filled: true,
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: 'first name',
                                        fillColor: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: lastName,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        filled: true,
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: 'last name',
                                        fillColor: Colors.white),
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.email_outlined),
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
                                hintText: 'Enter your email',
                                fillColor: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            controller: _password,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                                hintText: 'Enter your passsword',
                                fillColor: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            // controller: _password,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye_sharp),
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
                                hintText: 'Confirm Password',
                                fillColor: Colors.white),
                          ),
                        ),
                        Gap(50),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(40.0)),
                            child: TextButton(
                              onPressed: () async {
                                // final fName = firstName.text;
                                // final lName = lastName.text;
                                final email = _email.text.trim();
                                final password = _password.text.trim();

                                final userCredential = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password);
                                String userId = userCredential.user!.uid;
                                RegisterView(userId: userId);
                                print(userCredential);
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              default:
                return const Text('Loading');
            }
          },
        ),
      ),
    );
  }
}
