import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyCancelButton.dart';
import 'package:pa_bank_app/custom_widgets/home_components/send_money_screen_components/SendMoneyText.dart';
import 'package:pa_bank_app/screens/home_screens/home_screen.dart';
import 'package:pa_bank_app/services/auth_service.dart';

String giverBalance = '';
var selectedIban = '';

AuthService _authService = AuthService();

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
//var selectedCard;

class SendMoneyListedPerson extends StatefulWidget {
  SendMoneyListedPerson({Key key}) : super(key: key);

  @override
  _SendMoneyListedPersonState createState() => _SendMoneyListedPersonState();
}

class _SendMoneyListedPersonState extends State<SendMoneyListedPerson> {
  double quantity = 0.00;
  String recieverIban; //friend iban
  String note;

  final MaskedTextController _ibanController =
      MaskedTextController(mask: 'TR00 0000 0000 0000 0000 0000 00');

  final _noteController = TextEditingController();

  void initState() {
    super.initState();

    _ibanController.addListener(() {
      setState(() {
        recieverIban = _ibanController.text; //friend iban otomatik readonly
      });
    });

    _noteController.addListener(() {
      setState(() {
        note = _noteController.text;
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
        child: Center(
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
                SizedBox(height: 10),
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
                SizedBox(height: 10),
                _sendMoneyNameText(),
                SizedBox(height: 40),
                _sendMoneyTextFieldIBAN(),
                SizedBox(height: 10),
                _sendMoneyTextFieldAddNote(),
                SizedBox(height: 10),
                getCardSlider(),
                SizedBox(height: 40),
                _sendMoneyPayButton(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  getCardSlider() {
    return GetCardFirestore();
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

  _getIbanAndName() {
    //iban ve ismi getirip yazdır initstate de falan?
  }

  _sendMoneyPayButton() {
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
            //BURASI DEGISECEK
            _authService.updateBalanceGiver(
                selectedIban, recieverIban, quantity);
            Timer(Duration(milliseconds: 100), () {
              _authService.updateBalanceReciever(
                  selectedIban, recieverIban, quantity);
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

                      //tıklandıgında cardın rengini degistirebiliriz
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
