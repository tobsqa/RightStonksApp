import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/models/stocknewsmodel.dart';

class News {

  List<Article> news  = [];

  Future<void> getNews() async{

    var url = Uri.parse("https://newsapi.org/v2/top-headlines?q=tesla&language=en&category=business&apiKey=be561302ff234a908ac60730ef999db6");
    print(url);

    var response = await http.get(url);
    print(response);

    var jsonData = jsonDecode(response.body);
    print(jsonData);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            content: element['content'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
          );
          news.add(article);
          // print(element['author']);
        }
      });
    }
  }
}


// class NewsForCategorie {
//
//   List<Article> news  = [];
//
//   Future<void> getNewsForCategory(String category) async{
//
//     /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
//     String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";
//
//     var response = await http.get(url);
//
//     var jsonData = jsonDecode(response.body);
//
//     if(jsonData['status'] == "ok"){
//       jsonData["articles"].forEach((element){
//
//         if(element['urlToImage'] != null && element['description'] != null){
//           Article article = Article(
//             content: element['title'],
//             author: element['author'],
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             publshedAt: DateTime.parse(element['publishedAt']),
//             content: element["content"],
//             articleUrl: element["url"],
//           );
//           news.add(article);
//         }
//       });
//     }
//   }
// }
