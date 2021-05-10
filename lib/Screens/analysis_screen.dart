import 'dart:ui';
import 'package:flutter_app/Screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/add_to_watchlist_button.dart';

class AnalysisScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Stockscreen();
}

class Stockscreen extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TopBar(),
    );
  }
}

class TopBar extends StatelessWidget {
  bool _state = true;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) => Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.black,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        color: Colors.green,
                        onPressed: () {}),
                    WatchlistButton()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ticker',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'StockName',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "\$1,234.56",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:15, bottom: 15),
                          child: SizedBox(
                              width: 80,
                              height: 35,
                              child: InkWell(
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.green),
                                      child: Text("lol",
                                          style:
                                              TextStyle(color: Colors.white))),
                                  onTap: () => setState(
                                        () => (print("lol")),
                                      ))),
                        ),
                      ],
                    ),
                    Container(
                      height: 195,
                      color: Colors.green,

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
