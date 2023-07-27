import 'package:esacco/PaymentPage/PaymentScreen.dart';
import 'package:esacco/esaccoapp/HomePage/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
//import 'package:rave_flutter/rave_flutter.dart';
import 'package:flutterwave/utils/flutterwave_constants.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

class DepositScreen extends StatefulWidget {
  DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
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
            'Deposit',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Form(
                    key: formKey,
                    child: Column(children: [
                      const Padding(padding: EdgeInsets.all(10.0)),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: fullname,
                          decoration:
                              const InputDecoration(labelText: "Full Name"),
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : "Please fill in Your Name",
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: phone,
                          decoration:
                              const InputDecoration(labelText: "Phone Number"),
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : "Please fill in Your Phone number",
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: email,
                          decoration: const InputDecoration(labelText: "Email"),
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : "Please fill in Your Email",
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: amount,
                          decoration:
                              const InputDecoration(labelText: "Amount"),
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : "Please fill in the Amount you are Paying",
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.green.shade900)),
                        child: const Text(
                          'Pay with Flutterwave',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          final name = fullname.text;
                          final userPhone = phone.text;
                          final userEmail = email.text.trim();
                          final amountPaid = amount.text;

                          if (formKey.currentState!.validate()) {
                            HomeScreen(
                              amount: amountPaid,
                            );
                            _makeFlutterwavePayment(context, name, userPhone,
                                userEmail, amountPaid);
                          }
                        },
                      ),
                    ]))),
          ],
        ));
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
}
