import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalysisScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TopBar(),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              AppBar(
                title: const Text('AppBar Demo'),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.alarm ),
                    tooltip: 'Show Snackbar',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('This is a snackbar')));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_alert),
                    tooltip: 'Go to the next page',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: const Text('Next page'),
                            ),
                            body: const Center(
                              child: Text(
                                'This is the next page',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          );
                        },
                      ));
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  'Ticker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
