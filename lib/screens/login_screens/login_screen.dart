import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/login_components/PassTextFieldComponent.dart';
import 'package:pa_bank_app/custom_widgets/login_components/login_screen_components/CtAccountComponent.dart';
import 'package:pa_bank_app/custom_widgets/login_components/login_screen_components/ForgotPassTextFieldComponent.dart';
import 'package:pa_bank_app/custom_widgets/login_components/login_screen_components/LoginEmailtextField.dart';
import 'package:pa_bank_app/custom_widgets/login_components/login_screen_components/LoginTextComponent.dart';
import 'package:pa_bank_app/screens/home_screens/home_screen.dart';
//import 'package:pa_bank_app/services/auth_service.dart';

//AuthService _authService = AuthService();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _loginButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            new MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_sharp),
        backgroundColor: kPrimaryColor,
      );
    }

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
          GenericComponent(),
          Positioned(
            top: MediaQuery.of(context).size.height - 25,
            width: MediaQuery.of(context).size.width,
            child: Center(child: CtAccountComponent()),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.35,
            left: (MediaQuery.of(context).size.width / 2) - 26,
            child: _loginButton(),
          ),
        ],
      ),
    );
  }
}

class GenericComponent extends StatelessWidget {
  const GenericComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      LoginTextComponent(),
                      LoginEmailTextField(),
                      PassTextFieldComponent(),
                      ForgotPassTextFieldComponent(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
