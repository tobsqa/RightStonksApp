class Crypto {

  final String symbol;
  final String company;
  final double price;
  final String percent;
  final String money;

  Crypto({this.symbol, this.company, this.price, this.percent, this.money});

  static List<Crypto> getAll() {

    List<Crypto> stocks = List<Crypto>();
    stocks.add(Crypto(company: "Bitcoin",symbol: "BTC", price: 258, percent: '- 7.02%', money: "- 5.02€"));
    stocks.add(Crypto(company: "Ethereum",symbol: "ETH", price: 800, percent: '+ 2.02%', money: "+ 7.02€"));
    stocks.add(Crypto(company: "Doge Coin",symbol: "DOGE", price: 56.00, percent: '+ 1.02%', money: "+ 3.02€"));
    stocks.add(Crypto(company: "Reservere Rights",symbol: "RSR", price: 178, percent: '- 5.02%', money: "- 5.02€"));

    return stocks;

  }

}