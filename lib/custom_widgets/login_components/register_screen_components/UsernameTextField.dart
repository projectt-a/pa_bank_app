import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class TextFieldUsername extends StatefulWidget {
  @override
  _TextFieldUsernameState createState() => _TextFieldUsernameState();
}

class _TextFieldUsernameState extends State<TextFieldUsername> {
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    usernameController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text('Username',
              style: TextStyle(
                color: kPrimaryColor,
              )),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 50.0,
          child: TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.name,
            style: TextStyle(color: kPrimaryColor),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Enter your username',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 14,
              ),
              suffixIcon: usernameController.text.isNotEmpty &&
                      !usernameController.text.contains('@')
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.error),
                      onPressed: () {},
                    ),
            ),
            validator: (String value) {
              //backend böyle bir username varmı?? kısmı
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
        ),
      ],
    );
  }
}
