import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_app/models/stock.dart';
import 'package:flutter_app/Screens/screens.dart';

import 'package:flutter_app/Cloudservices/http_service.dart';
import 'package:flutter_app/models/stock.dart';
import 'package:flutter_app/Widgets/watchlist_stock_list.dart';
import 'package:intl/intl.dart';

class WatchlistScreen extends StatefulWidget {
  final title;
  WatchlistScreen({this.title});

  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  String _toptext = 'Watchlist';
  // var _list = Stock.getWatchlist();
  bool _search = false;
  bool Searchmode = false;
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return _search ? Searchbar() : Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  '$_toptext',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: SizedBox(
                      height: 45,
                      child: InkWell(
                        child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15.0),
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                hintText: 'Search',
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.grey[400], size: 25),
                                fillColor: Colors.grey[900],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16))))),
                        onTap: () {
                          setState(() {
                           _search = true;
                          });
                        },
                      ))),
              Container(
                  height: 75,
                  margin: EdgeInsets.only(top: 20, left: 16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ScreenCategorys('images/bookmark.png', 'Watchlist',
                          'Watchlist'),
                      ScreenCategorys('images/gorilla.png', 'WSB',
                          'WallStreetBets'),
                      ScreenCategorys('images/fire.png', 'Hot', 'Hot Stocks',),
                      ScreenCategorys('images/money.png', 'Indices', 'Indieces',),
                      ScreenCategorys('images/bitcoin.png', 'Crypto', 'Crypto',),
                    ],
                  )),
              CurrentList()
            ],
          ),
        ));
  }

  Widget ScreenCategorys(String image, String name, String mytoptext) {
    return Container(
        margin: EdgeInsets.only(right: 15),
        width: 75,
        child: Material(
          borderRadius: BorderRadius.circular(18),
          color: Colors.grey[900],
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 40,
                width: 40,
                child: Image.asset(image),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 11,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            setState(() {
              _toptext = mytoptext;
              // _list = mylist;
            });
          },
        )));
  }

//Widget for diffrent Lists
// was mylist before to work with swiching the diffrent categorys

  Widget CurrentList() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: FutureBuilder(
        future: httpService.getStocks(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Stock>> stockdata) {
          if (stockdata.hasData) {
            List<Stock> stocks = stockdata.data;
            return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: StockList(
                  stocks: stocks,
                ));
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
