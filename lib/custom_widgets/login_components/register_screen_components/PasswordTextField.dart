import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class TextFieldPassword extends StatefulWidget {
  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text('Password',
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
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(color: kPrimaryColor),
            obscureText: _isHidden,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14.0),
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      _isHidden = !_isHidden;
                    });
                  },
                  child: Icon(_isHidden
                      ? Icons.visibility
                      : Icons.visibility_off), //yer mi degistirmeli ??
                ),
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                )),
            validator: (String value) {
              //backend böyle bir password varmı?? kısmı
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
