import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SendMoneyCardSlider extends StatefulWidget {
  SendMoneyCardSlider({Key key}) : super(key: key);

  @override
  _SendMoneyCardSliderState createState() => _SendMoneyCardSliderState();
}

class _SendMoneyCardSliderState extends State<SendMoneyCardSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      //color: Colors.orange,
      child: CarouselSlider(
          items: <Widget>[
            CreditCardWidget(
              cardNumber: '1111 1111 1111 1111',
              cvvCode: '222',
              expiryDate: '05/23',
              cardHolderName: 'Ali Mert TEKEL',
              showBackView: false,
              cardType: CardType.mastercard,
              cardBgColor: Colors.black,
            ),
            CreditCardWidget(
              cardNumber: '2222 1111 1111 2222',
              cvvCode: '222',
              expiryDate: '06/21',
              cardHolderName: 'Alper Cem ÖZTÜRK',
              showBackView: false,
              cardType: CardType.visa,
              cardBgColor: Color(0xff2547F4),
            ),
          ],
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 0.9, //kartın eni boyu
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            //onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
