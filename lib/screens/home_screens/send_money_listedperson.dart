import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyCancelButton.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyCardSlider.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyMoney.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyNameText.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyPayButton.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyText.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyTextFieldAddNote.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyTextFieldIBAN.dart';

class SendMoneyListedPerson extends StatefulWidget {
  SendMoneyListedPerson({Key key}) : super(key: key);

  @override
  _SendMoneyListedPersonState createState() => _SendMoneyListedPersonState();
}

class _SendMoneyListedPersonState extends State<SendMoneyListedPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: kSeconderyColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SendMoneyText(),
                    SizedBox(
                      width: 100,
                    ),
                    SendMoneyCancelButton(),
                  ],
                ),
                SizedBox(height: 10),
                SendMoneyMoney(),
                SizedBox(height: 10),
                SendMoneyNameText(),
                SizedBox(height: 40),
                SendMoneyTextFieldIBAN(),
                SizedBox(height: 10),
                SendMoneyTextFieldAddNote(),
                SizedBox(height: 10),
                SendMoneyCardSlider(),
                SizedBox(height: 40),
                SendMoneyPayButton(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
