import 'package:flutter/material.dart';

import 'HomeAddPerson.dart';
import 'HomePersonCard.dart';
import 'SendMoneyTitle.dart';

class MainSendMoneyComponent extends StatelessWidget {
  const MainSendMoneyComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          SendMoneyTitle(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  HomeAddPerson(),
                  HomePersonCard(),
                  HomePersonCard(),
                  HomePersonCard(),
                  HomePersonCard(),
                  HomePersonCard(),
                  HomePersonCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
