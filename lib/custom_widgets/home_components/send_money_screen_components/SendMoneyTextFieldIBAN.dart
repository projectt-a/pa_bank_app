import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class SendMoneyTextFieldIBAN extends StatefulWidget {
  SendMoneyTextFieldIBAN({Key key}) : super(key: key);

  @override
  _SendMoneyTextFieldIBANState createState() => _SendMoneyTextFieldIBANState();
}

class _SendMoneyTextFieldIBANState extends State<SendMoneyTextFieldIBAN> {
  String ibanNumber;

  void initState() {
    super.initState();

    _ibanController.addListener(() {
      setState(() {
        ibanNumber = _ibanController.text;
        //print('$cardNumber');
      });
    });
  }

  final MaskedTextController _ibanController =
      MaskedTextController(mask: 'TR00 0000 0000 0000 0000 0000 00');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.blueAccent,
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextFormField(
            controller: _ibanController,
            decoration: InputDecoration(
              labelText: 'IBAN',
              hintText: 'TR00 0000 0000 0000 0000 0000 00',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
            textInputAction: TextInputAction.next,
            onChanged: (String text) {
              setState(() {});
            },
            validator: (String value) {
              // Validate less that 13 digits +3 white spaces
              if (value.isEmpty || value.length < 26) {
                return 'Card number is not valid';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
