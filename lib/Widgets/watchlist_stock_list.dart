import 'package:flutter/material.dart';
import 'package:flutter_app/models/stock.dart';

class StockList extends StatelessWidget {
  final List<Stock> stocks;
  bool _percent = true;
  StockList({this.stocks});
  final circlecolor = Colors.black;
  void current_color(){

  }

  @override
  Widget build(BuildContext context) {

    return StatefulBuilder(
        builder: (context, StateSetter setState) => ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider(color: Colors.grey[400], height: 7.5,);
            },
            itemCount: stocks != null ? this.stocks.length : 0,
            itemBuilder: (context, index) {
              final stock = this.stocks[index];

              return Container(
                  color: Colors.black,
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 260,
                                            child: Text("${stock.company}",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w500)),
                                          ),
                                              Text("\$${stock.price}",
                                                  style: TextStyle(
                                                      color: Colors.grey[400],
                                                      fontSize: 18)),
                                        ],
                                  ),
                                        Row(
                                          children: [
                                            Icon(Icons.circle, size: 8, color: circlecolor),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Container(
                                                child: Container(
                                                    width: 80,
                                                    height: 35,
                                                    child: Material(
                                                        color: stock.chg.contains("-")
                                                            ? (Colors.red)
                                                            : (Colors.green),
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                        child: InkWell(
                                                            borderRadius:
                                                            BorderRadius.circular(8),
                                                            child: Container(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                    _percent
                                                                        ? (stock.chg)
                                                                        : (stock.price),
                                                                    style: TextStyle(
                                                                        color:
                                                                        Colors.white))),
                                                            onTap: () => setState(
                                                                    () => (_percent = !_percent))))),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                          onTap: () {
                            print(stock.company);
                            print(stock.symbol);
                            print(stock.price);
                          })));
            }));
  }
}
