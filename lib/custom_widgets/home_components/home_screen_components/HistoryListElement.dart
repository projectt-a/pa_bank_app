import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/card_info_screen.dart';

class HistoryListElement extends StatelessWidget {
  const HistoryListElement({
    Key key,
    this.processFee = "",
    this.processName = "",
    this.processDate = "",
  }) : super(key: key);

  final String processFee;
  final String processName;
  final String processDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 60,
        child: Card(
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
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Image.asset(
                      "assets/images/netflix.png",
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              processName,
                              style: new TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Text(
                            processDate,
                            style: new TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      height: double.infinity,
                      child: Text(
                        processFee,
                        style: new TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
