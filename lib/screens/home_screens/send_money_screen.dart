import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyCancelButton.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyCardSlider.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyMoney.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyNameText.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyPayButton.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneySaveas.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyText.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyTextFieldAddNote.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyTextFieldIBAN.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyTextFieldUsername.dart';

class SendMoneyScreen extends StatefulWidget {
  SendMoneyScreen({Key key}) : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: kSeconderyColor,
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
              SendMoneyMoney(),
              SendMoneyNameText(),
              SendMoneyTextFieldIBAN(),
              SendMoneyTextFieldAddNote(),
              SendMoneySaveas(),
              SendMoneyTextFieldUsername(),
              SendMoneyCardSlider(),
              SendMoneyPayButton(),
            ],
          ),
        ),
      ),
    ));
  }
}
