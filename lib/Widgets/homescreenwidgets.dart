import 'package:provider/provider.dart';
import 'package:flutter_app/Cloudservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Cloudservices/database.dart';
import 'package:flutter_app/models/userdatamodel.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {

    final myuserdata = Provider.of<List<Userdata>>(context);
    if (myuserdata != null)
      myuserdata.forEach((element) {
        print(element.username);
        print(element.nametag);
        print(element.otherdata);
      });

    return Container();
  }
}

// aktuell Homescreen Datenscheiss buggy und worked nicht verstehe noch nicht wieso
// #19 Video kommt Fehler auf An exception was throw by
// _MapStream<QuerySnapshot<Map<String, dynamic>>, List<Userdata>> listened by
