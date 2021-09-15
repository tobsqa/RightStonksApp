import 'package:flutter/material.dart';
import 'package:flutter_app/models/stocknewsmodel.dart';
import 'package:flutter_app/Screens/stock_news_screen.dart';
import 'package:flutter_app/Screens/stock_newsweb_screen.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, author, publishedAt;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.publishedAt,
      this.content,
      this.author,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleScreen(
              // postUrl: posturl,
                  imgUrl: imgUrl,
                  author: author,
                  publishedAt: publishedAt,
                  content: content,
                  desc: desc,
                  title: title,
                  posturl: posturl,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12.5, right: 12.5),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 7.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[900],
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          imgUrl ?? "N/A",
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 180,
                            child: Text(
                              posturl ?? "N/A",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            publishedAt.substring(0, 10) ?? "N/A",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        title ?? "N/A",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          desc ?? "N/A",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
