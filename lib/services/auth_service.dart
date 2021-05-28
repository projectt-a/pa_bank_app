import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> signUp(String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User> createUser(
      String email, String username, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore
        .collection("Users")
        .doc(user.user.uid)
        .set({'email': email, 'userName': username}); //register date ekle
    return user.user;
  }

  isUserLoggedIn() {
    final User user = _auth.currentUser;
    return user != null;
  }

  static const chars = "0123456789";
  String randomString(int strlen) {
    Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }

  Future<void> createCard(
    String cardNumber,
    String expiryDate,
    String cardHolderName,
    String cvvCode,
    String cardType,
  ) async {
    if (cardNumber.startsWith('4')) {
      cardType = 'visa';
    } else if (cardNumber.startsWith('5')) {
      cardType = 'mastercard';
    } else {
      cardType = 'americanExpress';
    }
    var iban = 'TR${randomString(24)}';
    var balance = '10000';
    CollectionReference cards = FirebaseFirestore.instance.collection('Cards');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    cards.add({
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'iban': iban,
      'cardHolderName': cardHolderName,
      'cvvCode': cvvCode,
      'balance': balance,
      'cardType': cardType,
      'uid': uid,
    });

    return;
  }

  deleteCard(String cardIban) {
    FirebaseFirestore.instance
        .collection("Cards")
        .where("iban", isEqualTo: cardIban)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("Cards")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
      });
    });
  }

  var cardType = '';
  String checkCardType(String friendIban) {
    FirebaseFirestore.instance
        .collection('Cards')
        .where('iban', isEqualTo: friendIban)
        .get()
        .then((QuerySnapshot querySnapshot) {
      print('friendiban: $friendIban');
      querySnapshot.docs.forEach((doc) {
        cardType = doc['cardType'];
        print('arkadasinin cardType: $cardType');
      });
    });

    print('returndan önce arkadasinin cardType: $cardType');
    return cardType;
  }

  var cardHolderName = '';
  String checkCardHolderName(String friendiban) {
    FirebaseFirestore.instance
        .collection('Cards')
        .where('iban', isEqualTo: friendiban)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        cardHolderName = doc['cardHolderName'];
        print('Checkcardholdername : $cardHolderName');
      });
    });
    print('Checkcardholdername returndan önce $cardHolderName');
    return cardHolderName;
  }

  updateBalanceGiver(String giverIban, String recieverIban, double quantity) {
    FirebaseFirestore.instance
        .collection('Cards')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
        recieverIban = recieverIban.split(" ").join("");
        if (doc['iban'] == giverIban) {
          var balanceGonderen = doc['balance'].toString();
          double balanceGonderenDouble = double.parse(balanceGonderen);
          print('balanceGonderenDouble : $balanceGonderenDouble');

          balanceGonderenDouble = balanceGonderenDouble - quantity;
          print('balanceGonderenDouble : $balanceGonderenDouble');

          String balanceGonderenString = balanceGonderenDouble.toString();
          print('balanceGonderenString: $balanceGonderenString');
          print('$recieverIban');

          FirebaseFirestore.instance
              .collection('Cards')
              .doc(doc.id)
              .update({'balance': '$balanceGonderenString'});
        }
      });
    });
  }

  updateBalanceReciever(
      String giverIban, String recieverIban, double quantity) {
    FirebaseFirestore.instance
        .collection('Cards')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
        recieverIban = recieverIban.split(" ").join("");
        if (doc['iban'] == recieverIban) {
          var balanceAlan = doc['balance'].toString();
          double balanceAlanDouble = double.parse(balanceAlan);
          print('balanceAlanDouble : $balanceAlanDouble');

          balanceAlanDouble = balanceAlanDouble + quantity;
          print('balanceAlanDouble : $balanceAlanDouble');

          String balanceAlanString = balanceAlanDouble.toString();
          print('balanceAlanString: $balanceAlanString');

          FirebaseFirestore.instance
              .collection('Cards')
              .doc(doc.id)
              .update({'balance': '$balanceAlanString'});
        }
      });
    });
  }

  Future<void> createMoneyTransfer(
    String giverIban, //seçtiği kartın ibanı
    String recieverIban,
    String recieverNameSurname,
    double quantity,
    String note,
  ) async {
    recieverIban = recieverIban.split(" ").join("");
    String quantityString = quantity.toString();

    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    CollectionReference moneyTransfer =
        FirebaseFirestore.instance.collection('MoneyTransfer');
    moneyTransfer.add({
      'giverIban': giverIban,
      'giverUid': uid,
      'recieverIban': recieverIban,
      'recieverNameSurname': recieverNameSurname,
      'quantity': quantityString,
      'note': note,
      'transferDate': DateTime.now(),
    });

    return;
  }

  Future<void> createFriends(
    String friendIban,
    String friendUsername,
    String cardType,
  ) async {
    CollectionReference friend =
        FirebaseFirestore.instance.collection('Friends');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    friend.add({
      'friendIban': friendIban,
      'friendUsername': friendUsername,
      'friendCardType': cardType,
      'uid': uid, //kimin arkadası bu adam?
    });

    return;
  }
}
