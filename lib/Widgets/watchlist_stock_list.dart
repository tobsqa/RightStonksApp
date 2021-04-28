import 'package:flutter/material.dart';
import 'package:flutter_app/models/stock.dart';

class StockList extends StatelessWidget {

  final List<Stock> stocks;

  StockList({this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
                Text("${stock.company}", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
                Text("\$${stock.price}",style: TextStyle(color: Colors.grey[500], fontSize: 20))
              ],
            ),
            trailing: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green
                    ),
                    width: 80,
                    height: 35,
                    child: Text("+4.09%",style: TextStyle(color: Colors.white))
                )
          );
        }
    );
  }

}