import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/send_money_screen.dart';

class HomeAddPerson extends StatelessWidget {
  const HomeAddPerson({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(0),
        width: 50,
        height: 50,
        color: kPrimaryColor,
        child: IconButton(
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
      ),
    );
  }
}
