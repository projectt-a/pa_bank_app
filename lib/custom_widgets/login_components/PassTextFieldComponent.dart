import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class PassTextFieldComponent extends StatefulWidget {
  const PassTextFieldComponent({
    Key key,
  }) : super(key: key);

  @override
  _PassTextFieldComponentState createState() => _PassTextFieldComponentState();
}

class _PassTextFieldComponentState extends State<PassTextFieldComponent> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            'Password',
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
            obscureText: _isHidden,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _isHidden ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.only(left: 10),
            ),
          ),
        ),
      ],
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
