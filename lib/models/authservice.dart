import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Cloudservices/database.dart';
import 'package:flutter_app/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user obj based on FirebaseUser
  MyUser _userFromFirebaseUser(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }
  //auth change user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and pw
  Future SignInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & pw
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      //create a new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserData('Tobi', 'Tobias Welti', 'brrrr');

      return _userFromFirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}