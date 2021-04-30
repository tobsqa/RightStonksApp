class Indieces {

  final String symbol;
  final String company;
  final double price;
  final String percent;
  final String money;

  Indieces({this.symbol, this.company, this.price, this.percent, this.money});

  static List<Indieces> getAll() {

    List<Indieces> stocks = List<Indieces>();
    stocks.add(Indieces(company: "SP500",symbol: "SP", price: 400, percent: '+ 2%', money: "+ 5.02€"));
    stocks.add(Indieces(company: "MSCI World",symbol: "MSCI", price: 1800, percent: '+ 4.20%', money: "+ 5.02€"));   ;

    return stocks;

  }

}