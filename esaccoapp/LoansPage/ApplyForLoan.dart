import 'package:esacco/esaccoapp/LoansPage/Loans.dart';
import 'package:flutter/material.dart';

import 'LoanStatement.dart';

class LoanApplicationForm extends StatefulWidget {
  @override
  _LoanApplicationFormState createState() => _LoanApplicationFormState();
}

class _LoanApplicationFormState extends State<LoanApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  String _fullName = '';
  String _loanAmount = '';
  String _phone = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Application Form'),
        backgroundColor: Colors.green.shade900,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _fullName = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Loan Amount'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the loan amount';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _loanAmount = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
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
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Process the loan application with the data
                      // _fullName, _loanAmount, _phone, and _email

                      // For example, you can print the data
                      print('Full Name: $_fullName');
                      print('Loan Amount: $_loanAmount');
                      print('Phone: $_phone');
                      print('Email: $_email');
                      _showLoanRequestedSnackbar(context);
                      LoansView(
                        fullName: _fullName,
                        loanAmount: _loanAmount,
                        phone: _phone,
                        email: _email,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoanStatementScreen(
                            fullName: _fullName,
                            loanAmount: _loanAmount,
                            phone: _phone,
                            email: _email,
                          ),
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    side: BorderSide(color: Colors.white),
                    backgroundColor: Colors.green.shade900,
                  ),
                  child: Text('Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void _showLoanRequestedSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Loan requested successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  bool isValidEmail(String email) {
    // Simple email validation logic
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
