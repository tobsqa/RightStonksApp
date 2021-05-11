import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/screens.dart';
import 'package:flutter_app/Widgets/search_stock_widget.dart';
import 'package:flutter_app/models/stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_app/Widgets/watchlist_stock_list.dart';
import 'package:flutter_app/Widgets/search_stock_widget.dart';

class Searchbar extends StatefulWidget {
  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextFieldController = TextEditingController();
  bool Watchlist = false;
  void initState() {
    super.initState();
    TextFieldController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Watchlist? WatchlistScreen() : MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 100,
              title: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(children: <Widget>[
                    Container(
                      height: 45,
                      width: 60,
                      child: BackButton(),
                    ),
                    Container(
                        height: 45,
                        width: 300,
                        child: TextField(
                            controller: TextFieldController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15.0),
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                hintText: 'Search',
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.grey[400], size: 25),
                                suffixIcon: TextFieldController.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () =>
                                            TextFieldController.clear(),
                                        color: Colors.grey[400]),
                                fillColor: Colors.grey[900],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16)))))),
                  ])),
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey[400],
                tabs: [
                  Tab(icon: Text('All')),
                  Tab(icon: Text('History')),
                ],
              ),
            ),
            body: Container(
              color: Colors.black,
              child: TabBarView(
                children: [
                  ListView(
                    children: <Widget>[
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: DividerWithText(
                                dividerText: 'Popular Stocks',
                              )),
                          RecommendedList(),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: DividerWithText(
                                dividerText: 'Popular Crypto',
                              )),
                          RecommendedList(),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: DividerWithText(
                                dividerText: 'Popular Assets',
                              )),
                          RecommendedList(),
                        ],
                      ),
                    ],
                  ),
                  RecommendedList(),
                ],
              ),
            )),
      ),
    );
  }

  Widget BackButton() {
    return Container(
        margin: EdgeInsets.only(right: 15),
        child: Material(
            borderRadius: BorderRadius.circular(18),
            color: Colors.green,
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                margin: EdgeInsets.all(12),
                height: 40,
                width: 40,
                child: Image.asset('images/arrow.png'),
              ),
                onTap: () {
                  setState(() {
                    Watchlist = true;
                  });
                },
            )));
  }

  Widget RecommendedList() {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
      ),
      height: 185,
      child: Suggestions(stocks: Stock.getSuggestionStocks()),
    );
  }
}
