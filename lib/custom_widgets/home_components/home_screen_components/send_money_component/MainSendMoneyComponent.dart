import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomeAddPerson.dart';
import 'HomePersonCard.dart';
import 'SendMoneyTitle.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class MainSendMoneyComponent extends StatelessWidget {
  const MainSendMoneyComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: FriendStream(),
    );
  }
}

class FriendStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('Friends').snapshots(),
      builder: (context, snapshot) {
        final User user = _auth.currentUser;
        final uid = user.uid;
        List<Widget> friendWidgets = [];
        friendWidgets.add(HomeAddPerson());
        if (snapshot.hasData) {
          snapshot.data.docs.forEach(
            (doc) {
              if (doc['uid'].toString() == uid) {
                final _username = doc['friendUsername'].toString();
                final _cardType = doc['friendCardType'].toString();
                final _friendIban = doc['friendIban'].toString();
                Widget friendCard;
                friendCard = HomePersonCard(
                  cardType: _cardType ?? "",
                  username: _username ?? "",
                  friendIban: _friendIban ?? "",
                );

                friendWidgets.add(friendCard);
              }
            },
          );

          if (friendWidgets.length == 1) {
            return Center(
              child: HomeAddPerson(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10.0),
            children: friendWidgets,
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
