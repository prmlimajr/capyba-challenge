import 'package:capyba_app/models/logged_user.dart';
import 'package:capyba_app/screens/authenticate/authenticate.dart';
import 'package:capyba_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoggedUser>(context);
    print(user);

    return user == null ? Authenticate() : Home();
  }
}
