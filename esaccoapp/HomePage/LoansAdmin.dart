import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../LoansPage/ApplyForLoan.dart';
import '../LoansPage/LoanStatement.dart';
import '../LoansPage/PayLoan.dart';

class AdminLoanScreen extends StatelessWidget {
  final String fullName;
  final String loanAmount;
  final String phone;
  final String email;
  const AdminLoanScreen({
    this.fullName = '',
    this.loanAmount = '',
    this.phone = '',
    this.email = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          'Loans',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoanApplicationForm(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.green.shade900,
                child: Container(
                  height: 80,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(20),
                      Icon(
                        Icons.note_add,
                        color: Colors.green.shade900,
                      ),
                      Gap(40),
                      Text(
                        'Apply for a loan',
                        style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Gap(2),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PayScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.green.shade900,
                child: Container(
                  height: 80,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(20),
                      Icon(
                        Icons.money_off,
                        color: Colors.green.shade900,
                      ),
                      Gap(40),
                      Text(
                        'Pay Loan',
                        style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Gap(2),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: Colors.green.shade900,
              child: Container(
                height: 80,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Gap(20),
                    Icon(
                      Icons.question_mark,
                      color: Colors.green.shade900,
                    ),
                    Gap(40),
                    Text(
                      'Loan Balance',
                      style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoanStatementScreen(
                    fullName: fullName,
                    loanAmount: loanAmount,
                    phone: phone,
                    email: email,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.green.shade900,
                child: Container(
                  height: 80,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(20),
                      Icon(
                        Icons.notes,
                        color: Colors.green.shade900,
                      ),
                      Gap(40),
                      Text(
                        'Loan Statement',
                        style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PayScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.green.shade900,
                child: Container(
                  height: 80,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(20),
                      Icon(
                        Icons.money_off,
                        color: Colors.green.shade900,
                      ),
                      Gap(40),
                      Text(
                        'Confirm Loans',
                        style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
