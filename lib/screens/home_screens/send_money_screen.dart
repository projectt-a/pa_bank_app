import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyCancelButton.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneySaveas.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyText.dart';
import 'package:pa_bank_app/screens/home_screens/home_screen.dart';
import 'package:pa_bank_app/services/auth_service.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
AuthService _authService = AuthService();
var selectedIban = '';
String giverBalance = '';

class SendMoneyScreen extends StatefulWidget {
  SendMoneyScreen({Key key}) : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  double quantity = 0.00;
  String recieverIban;
  String note;
  String username; //reciever username

  final MaskedTextController _ibanController =
      MaskedTextController(mask: 'TR00 0000 0000 0000 0000 0000 00');

  final _noteController = TextEditingController();
  final _usernameController = TextEditingController();

  void initState() {
    super.initState();

    _ibanController.addListener(() {
      setState(() {
        recieverIban = _ibanController.text;
      });
    });

    _noteController.addListener(() {
      setState(() {
        note = _noteController.text;
      });
    });

    _usernameController.addListener(() {
      setState(() {
        username = _usernameController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: kSeconderyColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SendMoneyText(),
                  SizedBox(
                    width: 100,
                  ),
                  SendMoneyCancelButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle),
                    iconSize: 50,
                    color: Colors.black45,
                    onPressed: () {
                      setState(() {
                        if (quantity != 0) {
                          quantity = quantity - 10;
                        }
                      });
                    },
                  ),
                  _moneyQuantityText(),
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    iconSize: 50,
                    onPressed: () {
                      setState(() {
                        quantity = quantity + 10;
                      });
                    },
                    color: Colors.black45,
                  ),
                ],
              ),
              _sendMoneyNameText(),
              _sendMoneyTextFieldIBAN(),
              _sendMoneyTextFieldAddNote(),
              SendMoneySaveas(),
              _sendMoneyTextFieldUsername(),
              getCardSlider(),
              _payButton(),
            ],
          ),
        ),
      ),
    ));
  }

  getCardSlider() {
    return GetCardFirestore();
  }

  _sendMoneyTextFieldUsername() {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.red,
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextFormField(
            controller: _usernameController,
            maxLength: 30,
            decoration: InputDecoration(
              labelText: 'Username (Optional)',
              hintText: 'Username (Optional)',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
            textInputAction: TextInputAction.next,
            onChanged: (String text) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  _sendMoneyTextFieldAddNote() {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.teal,
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextFormField(
            controller: _noteController,
            maxLength: 40,
            decoration: InputDecoration(
              labelText: 'Add a note',
              hintText: 'Add a note',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
            textInputAction: TextInputAction.next,
            onChanged: (String text) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  _sendMoneyTextFieldIBAN() {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextFormField(
            controller: _ibanController,
            decoration: InputDecoration(
              labelText: 'IBAN',
              hintText: 'TR00 0000 0000 0000 0000 0000 00',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
            textInputAction: TextInputAction.next,
            onChanged: (String text) {
              setState(() {});
            },
            validator: (String value) {
              if (value.isEmpty || value.length < 26) {
                return 'Card number is not valid';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  _sendMoneyNameText() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Name',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  _payButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            primary: kPrimaryColor,
          ),
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width - 80,
            margin: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    package: 'flutter_credit_card',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          onPressed: () {
            _authService.updateBalanceGiver(
                selectedIban, recieverIban, quantity);
            Timer(Duration(milliseconds: 100), () {
              _authService.updateBalanceReciever(
                  selectedIban, recieverIban, quantity);

              _authService.createMoneyTransfer(selectedIban, recieverIban,
                  usernameChecker(), quantity, note);
            });

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    );
  }

  _moneyQuantityText() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          '\$ $quantity',
          //textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 70, //57 emulator
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  String friendCardHolderName = '';
  String usernameChecker() {
    if (username.isNotEmpty) {
      String friendCardType =
          _authService.checkCardType(recieverIban.split(" ").join(""));

      friendCardHolderName =
          _authService.checkCardHolderName(recieverIban.split(" ").join(""));

      print('disarida arkadasinin cardType: $friendCardType');
      print('username checker holder : $friendCardHolderName');

      _authService.createFriends(
          recieverIban.split(" ").join(""), username, friendCardType);
    }
    return friendCardHolderName;
  }
}

class GetCardFirestore extends StatefulWidget {
  @override
  _GetCardFirestoreState createState() => _GetCardFirestoreState();
}

class _GetCardFirestoreState extends State<GetCardFirestore> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore.collection('Cards').snapshots(),
        builder: (context, snapshot) {
          final User user = _auth.currentUser;
          final uid = user.uid;

          if (snapshot.hasData) {
            //final cards = snapshot.data.docs;
            List<Card> cardWidgets = [];

            snapshot.data.docs.forEach((doc) {
              if (doc.data()['uid'].toString() == uid) {
                final cardHolderName = doc.data()['cardHolderName'].toString();
                final cardNumber = doc.data()['cardNumber'].toString();
                final cardType = doc.data()['cardType'].toString();
                final cvvCode = doc.data()['cvvCode'].toString();
                final expiryDate = doc.data()['expiryDate'].toString();
                final iban = doc.data()['iban'].toString();
                final balance = doc.data()['balance'].toString();

                CardType cardTypeob;
                Color bgcolor;
                if (cardType == 'visa') {
                  cardTypeob = CardType.visa;
                  bgcolor = Color(0xff2547F4);
                } else if (cardType == 'mastercard') {
                  cardTypeob = CardType.mastercard;
                  bgcolor = Color(0xff000000);
                } else {
                  cardTypeob = CardType.americanExpress;
                  bgcolor = Color(0xff00ccccc);
                }
                final creditCard = CreditCardWidget(
                  cardHolderName: cardHolderName,
                  cardNumber: cardNumber,
                  cardType: cardTypeob,
                  cvvCode: cvvCode,
                  expiryDate: expiryDate,
                  showBackView: false,
                  cardBgColor: bgcolor,
                );

                cardWidgets.add(Card(
                  elevation: 0,
                  color: kSeconderyColor,
                  child: InkWell(
                    onTap: () {
                      giverBalance = balance;
                      selectedIban = iban;
                    },
                    child: creditCard,
                  ),
                ));
              }
            });

            return Container(
              padding: EdgeInsets.zero,
              child: CarouselSlider(
                  items: cardWidgets,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.90, //kartın eni boyu
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepPurple,
              ),
            );
          }
        });
  }
}
