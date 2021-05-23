import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/HomeAppBarComponent.dart';
import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/HomeListElement.dart';
import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/compact_card_list.dart/CompactCardListComponent.dart';
import 'package:pa_bank_app/custom_widgets/home_components/home_screen_components/send_money_component/MainSendMoneyComponent.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _bottomContainerIcon = true;
  void _bottomContainerIconChanger() {
    setState(() {
      _bottomContainerIcon = !_bottomContainerIcon;
    });
  }

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
            MainSendMoneyComponent(),
            buildExpanded(context),
          ],
        ),
      ),
    );
  }

  Expanded buildExpanded(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: Container(
          width: _bottomContainerIcon
              ? double.infinity
              : MediaQuery.of(context).size.width,
          height: _bottomContainerIcon
              ? double.infinity
              : MediaQuery.of(context).size.height / 1.1,
          decoration: BoxDecoration(
            color: kSeconderyColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              IconButton(
                iconSize: 50,
                padding: EdgeInsets.all(0),
                icon: Icon(
                  _bottomContainerIcon
                      ? Icons.expand_less_outlined
                      : Icons.expand_more_outlined,
                  color: kPrimaryColor,
                ),
                tooltip: 'Genişlet',
                onPressed: () {
                  _bottomContainerIcon
                      ? _bottomCardF(context)
                      : Navigator.pop(context);
                  _bottomContainerIconChanger();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Text(
                          "History",
                          style: new TextStyle(
                            fontSize: 22,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 33,
                      padding: EdgeInsets.only(right: 20),
                      icon: const Icon(
                        Icons.pie_chart_outline_outlined,
                        color: kPrimaryColor,
                      ),
                      tooltip: 'Genişlet',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: [
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _bottomCardF(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return buildExpanded(context);
      },
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
    );
  }
}

/* class BottomContainer extends StatelessWidget {
  const BottomContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: kSeconderyColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              IconButton(
                iconSize: 50,
                padding: EdgeInsets.all(0),
                icon: const Icon(
                  Icons.expand_less_outlined,
                  color: kPrimaryColor,
                ),
                tooltip: 'Genişlet',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CompactAppleCard()),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Text(
                          "History",
                          style: new TextStyle(
                            fontSize: 22,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 33,
                      padding: EdgeInsets.only(right: 20),
                      icon: const Icon(
                        Icons.pie_chart_outline_outlined,
                        color: kPrimaryColor,
                      ),
                      tooltip: 'Genişlet',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: [
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                        HomeListElement(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/
