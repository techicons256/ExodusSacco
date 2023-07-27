import 'package:flutter/material.dart';

class LoanStatementScreen extends StatefulWidget {
  final String fullName;
  final String loanAmount;
  final String phone;
  final String email;

  LoanStatementScreen({
    this.fullName = '',
    this.loanAmount = '',
    this.phone = '',
    this.email = '',
  });

  @override
  _LoanStatementScreenState createState() => _LoanStatementScreenState();
}

class _LoanStatementScreenState extends State<LoanStatementScreen>
    with AutomaticKeepAliveClientMixin<LoanStatementScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Important to call super.build(context)

    return Scaffold(
      appBar: AppBar(title: Text('Loan Statement')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Full Name: ${widget.fullName}'),
            SizedBox(height: 8),
            Text('Loan Amount: ${widget.loanAmount}'),
            SizedBox(height: 8),
            Text('Phone: ${widget.phone}'),
            SizedBox(height: 8),
            Text('Email: ${widget.email}'),
          ],
        ),
      ),
    );
  }
}
