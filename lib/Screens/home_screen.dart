import 'package:flutter/material.dart';
import 'package:flutter_app/models/authservice.dart';

class HomeScreen extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('STONKS', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.black38,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person,
            color: Colors.white,),
            label: Text('Logout',
            style: TextStyle(
                color: Colors.white,
            )),
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}