import 'package:esacco/esaccoapp/AboutUsPage/AboutUsScreen.dart';
import 'package:esacco/esaccoapp/HomePage/home_screen.dart';
import 'package:esacco/esaccoapp/LoginView/LoginView.dart';
import 'package:esacco/esaccoapp/SignUpWidget/SignUp.dart';
import 'package:flutter/material.dart';

import 'PaymentPage/PaymentScreen.dart';
import 'esaccoapp/BecomeMember/MemberScreen.dart';
import 'esaccoapp/DepositPage/Deposit.dart';
import 'esaccoapp/GeneratedGetStartedPage/GeneratedGetStartedWidget.dart';
import 'esaccoapp/LoansPage/Loans.dart';
import 'esaccoapp/NavigationBar/Navigation.dart';
import 'esaccoapp/ProfilePage/ProfileScreen.dart';

import 'esaccoapp/Register/RegisterView.dart';
import 'esaccoapp/RegisterWithUsWidget/RegisterWithUs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(eSaccoApp());
}

class eSaccoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/GeneratedGetStartedWidget',
      routes: {
        '/GeneratedGetStartedWidget': (context) => GeneratedGetStartedWidget(),
        '/RegisterWithUsWidget': (context) => RegisterWithUs(),
        '/SignUpWidget': (context) => SignUp(),
        '/LoginView': (context) => LoginView(),
        '/BecomeMember': (context) => MemberScreen(),
        '/Register': (context) => RegisterView(
              userId: '',
            ),
        '/NavigationBar': (context) => NavigationBottom(),
        '/HomePage': (context) => HomeScreen(),
        '/ProfilePage': (context) => ProfileScreen(),
        '/LoansPage': (context) => LoansView(
              fullName: '',
              loanAmount: '',
              phone: '',
              email: '',
            ),
        '/AboutUsPage': (context) => AboutUsScreen(),
        '/DepositPage': (context) => DepositScreen(),
        '/PaymentPage': (context) => PaymentScreen(),
      },
    );
  }
}
