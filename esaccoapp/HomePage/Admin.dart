import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'LoansAdmin.dart';

class AdminPage extends StatefulWidget {
  final String withdraw;
  final String amount;

  const AdminPage({this.withdraw = '', this.amount = ''});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good morning',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Kawenja',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ))
                    ],
                  ),
                  Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(60),
                          //  image: const DecorationImage(
                          //image: AssetImage('assets/images/user.png')
                          // )
                          ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
      Gap(20),
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          'Quick Services',
          style: TextStyle(
              color: Colors.green.shade900, fontWeight: FontWeight.bold),
        ),
      ),
      Gap(20),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Gap(10),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/images/sent.png'),
                        ),
                      ),
                      Gap(10),
                      Center(
                        child: Text(
                          'Send money',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminLoanScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.green.shade900,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Gap(10),
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/loans.png'),
                          ),
                        ),
                        Gap(10),
                        Center(
                          child: Text(
                            'Loans',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Gap(10),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/airtime.png'),
                        ),
                      ),
                      Gap(10),
                      Center(
                        child: Text(
                          'Airtime',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/DepositPage');
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.green.shade900,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Gap(10),
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/deposit.png'),
                          ),
                        ),
                        Gap(10),
                        Center(
                          child: Text(
                            'Deposit',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Gap(10),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/withdraw.png'),
                        ),
                      ),
                      Gap(10),
                      Center(
                        child: Text(
                          'Withdraw',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Gap(10),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/bills.png'),
                        ),
                      ),
                      Gap(10),
                      Center(
                        child: Text(
                          'Pay Bills',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      Gap(30),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Deposits',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Column(
              children: [
                Gap(50),
                Text(
                  'Deposits in the last 30days',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'shs.${widget.amount}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ]),
        ),
      ),
      Gap(10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.brown.shade400,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Withdraw',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Column(
              children: [
                Gap(50),
                Text(
                  'Withdraw in the last 30days',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.withdraw,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ]),
        ),
      ),
      Gap(20)
    ]));
  }
}
