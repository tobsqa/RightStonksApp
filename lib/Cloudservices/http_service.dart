import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_app/models/stock.dart';

class HttpService {
  final String stockURL = "http://192.168.56.1:8080/getStock";

  Future<List<Stock>> getStocks() async {
    Response res = await get(Uri.parse(stockURL));

    if (res.statusCode == 200) {
      final obj = jsonDecode(res.body);
      print(obj['stock'][0]['symbol']);
      List<Stock> stocks =  new List<Stock>();

      for (int i = 0; i < obj['stock'].length; i++) {
        Stock stock = new Stock(symbol: obj['stock'][i]['symbol'], company: obj['stock'][i]['name'], price: obj['stock'][i]['price'], chg: obj['stock'][i]['chg']);
        stocks.add(stock);
      }

      return stocks;
    } else {
      throw "Unable to retrieve stock data from http_service.";
    }
  }
}