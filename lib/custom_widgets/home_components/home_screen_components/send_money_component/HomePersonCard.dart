import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/send_money_listedperson.dart';

class HomePersonCard extends StatelessWidget {
  const HomePersonCard({
    Key key,
  }) : super(key: key);

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/images/elon.png',
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Text(
                            "İlhan Maske Musk",
                            style: new TextStyle(
                              fontSize: 15,
                              color: kPrimaryColor,
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
