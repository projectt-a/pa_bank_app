import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/send_money_listedperson.dart';

class HomePersonCard extends StatelessWidget {
  const HomePersonCard({
    Key key,
    this.username = "",
    this.cardType = "",
  }) : super(key: key);

  final String username;
  final String cardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          splashColor: kPrimaryColor.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SendMoneyListedPerson()),
            );
          },
          child: Container(
            width: 100,
            height: 100,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    cardTypeChanger(cardType),
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Colors.white,
                    ),
                    width: 100,
                    height: 20,
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: .0),
                            child: Text(
                              username,
                              style: new TextStyle(
                                fontSize: 15,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String cardTypeChanger(String cardType) {
  if (cardType == "visa") {
    cardType = 'assets/images/visa.png';
    return cardType;
  } else if (cardType == "mastercard") {
    cardType = 'assets/images/mastercard.png';
    return cardType;
  } else if (cardType == "american") {
    cardType = 'assets/images/american.png';
    return cardType;
  } else {
    cardType = 'assets/images/elon.png';
    return cardType;
  }
}
