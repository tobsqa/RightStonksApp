import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/screens.dart';
import 'package:flutter_app/models/authservice.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/models/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.green,
              scaffoldBackgroundColor: Colors.grey[900]),
          home: (Wrapper())),
    );
  }
}
