import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/send_money_screen.dart';

class HomeAddCardButton extends StatelessWidget {
  const HomeAddCardButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Kart Ekle",
            style: TextStyle(color: kSeconderyColor, fontSize: 20),
          ),
          IconButton(
            iconSize: 50,
            padding: EdgeInsets.all(0),
            icon: const Icon(
              Icons.add_circle_outline,
              color: kSeconderyColor,
            ),
            tooltip: 'Ekle',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SendMoneyScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
