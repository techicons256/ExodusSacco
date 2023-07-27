import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import 'PaymentBalance.dart';
import 'Transaction.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? pickedImage;
  bool isPicked = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage(ImageSource img) async {
    final pickedFile = await _picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;

    setState(() {
      if (xfilePick != null) {
        pickedImage = File(pickedFile!.path);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        shadowColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.green.shade900,
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: pickedImage == null
                            ? CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person,
                                    size: 80, color: Colors.white),
                              )
                            : CircleAvatar(
                                radius: 30,
                                backgroundImage: FileImage(pickedImage!),
                              ),
                      ),
                      Positioned(
                          bottom: 1,
                          right: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 4),
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 3)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: InkWell(
                                onTap: () {
                                  _getImage(ImageSource.gallery);
                                },
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ),
                          ))
                    ]),
                    Gap(20),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Kawenja Pius',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Text('kawenjapius@gmail.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SaccoPaymentScreen(),
                    ));
              },
              child: Card(
                shadowColor: Colors.green.shade900,
                child: Container(
                  height: 80,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(20),
                      Icon(
                        Icons.account_balance,
                        color: Colors.green.shade900,
                      ),
                      Gap(40),
                      Text(
                        'Account balance',
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountStatementScreen(),
                    ));
              },
              child: Card(
                shadowColor: Colors.green.shade900,
                child: Container(
                  height: 80,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(20),
                      Icon(
                        Icons.account_tree_outlined,
                        color: Colors.green.shade900,
                      ),
                      Gap(40),
                      Text(
                        'Account statement',
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
                      Icons.password,
                      color: Colors.green.shade900,
                    ),
                    Gap(40),
                    Text(
                      'Change password',
                      style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
