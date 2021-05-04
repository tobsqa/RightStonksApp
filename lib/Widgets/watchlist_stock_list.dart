import 'package:flutter/material.dart';
import 'package:flutter_app/models/stock.dart';
import 'package:flutter_app/Widgets/percent_or_money_widget.dart';

class StockList extends StatelessWidget {
  final List<Stock> stocks;
  bool _percent = true;
  StockList({this.stocks});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider(color: Colors.grey[500]);
            },
            itemCount: this.stocks.length,
            itemBuilder: (context, index) {
              final stock = this.stocks[index];

              return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${stock.company}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                      Text("\$${stock.price}",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 20))
                    ],
                  ),
                  trailing: SizedBox(
                      width: 80,
                      height: 35,
                      child: InkWell(
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: stock.money.contains("-")
                                      ? (Colors.red)
                                      : (Colors.green)),
                              child: Text(
                                  _percent ? (stock.percent) : (stock.money),
                                  style: TextStyle(color: Colors.white))),
                          onTap: () =>
                              setState(() => (_percent = !_percent)))));
            }));
  }
}
