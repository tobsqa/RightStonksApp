class WSB {

  final String symbol;
  final String company;
  final double price;
  final String percent;
  final String money;

  WSB({this.symbol, this.company, this.price, this.percent, this.money});

  static List<WSB> getAll() {

    List<WSB> stocks = List<WSB>();
    stocks.add(WSB(company: "Samsung",symbol: "SAM", price: 134, percent: '+ 11.02%', money: "+ 5€"));
    stocks.add(WSB(company: "Snapchat",symbol: "SNAP", price: 45, percent: '+ 4.02%', money: "+ 5.02€"));
    stocks.add(WSB(company: "Microsoft",symbol: "MSOFT", price: 400, percent: '+ 2%', money: "+ 5.02€"));
    stocks.add(WSB(company: "Google",symbol: "GOOG", price: 1800, percent: '+ 4.20%', money: "+ 5.02€"));   ;

    return stocks;

  }

}