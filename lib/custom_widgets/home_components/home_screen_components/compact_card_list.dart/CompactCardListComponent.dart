import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/card_info_screen.dart';
import 'package:pa_bank_app/services/auth_service.dart';
import 'package:pa_bank_app/services/firestore_service.dart';

import 'compact_credit_card_widgets/CompactAmericanCard.dart';
import 'compact_credit_card_widgets/CompactMasterCard.dart';
import 'compact_credit_card_widgets/CompactVisaCard.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class CompactCardListComponent extends StatelessWidget {
  const CompactCardListComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: CardStream(),
    );
  }
}

class CardListesiiii extends StatelessWidget {
  const CardListesiiii({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List cardWidgets = [];
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CompactAmericanCard(),
              CompactMasterCard(),
              CompactVisaCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class CardStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('Cards').snapshots(),
      builder: (context, snapshot) {
        final User user = _auth.currentUser;
        final uid = user.uid;
        if (snapshot.hasData) {
          List<Widget> cardWidgets = [];
          snapshot.data.docs.forEach(
            (doc) {
              if (doc.data()['uid'].toString() == uid) {
                final _cardBalance = doc.data()['balance'].toString();
                final _cardType = doc.data()['cardType'].toString();
                final _cardExpiryDate = doc.data()['expiryDate'].toString();

                Widget card;
                if (_cardType == "mastercard") {
                  card = CompactMasterCard(
                    balance: double.parse(_cardBalance) ?? 0,
                    validThru: _cardExpiryDate ?? "Empty",
                  );
                } else if (_cardType == "americanExpress") {
                  card = CompactAmericanCard(
                    balance: double.parse(_cardBalance) ?? 0,
                    validThru: _cardExpiryDate ?? "Empty",
                  );
                } else {
                  card = CompactVisaCard(
                    balance: double.parse(_cardBalance) ?? 0,
                    validThru: _cardExpiryDate ?? "Empty",
                  );
                }
                cardWidgets.add(card);
              }
            },
          );

          return ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10.0),
            children: cardWidgets,
          );
        } else {
          return Center(
            child:
                CircularProgressIndicator(backgroundColor: Colors.deepPurple),
          );
        }
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String msgText;
  final String msgSender;
  final bool user;
  MessageBubble({this.msgText, this.msgSender, this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment:
            user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              msgSender,
              style: TextStyle(
                  fontSize: 13, fontFamily: 'Poppins', color: Colors.black87),
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topLeft: user ? Radius.circular(50) : Radius.circular(0),
              bottomRight: Radius.circular(50),
              topRight: user ? Radius.circular(0) : Radius.circular(50),
            ),
            color: user ? Colors.blue : Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                msgText,
                style: TextStyle(
                  color: user ? Colors.white : Colors.blue,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
