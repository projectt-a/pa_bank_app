import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/login_components/ButtonComponent.dart';
import 'package:pa_bank_app/custom_widgets/login_components/register_screen_components/EmailTextField.dart';
import 'package:pa_bank_app/custom_widgets/login_components/register_screen_components/PasswordTextField.dart';
import 'package:pa_bank_app/custom_widgets/login_components/register_screen_components/RegisterFormField.dart';
import 'package:pa_bank_app/custom_widgets/login_components/register_screen_components/UsernameTextField.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
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
                        borderRadius: BorderRadius.circular(20.0),
                        color: kSeconderyColor,
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 80.0,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RegisterFormField(),
                              SizedBox(height: 80.0),
                              TextFieldEmail(),
                              SizedBox(height: 5.0),
                              TextFieldUsername(),
                              SizedBox(height: 5.0),
                              TextFieldPassword(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.35,
              left: (MediaQuery.of(context).size.width / 2) - 26,
              //top: MediaQuery.of(context).size.height / 1.30 + 35,
              //left: (MediaQuery.of(context).size.width / 2) - 35,
              child: ButtonComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
