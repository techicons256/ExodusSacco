import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GeneratedGetStartedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green.shade900,
        body: ListView(children: [
          Column(children: [
            Gap(30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(120),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),
            Gap(100),
            Text(
              'Register with Esacco',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Gap(100),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.green.shade900,
                    borderRadius: BorderRadius.circular(40.0)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/RegisterWithUsWidget');
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ]),
        ]));
  }
}
