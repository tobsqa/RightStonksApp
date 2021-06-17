import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference stockCollection = FirebaseFirestore.instance
      .collection('Watchlist');

  Future updateUserData(String username, String nametag,
      String otherdata) async {
    return await stockCollection.doc(uid).set({
      'username': username,
      'nametag': nametag,
      'otherdata': otherdata,
    });
  }

  Stream <QuerySnapshot> get userdata {
    return stockCollection.snapshots();
  }
}