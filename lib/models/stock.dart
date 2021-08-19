class Stock {

  final String symbol;
  final String company;
  final String price;
  final String chg;

  Stock({this.symbol, this.company, this.price, this.chg});

  // static List<Stock> getStocks() {
  //   List<Stock> stocks = List<Stock>();
  //   stocks.add(new Stock(symbol: "GOOG", company: "Google", price: '200', chg: "11"));
  //
  //   return stocks;
  // }

// static List<Stock> getWatchlist() {
  //
  //   List<Stock> stocks = List<Stock>();
  //   stocks.add(Stock(company: "Apple",symbol: "APPLE", price: 258, chg: '- 7.02%', money: "- 5.02€"));
  //   stocks.add(Stock(company: "Alphabet",symbol: "ALPH", price: 800, chg: '+ 2.02%', money: "+ 7.02€"));
  //   stocks.add(Stock(company: "General Electronic",symbol: "GE", price: 56.00, chg: '+ 1.02%', money: "+ 3.02€"));
  //   stocks.add(Stock(company: "Home",symbol: "HE", price: 178, chg: '- 5.02%', money: "- 5.02€"));
  //   stocks.add(Stock(company: "Evergreen Solar",symbol: "EVR", price: 9.0, chg: '+ 3.02%', money: "+ 8.02€"));
  //   stocks.add(Stock(company: "Facebook",symbol: "FB", price: 200, chg: '- 10.02%', money: "- 4€"));
  //   stocks.add(Stock(company: "Facebook",symbol: "FB", price: 200, chg: '- 10.02%', money: "- 4€"));
  //   stocks.add(Stock(company: "Samsung",symbol: "SAM", price: 134, chg: '+ 11.02%', money: "+ 5€"));
  //   stocks.add(Stock(company: "Snapchat",symbol: "SNAP", price: 45, chg: '+ 4.02%', money: "+ 5.02€"));
  //   stocks.add(Stock(company: "Microsoft",symbol: "MSOFT", price: 400, chg: '+ 2%', money: "+ 5.02€"));
  //   stocks.add(Stock(company: "Google",symbol: "GOOG", price: 1800, chg: '+ 4.20%', money: "+ 5.02€"));   ;
  //
  //   return stocks;
  //
  // }
  //
  // static List<Stock> getWSB() {
  //
  //   List<Stock> wsbstocks = List<Stock>();
  //   wsbstocks.add(Stock(company: "GameStop",symbol: "GME", price: 90000, chg: '+ 682%', money: "+ 5.02€"));
  //   wsbstocks.add(Stock(company: "Nokia",symbol: "NOK", price: 800, chg: '+ 2.02%', money: "+ 7.02€"));
  //   wsbstocks.add(Stock(company: "General Electronic",symbol: "GE", price: 56.00, chg: '+ 1.02%', money: "+ 3.02€"));
  //   wsbstocks.add(Stock(company: "Palantir",symbol: "PLNTR", price: 178, chg: '- 5.02%', money: "- 5.02€"));
  //
  //   return wsbstocks;
  //
  // }
  // static List<Stock> getHot() {
  //
  //   List<Stock> hotstocks = List<Stock>();
  //   hotstocks.add(Stock(company: "Nokia",symbol: "GME", price: 90000, chg: '+ 682%', money: "+ 5.02€"));
  //   hotstocks.add(Stock(company: "To the",symbol: "NOK", price: 800, chg: '+ 2.02%', money: "+ 7.02€"));
  //   hotstocks.add(Stock(company: "Fucking",symbol: "GE", price: 56.00, chg: '+ 1.02%', money: "+ 3.02€"));
  //   hotstocks.add(Stock(company: "MOOOON",symbol: "PLNTR", price: 178, chg: '- 5.02%', money: "- 5.02€"));
  //
  //   return hotstocks;
  //
  // }
  // static List<Stock> getIndieces() {
  //
  //   List<Stock> indieces = List<Stock>();
  //   indieces.add(Stock(company: "S&P 500",symbol: "GME", price: 90000, chg: '+ 682%', money: "+ 5.02€"));
  //   indieces.add(Stock(company: "MSCI World",symbol: "NOK", price: 800, chg: '+ 2.02%', money: "+ 7.02€"));
  //   indieces.add(Stock(company: "Sheeesh",symbol: "GE", price: 56.00, chg: '+ 1.02%', money: "+ 3.02€"));
  //   indieces.add(Stock(company: "ARK",symbol: "PLNTR", price: 178, chg: '- 5.02%', money: "- 5.02€"));
  //
  //   return indieces;
  //
  // }
  // static List<Stock> getCrypto() {
  //
  //   List<Stock> cryptos = List<Stock>();
  //   cryptos.add(Stock(company: "Bitcoin",symbol: "GME", price: 90000, chg: '+ 682%', money: "+ 5.02€"));
  //   cryptos.add(Stock(company: "Ethereum",symbol: "ETH", price: 800, chg: '+ 2.02%', money: "+ 7.02€"));
  //   cryptos.add(Stock(company: "XRP Ripple",symbol: "XRP", price: 56.00, chg: '+ 1.02%', money: "+ 3.02€"));
  //   cryptos.add(Stock(company: "Binance Coin",symbol: "BNC", price: 178, chg: '- 5.02%', money: "- 5.02€"));
  //
  //   return cryptos;
  //
  // }
  //
  // static List<Stock> getSuggestionStocks() {
  //
  //   List<Stock> sugstocks = List<Stock>();
  //   sugstocks.add(Stock(company: "GameStop",symbol: "GME", price: 90000, chg: '+ 682%', money: "+ 5.02€"));
  //   sugstocks.add(Stock(company: "Tesla Inc.",symbol: "TSLA", price: 800, chg: '+ 2.02%', money: "+ 7.02€"));
  //   sugstocks.add(Stock(company: 'Nokia',symbol: "NOK", price: 56.00, chg: '+ 1.02%', money: "+ 3.02€"));
  //
  //   return sugstocks;
  //
  // }
  //
  // static List<Stock> getSuggestionCrypto() {
  //
  //   List<Stock> sugcryptos = List<Stock>();
  //   sugcryptos.add(Stock(company: "Bitcoin",symbol: "BTC", price: 90000, chg: '+ 682%', money: "+ 5.02€"));
  //   sugcryptos.add(Stock(company: "Ethereum",symbol: "ETH", price: 800, chg: '+ 2.02%', money: "+ 7.02€"));
  //   sugcryptos.add(Stock(company: "Dogecoin",symbol: "DOGE", price: 56.00, chg: '+ 1.02%', money: "+ 3.02€"));
  //
  //   return sugcryptos;
  //
  // }
  //
  // static List<Stock> getSuggestionAssets() {
  //
  //   List<Stock> sugassets = List<Stock>();
  //   sugassets.add(Stock(company: "HouseMarket",symbol: "HM", price: 90000, chg: '+ 682%', money: "+ 5.02€"));
  //   sugassets.add(Stock(company: "Gold",symbol: "GLD", price: 800, chg: '+ 2.02%', money: "+ 7.02€"));
  //   sugassets.add(Stock(company: "Silver",symbol: "SILV", price: 56.00, chg: '+ 1.02%', money: "+ 3.02€"));
  //
  //   return sugassets;
  //
  // }

}