import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/HistoryListElement.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class HomeCardHistoryComponent extends StatelessWidget {
  const HomeCardHistoryComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: kSeconderyColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Text(
                          "History",
                          style: new TextStyle(
                            fontSize: 22,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 33,
                      padding: EdgeInsets.only(right: 20),
                      icon: const Icon(
                        Icons.pie_chart_outline_outlined,
                        color: kPrimaryColor,
                      ),
                      tooltip: 'Genişlet',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: CardStream(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final User user = _auth.currentUser;
final uid = user.uid;

class CardStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('MoneyTransfer')
          .where('giverUid', isEqualTo: uid)
          .snapshots(),
      builder: (context, snapshot) {
        List<Widget> historyWidgets = [];
        if (snapshot.hasData) {
          snapshot.data.docs.forEach(
            (doc) {
              final _recieverNameSurname =
                  doc.data()['recieverNameSurname'].toString();
              final _quantity = doc.data()['quantity'].toString();
              Timestamp _transferDate = doc.data()['transferDate'];

              DateTime timeee =
                  DateTime.parse(_transferDate.toDate().toString());

              var time = _transferDate.toDate().day.toString() +
                  "." +
                  _transferDate.toDate().month.toString() +
                  "." +
                  _transferDate.toDate().year.toString() +
                  "~" +
                  _transferDate.toDate().hour.toString() +
                  ":" +
                  _transferDate.toDate().minute.toString();

              Widget historyElement;
              historyElement = HistoryListElement(
                processFee: _quantity,
                processName: _recieverNameSurname,
                processDate: time,
              );

              historyWidgets.add(historyElement);
            },
          );

          return ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10.0),
            children: historyWidgets,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.amber),
          );
        }
      },
    );
  }
}
