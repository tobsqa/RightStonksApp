import 'package:provider/provider.dart';
import 'package:flutter_app/Cloudservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Cloudservices/database.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {

    final userdata = Provider.of<QuerySnapshot>(context);
    print(userdata);

    return Container();
  }
}
