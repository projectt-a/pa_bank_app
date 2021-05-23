import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/login_components/ButtonComponent.dart';
import 'package:pa_bank_app/custom_widgets/login_components/ResetPassTextComponent.dart';
import 'package:pa_bank_app/custom_widgets/login_components/login_screen_components/LoginEmailtextField.dart';

class NewPass extends StatelessWidget {
  const NewPass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _GenericComponent(),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.35,
            left: (MediaQuery.of(context).size.width / 2) - 26,
            child: ButtonComponent(),
          ),
        ],
      ),
    );
  }
}

class _GenericComponent extends StatelessWidget {
  const _GenericComponent({
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
                      ResetPassTextComponent(),
                      LoginEmailTextField(),
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
