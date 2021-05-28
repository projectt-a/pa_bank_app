import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/custom_widgets/login_components/register_screen_components/RegisterFormField.dart';
import 'package:pa_bank_app/screens/home_screens/home_screen.dart';
import 'package:pa_bank_app/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isHidden = true;

  var textEditingControllerEmail = TextEditingController();
  var textEditingControllerPassword = TextEditingController();
  var textEditingControllerUsername = TextEditingController();

  AuthService _authService = AuthService();

  @override
  void initState() {
    textEditingControllerEmail.addListener(() {
      setState(() {});
    });

    textEditingControllerPassword.addListener(() {
      setState(() {});
    });

    textEditingControllerUsername.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: kSeconderyColor,
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 80.0,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RegisterFormField(),
                              SizedBox(height: 80.0),
                              _buildTextFieldEmail(),
                              SizedBox(height: 5.0),
                              _buildTextFieldUsername(),
                              SizedBox(height: 5.0),
                              _buildTextFieldPassword(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.35,
              left: (MediaQuery.of(context).size.width / 2) - 26,
              //top: MediaQuery.of(context).size.height / 1.30 + 35,
              //left: (MediaQuery.of(context).size.width / 2) - 35,
              child: _buildRegisterButton(),
            ),
          ],
        ),
      ),
    );
  }

  _buildRegisterButton() {
    return FloatingActionButton(
      onPressed: () async {
        _authService
            .createUser(
          textEditingControllerEmail.text,
          textEditingControllerUsername.text,
          textEditingControllerPassword.text,
        )
            .then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      },
      child: const Icon(Icons.arrow_forward_sharp),
      backgroundColor: kPrimaryColor,
    );
  }

  _buildTextFieldEmail() {
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
            controller: textEditingControllerEmail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: kPrimaryColor),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Enter your email',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 14,
              ),
              suffixIcon: textEditingControllerEmail.text == null ||
                      textEditingControllerEmail.text.contains('@')
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

  _buildTextFieldUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text('Name Surname',
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
            controller: textEditingControllerUsername,
            keyboardType: TextInputType.name,
            style: TextStyle(color: kPrimaryColor),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Enter your Name and Surname',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 14,
              ),
              suffixIcon: textEditingControllerUsername.text.isNotEmpty &&
                      !textEditingControllerUsername.text.contains('@')
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

  _buildTextFieldPassword() {
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
            controller: textEditingControllerPassword,
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
