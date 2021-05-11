import 'dart:convert';
import 'package:http/http.dart' as http;

class IEXAPIService {
  Future<dynamic> IEX_Interday(String stockTicker, String neededData) async {
    final response = await http.get(
      Uri.parse(
          "https://sandbox.iexapis.com/stable/stock/$stockTicker/intraday-prices?token=Tpk_03d1f30e9b96462d88413971aa3af626"),
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      List<dynamic> numberOfTrades = [];
      data.forEach(
          (location) => numberOfTrades.add(location['numberOfTrades']));
      List<dynamic> label = [];
      data.forEach((location) => label.add(location['label']));
      List<dynamic> close = [];
      data.forEach((location) => close.add(location['close']));
      List<dynamic> open = [];
      data.forEach((location) => open.add(location['open']));
      List<dynamic> low = [];
      data.forEach((location) => low.add(location['low']));
      List<dynamic> high = [];
      data.forEach((location) => high.add(location['high']));
      List<dynamic> date = [];
      data.forEach((location) => date.add(location['date']));
      List<dynamic> minute = [];
      data.forEach((location) => minute.add(location['minute']));
      if (data != null) {
        switch (neededData) {
          case 'numberOfTrades':
            {
              return numberOfTrades;
              break;
            }
          case 'label':
            {
              return label;
              break;
            }
          case 'close':
            {
              return close;
              break;
            }
          case 'open':
            {
              return open;
              break;
            }
          case 'low':
            {
              return low;
              break;
            }
          case 'high':
            {
              return high;
              break;
            }
          case 'date':
            {
              return date;
              break;
            }
          case 'minute':
            {
              return minute;
              break;
            }
          default:
            {
              return null;
            }
        }
      }
    }

    print("FAILED!");
  }

  Future<dynamic> IEX_HistoricalData5D(String stockTicker, String neededData) async {
    final response = await http.get(
      Uri.parse(
          "https://sandbox.iexapis.com/stable/stock/$stockTicker/chart/5dm?token=Tpk_03d1f30e9b96462d88413971aa3af626"),
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      List<dynamic> numberOfTrades = [];
      data.forEach(
              (location) => numberOfTrades.add(location['numberOfTrades']));

      List<dynamic> close = [];
      data.forEach((location) => close.add(location['close']));
      List<dynamic> open = [];
      data.forEach((location) => open.add(location['open']));
      List<dynamic> low = [];
      data.forEach((location) => low.add(location['low']));
      List<dynamic> high = [];
      data.forEach((location) => high.add(location['high']));
      List<dynamic> date = [];
      data.forEach((location) => date.add(location['date']));
      List<dynamic> changePercent = [];
      data.forEach(
              (location) => changePercent.add(location['changePercent']));

      if (data != null) {
        switch (neededData) {
          case 'changePercent':
            {
              return changePercent;
            }
          case 'close':
            {
              return close;
              break;
            }
          case 'open':
            {
              return open;
              break;
            }
          case 'low':
            {
              return low;
              break;
            }
          case 'high':
            {
              return high;
              break;
            }
          case 'date':
            {
              return date;
              break;
            }
          default:
            {
              return null;
            }
        }
      }
    }
    print("FAILED!");
  }

  Future<dynamic> IEX_HistoricalData1M(String stockTicker, String neededData) async {
    final response = await http.get(
      Uri.parse(
          "https://sandbox.iexapis.com/stable/stock/$stockTicker/chart/1mm?token=Tpk_03d1f30e9b96462d88413971aa3af626"),
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      List<dynamic> numberOfTrades = [];
      data.forEach(
              (location) => numberOfTrades.add(location['numberOfTrades']));

      List<dynamic> close = [];
      data.forEach((location) => close.add(location['close']));
      List<dynamic> open = [];
      data.forEach((location) => open.add(location['open']));
      List<dynamic> low = [];
      data.forEach((location) => low.add(location['low']));
      List<dynamic> high = [];
      data.forEach((location) => high.add(location['high']));
      List<dynamic> date = [];
      data.forEach((location) => date.add(location['date']));
      List<dynamic> changePercent = [];
      data.forEach(
              (location) => changePercent.add(location['changePercent']));

      if (data != null) {
        switch (neededData) {
          case 'changePercent':
            {
              return changePercent;
            }
          case 'close':
            {
              return close;
              break;
            }
          case 'open':
            {
              return open;
              break;
            }
          case 'low':
            {
              return low;
              break;
            }
          case 'high':
            {
              return high;
              break;
            }
          case 'date':
            {
              return date;
              break;
            }
          default:
            {
              return null;
            }
        }
      }
    }
    print("FAILED!");
  }

  Future<dynamic> IEX_HistoricalData1Y(String stockTicker, String neededData) async {
    final response = await http.get(
      Uri.parse(
          "https://sandbox.iexapis.com/stable/stock/$stockTicker/chart/1y?token=Tpk_03d1f30e9b96462d88413971aa3af626"),
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      List<dynamic> close = [];
      data.forEach((location) => close.add(location['close']));
      List<dynamic> open = [];
      data.forEach((location) => open.add(location['open']));
      List<dynamic> low = [];
      data.forEach((location) => low.add(location['low']));
      List<dynamic> high = [];
      data.forEach((location) => high.add(location['high']));
      List<dynamic> date = [];
      data.forEach((location) => date.add(location['date']));
      List<dynamic> changePercent = [];
      data.forEach((location) => changePercent.add(location['changePercent']));

      if (data != null) {
        switch (neededData) {
          case 'changePercent':
            {
              return changePercent;
            }
          case 'close':
            {
              return close;
              break;
            }
          case 'open':
            {
              return open;
              break;
            }
          case 'low':
            {
              return low;
              break;
            }
          case 'high':
            {
              return high;
              break;
            }
          case 'date':
            {
              return date;
              break;
            }
          default:
            {
              return null;
            }
        }
      }
      print("FAILED!");
    }
  }

    Future<dynamic> IEX_HistoricalData5Y(String stockTicker, String neededData) async {
      final response = await http.get(
        Uri.parse(
            "https://sandbox.iexapis.com/stable/stock/$stockTicker/chart/5y?token=Tpk_03d1f30e9b96462d88413971aa3af626"),
      );
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        List<dynamic> numberOfTrades = [];
        data.forEach(
            (location) => numberOfTrades.add(location['numberOfTrades']));

        List<dynamic> close = [];
        data.forEach((location) => close.add(location['close']));
        List<dynamic> open = [];
        data.forEach((location) => open.add(location['open']));
        List<dynamic> low = [];
        data.forEach((location) => low.add(location['low']));
        List<dynamic> high = [];
        data.forEach((location) => high.add(location['high']));
        List<dynamic> date = [];
        data.forEach((location) => date.add(location['date']));
        List<dynamic> changePercent = [];
        data.forEach(
            (location) => changePercent.add(location['changePercent']));

        if (data != null) {
          switch (neededData) {
            case 'changePercent':
              {
                return changePercent;
              }
            case 'close':
              {
                return close;
                break;
              }
            case 'open':
              {
                return open;
                break;
              }
            case 'low':
              {
                return low;
                break;
              }
            case 'high':
              {
                return high;
                break;
              }
            case 'date':
              {
                return date;
                break;
              }
            default:
              {
                return null;
              }
          }
        }
      }
      print("FAILED!");
    }

}
