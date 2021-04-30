class Hot {

  final String symbol;
  final String company;
  final double price;
  final String percent;
  final String money;

  Hot({this.symbol, this.company, this.price, this.percent, this.money});

  static List<Hot> getAll() {

    List<Hot> stocks = List<Hot>();
    stocks.add(Hot(company: "Apple",symbol: "APPLE", price: 258, percent: '- 7.02%', money: "- 5.02€"));
    stocks.add(Hot(company: "Alphabet",symbol: "ALPH", price: 800, percent: '+ 2.02%', money: "+ 7.02€"));
    stocks.add(Hot(company: "Snapchat",symbol: "SNAP", price: 45, percent: '+ 4.02%', money: "+ 5.02€"));
    stocks.add(Hot(company: "Microsoft",symbol: "MSOFT", price: 400, percent: '+ 2%', money: "+ 5.02€"));
    stocks.add(Hot(company: "Google",symbol: "GOOG", price: 1800, percent: '+ 4.20%', money: "+ 5.02€"));   ;

    return stocks;

  }

}