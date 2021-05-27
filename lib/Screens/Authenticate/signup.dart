import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Authenticate/login.dart';
import 'package:flutter_app/Screens/Authenticate/startscreen.dart';
import 'package:flutter_app/models/authservice.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //textfieldstate
  String username = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetStartedScreen()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                  )
                ],
              ),
              inputFile(),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.white),
                      top: BorderSide(color: Colors.white),
                      left: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.white),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'An Error occurred';
                        });
                      }
                    }
                  },
                  color: Color(0xff62dc94),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  TextButton(
                    child: Text("Login",
                        style: TextStyle(
                          color: Colors.blue[400],
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// we will be creating a widget for text field
  Widget inputFile() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Username',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Please enter username' : null,
            onChanged: (val) {
              setState(() {
                username = val;
              });
            },
            obscureText: false,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Email',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (val) =>
                val.isEmpty ? 'Please enter a valid email address' : null,
            onChanged: (val) {
              setState(() {
                email = val;
              });
            },
            obscureText: false,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Password',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (val) {
              if (val.isEmpty) {
                return "Please enter password";
              } else if (val.length < 6) {
                return "Password must be atleast 6 characters long";
              } else {
                return null;
              }
            },
            onChanged: (val) {
              setState(() {
                password = val;
              });
            },
            obscureText: true,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Confirm password',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (val) {
              if (val.isEmpty) {
                return "Please re-enter new password";
              } else if (val.length < 6) {
                return "Password must be atleast 6 characters long";
              } else if (val != password) {
                return "Password must be same as above";
              } else {
                return null;
              }
            },
            onChanged: (val) {
              setState(() {
                confirmpassword = val;
              });
            },
            obscureText: true,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]))),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
