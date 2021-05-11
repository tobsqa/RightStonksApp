import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/screens.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StonksApp-Dashboard-UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white
      ),

      home: (
          BottomNavScreen()
      )
    );
  }
}



