class Stock {

  final String symbol;
  final String company;
  final double price;

  Stock({this.symbol, this.company, this.price});

  static List<Stock> getAll() {

    List<Stock> stocks = List<Stock>();
    stocks.add(Stock(company: "Apple",symbol: "APPLE", price: 258));
    stocks.add(Stock(company: "General Electronic",symbol: "GE", price: 56.00));
    stocks.add(Stock(company: "Home Depot",symbol: "HE", price: 178));
    stocks.add(Stock(company: "Evergreen Solar",symbol: "EVR", price: 9.0));
    stocks.add(Stock(company: "Facebook",symbol: "FB", price: 200));
    stocks.add(Stock(company: "Samsung",symbol: "SAM", price: 134));
    stocks.add(Stock(company: "Snapchat",symbol: "SNAP", price: 45));
    stocks.add(Stock(company: "Microsoft",symbol: "MSOFT", price: 400));
    stocks.add(Stock(company: "GameStop",symbol: "GME", price: 18022));

    return stocks;

  }

}