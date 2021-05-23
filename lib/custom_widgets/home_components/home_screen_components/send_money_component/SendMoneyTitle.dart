import 'package:flutter/material.dart';

class SendMoneyTitle extends StatelessWidget {
  const SendMoneyTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              "Send money to",
              style: new TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
