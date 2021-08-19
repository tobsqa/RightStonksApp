import 'package:flutter/material.dart';
import 'package:flutter_app/models/authservice.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/models/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Cloudservices/http_service.dart';

//Colors Palette
//https://coolors.co/ec0b43-08b2e3-efca08-f49f0a-31e981

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
