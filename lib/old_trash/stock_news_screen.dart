import 'package:flutter/material.dart';
import 'package:flutter_app/models/stocknewsmodel.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_app/models/stocknews.dart';

class ArticleScreen extends StatefulWidget {
  final String imgUrl, title, desc, content, posturl, author, publishedAt;

  ArticleScreen(
      {this.imgUrl,
      this.desc,
      this.author,
      this.title,
      this.publishedAt,
      this.content,
      @required this.posturl});

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          child: Image.network(
                            widget.imgUrl ?? "N/A",
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.web_rounded, color: Colors.blue, size: 12,),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 2.5)),
                              Text(
                                "Go to Website",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.publishedAt.substring(0, 10) ?? "N/A",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.title ?? "N/A",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            widget.imgUrl ?? "N/A",
                            height: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.content ?? "N/A",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 20,
//                      fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.mode_comment_outlined,
                                color: Colors.grey,
                                size: 30,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                left: 5,
                              )),
                              Text(
                                "102",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          MyDivider3(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LikeButton(
                                size: 35,
                                circleColor: CircleColor(
                                    start: Color(0xff00ddff),
                                    end: Color(0xff0099cc)),
                                bubblesColor: BubblesColor(
                                  dotPrimaryColor: Color(0xff33b5e5),
                                  dotSecondaryColor: Color(0xff0099cc),
                                ),
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    Icons.live_help,
                                    color: isLiked ? Colors.red : Colors.grey,
                                    size: 35,
                                  );
                                },
                                likeCount: 669,
                                countBuilder:
                                    (int count, bool isLiked, String text) {
                                  var color =
                                      isLiked ? Colors.red : Colors.grey;
                                  Widget result;
                                  if (count == 0) {
                                    result = Text(
                                      "0",
                                      style: TextStyle(color: color),
                                    );
                                  } else
                                    result = Text(
                                      text,
                                      style: TextStyle(color: color),
                                    );
                                  return result;
                                },
                              ),
                            ],
                          ),
                          MyDivider3(),
                          LikeButton(
                            size: 35,
                            circleColor: CircleColor(
                                start: Color(0xff00ddff),
                                end: Color(0xff0099cc)),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.favorite,
                                color: isLiked ? Colors.green : Colors.grey,
                                size: 35,
                              );
                            },
                            likeCount: 302249,
                            countBuilder:
                                (int count, bool isLiked, String text) {
                              var color = isLiked ? Colors.green : Colors.grey;
                              Widget result;
                              if (count == 0) {
                                result = Text(
                                  "0",
                                  style: TextStyle(color: color),
                                );
                              } else
                                result = Text(
                                  text,
                                  style: TextStyle(color: color),
                                );
                              return result;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget MyDivider3() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: VerticalDivider(
        thickness: 2,
        width: 2,
        color: Colors.grey,
      ),
    );
  }
}
