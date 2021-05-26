import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Authenticate/auth.dart';
import 'package:flutter_app/Screens/screens.dart';
import 'package:flutter_app/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return BottomNavScreen();
    }
  }
}
