import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/login_components/login_screen_components/CtAccountComponent.dart';
import 'package:pa_bank_app/custom_widgets/login_components/login_screen_components/ForgotPassTextFieldComponent.dart';
import 'package:pa_bank_app/screens/home_screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pa_bank_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var textEditingControlEmail = TextEditingController();
  var textEditingControlPass = TextEditingController();
  AuthService _authService = AuthService();

  bool _isHidden = true;

  @override
  void initState() {
    textEditingControlEmail.addListener(() {
      setState(() {});
    });

    textEditingControlPass.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kSeconderyColor,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildLoginText(),
                            buildEmailtextField(context),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                buildPassText(),
                                buildPassTextField(context),
                              ],
                            ),
                            ForgotPassTextFieldComponent(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 25,
            width: MediaQuery.of(context).size.width,
            child: Center(child: CtAccountComponent()),
          ),
          buildLoginButton(context, currentUser),
        ],
      ),
    );
  }

  Positioned buildLoginButton(BuildContext context, User currentUser) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 1.35,
      left: (MediaQuery.of(context).size.width / 2) - 26,
      child: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_sharp),
        backgroundColor: kPrimaryColor,
        onPressed: () async {
          _authService
              .signIn(textEditingControlEmail.text, textEditingControlPass.text)
              .then(
            (value) {
              return Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Container buildPassTextField(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50.0,
      width: MediaQuery.of(context).size.width / 1.3,
      child: TextFormField(
        controller: textEditingControlPass,
        obscureText: _isHidden,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: 'Password',
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.only(left: 10),
        ),
      ),
    );
  }

  Padding buildPassText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Text(
        'Password',
        style: new TextStyle(
          fontSize: 13,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Column buildEmailtextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Text(
            'Email address',
            style: new TextStyle(
              fontSize: 13,
              color: kPrimaryColor,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextFormField(
            controller: textEditingControlEmail,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.only(left: 10),
            ),
          ),
        ),
      ],
    );
  }

  Padding buildLoginText() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 80),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Login',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 54,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
