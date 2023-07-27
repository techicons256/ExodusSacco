import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final double amount;
  final DateTime date;

  Transaction({required this.title, required this.amount, required this.date});
}

List<Transaction> transactions = [
  Transaction(title: 'Bills', amount: -0.00, date: DateTime(2023, 7, 25)),
  Transaction(title: 'Deposit', amount: 0.00, date: DateTime(2023, 7, 22)),
  Transaction(title: 'Withdrawal', amount: -0.00, date: DateTime(2023, 7, 20)),
  // Add more transactions as needed
];

class AccountStatementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          'Account Statement',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text(transaction.title),
            subtitle: Text(transaction.date.toString()),
            trailing: Text(
              transaction.amount < 0
                  ? '-\shs.${transaction.amount.abs().toStringAsFixed(2)}'
                  : '\shs.${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                color: transaction.amount < 0 ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
