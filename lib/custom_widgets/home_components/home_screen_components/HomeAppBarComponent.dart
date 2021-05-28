import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/login_screens/login_screen.dart';
import 'package:pa_bank_app/services/auth_service.dart';

class HomeAppBarComponent extends StatelessWidget {
  const HomeAppBarComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    return AppBar(
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: Text(
        "Pabank",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: kSeconderyColor,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.exit_to_app_outlined),
          tooltip: 'Çıkış',
          onPressed: () {
            _authService.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
