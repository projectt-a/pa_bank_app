import 'package:flutter/material.dart';

class Pass extends StatefulWidget {
  Pass({Key key}) : super(key: key);

  @override
  _PassState createState() => _PassState();
}

class _PassState extends State<Pass> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: Center(
          child: TextField(
            obscureText: _isHidden,
            decoration: InputDecoration(
              hintText: 'Password',
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _isHidden ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
