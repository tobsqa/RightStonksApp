import 'package:flutter/material.dart';

class DiscussScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      color: Colors.black87,
      child: Column(children: <Widget> [
        Text('Discussion')

      ],

      ),

    );
  }
}