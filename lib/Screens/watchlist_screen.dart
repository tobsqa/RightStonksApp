import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Widgets/watchlist_stock_list.dart';
import 'package:flutter_app/models/stock.dart';

class WatchlistScreen extends StatefulWidget {
  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  String _toptext = 'Watchlist';
  var _list = Stock.getWatchlist();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      height: 50,
                      child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              hintText: 'Search',
                              prefix: Icon(Icons.search,
                                  color: Colors.grey[500], size: 20),
                              fillColor: Colors.grey[900],
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(16))))))),
              Container(
                  height: 75,
                  margin: EdgeInsets.only(top: 20, left: 16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ScreenCategorys('images/bookmark.png', 'Watchlist',
                          'Watchlist', Stock.getWatchlist()),
                      ScreenCategorys('images/gorilla.png', 'WSB',
                          'WallStreetBets', Stock.getWSB()),
                      ScreenCategorys('images/fire.png', 'Hot', 'Hot Stocks',
                          Stock.getHot()),
                      ScreenCategorys('images/money.png', 'Indices', 'Indieces',
                          Stock.getIndieces()),
                      ScreenCategorys('images/bitcoin.png', 'Crypto', 'Crypto',
                          Stock.getCrypto()),
                    ],
                  )),
              Container(child: List())
            ],
          ),
        ));
  }

  Widget ScreenCategorys(String image, String name, String mytoptext, mylist) {
    return Container(
        margin: EdgeInsets.only(right: 15),
        width: 75,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(18),
        ),
        child: InkWell(
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
                    color: Colors.grey[500],
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
              _list = mylist;
            });
          },
        ));
  }

//Widget for diffrent Lists
  Widget List() {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
      height: MediaQuery.of(context).size.height,
      child: StockList(stocks: _list),
    );
  }
}
