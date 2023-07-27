import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final String amountPaid;
  const PaymentScreen({this.amountPaid = ''});

  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Payment was successful! Amount Paid: $amountPaid'),
      duration: Duration(seconds: 3),
    ));

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context, amountPaid);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text(
          'Payment Success',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Text(
          'Payment Successful. Redirecting',
          style: TextStyle(
              color: Colors.green.shade900,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
