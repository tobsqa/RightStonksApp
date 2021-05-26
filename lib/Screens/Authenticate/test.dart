import 'package:flutter/material.dart';
import 'package:flutter_app/models/authservice.dart';

class SignInTest extends StatefulWidget {
  const SignInTest({Key key}) : super(key: key);

  @override
  _SignInTestState createState() => _SignInTestState();
}

class _SignInTestState extends State<SignInTest> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black38,
        elevation: 0.0,
        title: Text('Sign in to STONKSAPP'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0,),
        child: RaisedButton(
            child: Text('Rein da'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print ('Error signing in');
              } else {
                print ('Signed in');
                print(result.uid);
              }

            }),
      )
    );
  }
}
