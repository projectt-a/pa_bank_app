import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/compact_card_list.dart/compact_credit_card_widgets/HomeAddCardButton.dart';
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

class CardStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('Cards').snapshots(),
      builder: (context, snapshot) {
        final User user = _auth.currentUser;
        final uid = user.uid;
        List<Widget> cardWidgets = [];

        if (snapshot.hasData) {
          snapshot.data.docs.forEach(
            (doc) {
              if (doc.data()['uid'].toString() == uid) {
                final _cardBalance = doc.data()['balance'].toString();
                final _cardType = doc.data()['cardType'].toString();
                final _cardExpiryDate = doc.data()['expiryDate'].toString();
                final _cardIban = doc.data()['iban'].toString();

                Widget card;
                if (_cardType == "mastercard") {
                  card = CompactMasterCard(
                    iban: _cardIban ?? "Empty",
                    balance: double.parse(_cardBalance) ?? 0,
                    validThru: _cardExpiryDate ?? "Empty",
                  );
                } else if (_cardType == "americanExpress") {
                  card = CompactAmericanCard(
                    iban: _cardIban ?? "Empty",
                    balance: double.parse(_cardBalance) ?? 0,
                    validThru: _cardExpiryDate ?? "Empty",
                  );
                } else {
                  card = CompactVisaCard(
                    iban: _cardIban ?? "Empty",
                    balance: double.parse(_cardBalance) ?? 0,
                    validThru: _cardExpiryDate ?? "Empty",
                  );
                }
                cardWidgets.add(card);
              }
            },
          );
          cardWidgets.add(HomeAddCardButton());
          if (cardWidgets.length == 1) {
            return Center(
              child: HomeAddCardButton(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10.0),
            children: cardWidgets,
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
