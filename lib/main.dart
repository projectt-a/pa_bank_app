import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/add_new_card_screen.dart';
import 'package:pa_bank_app/screens/home_screens/home_screen.dart';
import 'package:pa_bank_app/screens/home_screens/send_money_listedperson.dart';
import 'package:pa_bank_app/screens/home_screens/send_money_screen.dart';
import 'package:pa_bank_app/screens/login_screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A-Bank',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
    );
  }
}
