import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/home_screen.dart';
import 'package:pa_bank_app/screens/login_screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = FirebaseAuth.instance.currentUser;
    Widget firstWidget;
    if (firebaseUser != null) {
      firstWidget = HomeScreen();
    } else {
      firstWidget = LoginScreen();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A-Bank',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: firstWidget,
    );
  }
}
