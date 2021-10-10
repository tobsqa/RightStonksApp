import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter_app/models/stock.dart';
import 'package:flutter_app/models/analysts.dart';

class IEXCloudServicePrice {
  final String stockURL =
      "https://sandbox.iexapis.com/stable/stock/TSLA/quote/latestPrice?token=Tpk_85b3b5cdb32147d3a0fb751cc5176cdd";

  Future<String> getData() async {
    Response res = await get(Uri.parse(stockURL));

    if (res.statusCode == 200) {
      final obj = jsonDecode(res.body);
      return obj.toString();

    } else {
      throw "Unable to retrieve stock data from IEX cloud.";
    }
  }
}

// class IEXCloudServiceAnalysts {
//   final String stockURL =
//       "https://sandbox.iexapis.com/stable/time-series/CORE_ESTIMATES/TSLA?token=Tpk_85b3b5cdb32147d3a0fb751cc5176cdd";
//
//   Future<List<Analysts>> getData() async {
//     Response res = await get(Uri.parse(stockURL));
//
//     if (res.statusCode == 200) {
//       final obj = jsonDecode(res.body);
//
//       List<Analysts> analysts =  new List<Analysts>();
//       Analysts analysis = new Analysts(
//         analystCount: obj['analystCount'],
//         consensusDate: obj['2021-06-02'],
//         marketConsensus: obj['marketConsensus'],
//         marketConsensusTargetPrice: obj['marketConsensusTargetPrice'],);
//       analysts.add(analysis);
//
//       print(obj['analystCount'].toString());
//       return analysts;
//
//     } else {
//       throw "Unable to retrieve stock data from IEX cloud.";
//     }
//   }
// }

class IEXCloudServiceAnalysts {

  Future<List<Analysts>> getData() async{

    var url = Uri.parse("https://sandbox.iexapis.com/stable/time-series/CORE_ESTIMATES/TSLA?token=Tpk_85b3b5cdb32147d3a0fb751cc5176cdd");
    Response res = await get(url);

    return parseAnalysis(res.body);

  }
}

List<Analysts> parseAnalysis(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Analysts>((json) => Analysts.fromJson(json)).toList();
}


// class IEXCloudServiceAnalysts {
//
//   List<Analysts> mydata  = [];
//
//   final String stockURL =
//       "https://sandbox.iexapis.com/stable/time-series/CORE_ESTIMATES/TSLA?token=Tpk_85b3b5cdb32147d3a0fb751cc5176cdd";
//
//   Future<List<Analysts>> getData() async {
//     Response res = await get(Uri.parse(stockURL));
//
//     if (res.statusCode == 200) {
//       final obj = jsonDecode(res.body);
//
//       Analysts analysis = new Analysts(
//         analystCount: obj['analystCount'],
//         consensusDate: obj['consensusDate'],
//         marketConsensus: obj['marketConsensus'],
//         marketConsensusTargetPrice: obj['marketConsensusTargetPrice'],);
//
//       mydata.add(analysis);
//       return mydata;
//
//     } else {
//       throw "Unable to retrieve stock data from IEX cloud Analysts.";
//     }
//   }
// }