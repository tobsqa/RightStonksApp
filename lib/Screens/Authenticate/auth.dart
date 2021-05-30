import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Authenticate/login.dart';
import 'package:flutter_app/Screens/Authenticate/signup.dart';
import 'package:flutter_app/Screens/Authenticate/test.dart';
import 'package:flutter_app/Screens/Authenticate/startscreen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key key}) : super(key: key);

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
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    }
    else {
      return SignupPage(toggleView: toggleView);
    }
  }
}
