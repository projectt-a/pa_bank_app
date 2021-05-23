import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class SendMoneyCreditCard extends StatefulWidget {
  SendMoneyCreditCard({Key key}) : super(key: key);

  @override
  _SendMoneyCreditCardState createState() => _SendMoneyCreditCardState();
}

class _SendMoneyCreditCardState extends State<SendMoneyCreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueAccent,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: CreditCardWidget(
        cardNumber: '1234 1234 1234 1234',
        expiryDate: '11/23',
        cardHolderName: 'ALPER CEM OZTURK',
        cvvCode: '166',
        showBackView: false,
        cardType: CardType.mastercard,
      ),
    );
  }
}
