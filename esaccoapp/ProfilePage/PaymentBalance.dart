import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../DepositPage/Deposit.dart';

class SaccoPaymentScreen extends StatefulWidget {
  @override
  _SaccoPaymentScreenState createState() => _SaccoPaymentScreenState();
}

class _SaccoPaymentScreenState extends State<SaccoPaymentScreen> {
  // Replace this with the actual SACCO balance and payment amount logic
  double saccoBalance = 5000.00;
  double paymentAmount = 1000.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text('SACCO Payment'),
      ),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.brown.shade600,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              //  padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Gap(30),
                  Row(
                    children: [
                      Gap(20),
                      Text(
                        'SACCO Balance :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Gap(15),
                      Text(
                        '\shs.${saccoBalance.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Gap(100),
                  TextButton(
                    onPressed: () {
                      // Replace this with the actual payment logic
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DepositScreen(),
                        ),
                      );
                      // setState(() {
                      //  saccoBalance -= paymentAmount;
                      //   });
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(color: Colors.white),
                      backgroundColor: Colors.brown.shade600,
                      // minimumSize:
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Make Payment',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
