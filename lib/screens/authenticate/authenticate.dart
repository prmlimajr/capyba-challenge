import 'package:capyba_app/screens/authenticate/register.dart';
import 'package:capyba_app/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn == true
        ? Container(child: SignIn(toggleView: toggleView))
        : Container(child: Register(toggleView: toggleView));
  }
}
