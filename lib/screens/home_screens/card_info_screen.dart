import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class CardInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.arrow_back_ios_outlined),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 10),
                              child: Text(
                                "Total Balance",
                                style: new TextStyle(
                                  color: Colors.white70,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$7 534.14",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 34),
                                ),
                                Container(
                                  width: 60,
                                  height: 40,
                                  child: Image.asset(
                                    'assets/images/mastercard.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: Color(0xff2547F4),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IntrinsicWidth(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Income",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 17,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                          Text(
                                            "\$2 542.25",
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
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
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IntrinsicWidth(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Spent",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 17,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                          Text(
                                            "\$1 832.74",
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
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
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Color(0xff2547F4),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
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
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Text(
                                      "Expenses",
                                      style: new TextStyle(
                                        fontSize: 28,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20),
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: ListView(
                                      padding: EdgeInsets.all(0),
                                      children: [],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
