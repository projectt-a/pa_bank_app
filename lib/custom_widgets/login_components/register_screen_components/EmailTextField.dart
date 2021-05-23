import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextFieldEmail extends StatefulWidget {
  @override
  _TextFieldEmailState createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Email',
            style: TextStyle(
              color: kPrimaryColor,
            )),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(),
          height: 50.0,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: kPrimaryColor),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Enter your email',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 14,
              ),
              suffixIcon: emailController.text == null ||
                      emailController.text.contains('@')
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.error),
                      onPressed: () {},
                    ),
            ),
            validator: (String value) {
              //backend böyle bir email varmı?? kısmı
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
