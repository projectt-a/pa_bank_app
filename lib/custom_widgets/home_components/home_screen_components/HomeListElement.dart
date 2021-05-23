import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class HomeListElement extends StatelessWidget {
  const HomeListElement({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSeconderyColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Container(
          height: 50,
          child: Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  color: kSeconderyColor,
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Image.asset(
                    "assets/images/netflix.png",
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Netflix",
                          style: new TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          "23.05.2021",
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
                      "- \$ 7.99",
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
    );
  }
}
