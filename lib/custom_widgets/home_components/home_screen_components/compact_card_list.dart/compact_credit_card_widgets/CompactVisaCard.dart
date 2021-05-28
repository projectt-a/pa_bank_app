import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/card_info_screen.dart';
import 'package:pa_bank_app/services/firestore_service.dart';

FirestoreService _firestoreService = FirestoreService();

class CompactVisaCard extends StatelessWidget {
  const CompactVisaCard({
    Key key,
    this.balance = 0,
    this.validThru = "",
    this.iban = "",
  }) : super(key: key);
  final double balance;
  final String validThru;
  final String iban;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xff2547F4),
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
                        "assets/images/visa.png",
                        width: 25,
                        height: 31,
                      ),
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.cancel_presentation_rounded),
                      tooltip: 'Kartı sil',
                      onPressed: () {
                        _firestoreService.deleteCard(iban);
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
                            color: Colors.white,
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
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          validThru,
                          style: new TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            color: Colors.white70,
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
