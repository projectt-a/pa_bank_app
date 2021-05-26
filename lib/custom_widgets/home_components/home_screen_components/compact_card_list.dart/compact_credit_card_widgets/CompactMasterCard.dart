import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/card_info_screen.dart';

class CompactMasterCard extends StatelessWidget {
  const CompactMasterCard({
    Key key,
    this.balance = 0,
    this.validThru = "",
  }) : super(key: key);

  final double balance;
  final String validThru;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          splashColor: kPrimaryColor.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardInfoScreen()),
            );
          },
          child: Container(
            width: 200,
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        "assets/images/mastercard.png",
                        width: 25,
                        height: 31,
                      ),
                    ),
                    IconButton(
                      color: Colors.white70,
                      icon: const Icon(Icons.visibility_outlined),
                      tooltip: 'Bakiye gizle',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Bakiye gizlendi.')));
                      },
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        child: Text(
                          "\$" + balance.toString(),
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Platinum Plus",
                            style: new TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 180,
                  padding: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Text(
                          "VALID THRU",
                          style: new TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 8,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          validThru,
                          style: new TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ],
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
