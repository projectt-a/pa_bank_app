import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/HomeAppBarComponent.dart';
import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/HomeCardHistoryComponent.dart';
import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/compact_card_list.dart/CompactCardListComponent.dart';

import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/send_money_component/MainSendMoneyComponent.dart';
import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/send_money_component/SendMoneyTitle.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Column(
          children: [
            HomeAppBarComponent(),
            CompactCardListComponent(),
            SendMoneyTitle(),
            MainSendMoneyComponent(),
            HomeCardHistoryComponent(),
          ],
        ),
      ),
    );
  }
}
