import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/userdatamodel.dart';

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

  //userdata list from snapshot
  List<Userdata> _userdataFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Userdata(
        username: doc.get('username') ?? " ",
        nametag: doc.get('nametag') ?? " ",
        otherdata: doc.get('otherdata') ?? " ",
      );
    });
  }

  Stream <List<Userdata>> get myuserdata {
    return stockCollection.snapshots()
        .map(_userdataFromSnapshot);
  }
}