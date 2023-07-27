import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade900,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Gap(120),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10),
              child: Text(
                'Digital Saccos',
                style: TextStyle(
                    fontFamily: 'Open sans',
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10),
              child: Text(
                'is the new world.',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Gap(50),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.green.shade900,
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(color: Colors.white)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Register');
                  },
                  child: Text(
                    'Become a member',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
