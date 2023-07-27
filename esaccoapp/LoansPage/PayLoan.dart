import 'package:esacco/PaymentPage/PaymentScreen.dart';
import 'package:esacco/esaccoapp/HomePage/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
//import 'package:rave_flutter/rave_flutter.dart';
import 'package:flutterwave/utils/flutterwave_constants.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:gap/gap.dart';

class PayScreen extends StatefulWidget {
  PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final String currency = FlutterwaveCurrency.UGX;
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController amount = TextEditingController();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text(
            'Loan Payment',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: fullname,
                    decoration: InputDecoration(labelText: 'Full Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: amount,
                    decoration: InputDecoration(labelText: 'Loan Amount'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the loan amount';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: phone,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!isValidEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Gap(40),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.green.shade900)),
            child: const Text(
              'Pay with Flutterwave',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              final name = fullname.text;
              final userPhone = phone.text;
              final userEmail = email.text.trim();
              final amountPaid = '50000';

              if (formKey.currentState!.validate()) {
                _makeFlutterwavePayment(
                    context, name, userPhone, userEmail, amountPaid);
              }
            },
          ),
        ]));
  }

  void _makeFlutterwavePayment(BuildContext context, String fullname,
      String phone, String email, String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          //the first 10 fields below are required/mandatory
          context: this.context,
          fullName: fullname,
          phoneNumber: phone,
          email: email,
          amount: amount,
          //Use your Public and Encription Keys from your Flutterwave account on the dashboard
          encryptionKey: "FLWSECK_TESTee3f951e56ab",
          publicKey: "FLWPUBK_TEST-cd61653ab492c06a7ac62a5d28943259-X",
          currency: currency,
          redirectUrl: '/PaymentPage',
          txRef: DateTime.now().toIso8601String(),

          //Setting DebugMode below to true since will be using test mode.
          //You can set it to false when using production environment.
          isDebugMode: true,
          //configure the the type of payments that your business will accept
          acceptUgandaPayment: true);

      ChargeResponse response = await flutterwave.initializeForUiPayments();
      // ignore: unnecessary_null_comparison
      if (response == null) {
        print("Transaction Failed");
      } else {
        if (response.status == "Transaction successful") {
          String amountPaid = amount;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentScreen(
                        amountPaid: amountPaid,
                      )));
          print(response.data);
          print(response.message);
        } else {
          print(response.message);
        }
      }
    } catch (error) {
      print(error);
    }
  }

  bool isValidEmail(String email) {
    // Simple email validation logic
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
