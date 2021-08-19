import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/add_to_watchlist_button.dart';
import 'package:flutter_app/models/stock.dart';

class Suggestions extends StatelessWidget {
  final List<Stock> stocks;
  bool _percent = true;
  Suggestions({this.stocks});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: this.stocks.length,
            itemBuilder: (context, index) {
              final stock = this.stocks[index];
              var tickerimage =stock.symbol.toUpperCase();
              return Container(
                  color: Colors.black,
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          child: Container(
                              padding: const EdgeInsets.only(left: 12, right: 12),
                              child: ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                                  ),
                                  constraints: BoxConstraints.expand(
                                    height: 40.0,
                                    width: 40.0,
                                  ),
                                  child: ClipRRect(borderRadius: BorderRadius.circular(14), child: Image.network('https://storage.googleapis.com/iex/api/logos/$tickerimage.png',)),
                                ),
                                contentPadding: EdgeInsets.all(3),
                                  title: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("${stock.company}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500)),
                                      Text("\$${stock.symbol}",
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 18))
                                    ],
                                  ),
                                  trailing: WatchlistButton())),
                          onTap: () {
                            print(stock.company);
                            print(stock.symbol);
                            print(stock.price);
                          })));
            }));
  }
}
