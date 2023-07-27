import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';

class AirtimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Airtime'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // buyAirtime(); // Call the function when the button is pressed.
          },
          child: Text('Buy Airtime'),
        ),
      ),
    );
  }
}
