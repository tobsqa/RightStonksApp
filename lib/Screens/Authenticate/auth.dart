import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Authenticate/login.dart';
import 'package:flutter_app/Screens/Authenticate/test.dart';
import 'package:flutter_app/Screens/Authenticate/startscreen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetStartedScreen(),
    );
  }
}
