import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({
    Key key,
    var mailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mailController;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Text(
            'Email address',
            style: new TextStyle(
              fontSize: 13,
              color: kPrimaryColor,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextFormField(
            controller: mailController,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.only(left: 10),
            ),
          ),
        ),
      ],
    );
  }
}
