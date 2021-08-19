import 'package:flutter/material.dart';
import 'package:flutter_app/models/stocknews.dart';
import 'package:like_button/like_button.dart';

class ArticleScreen extends StatefulWidget {
  final Article article;

  const ArticleScreen({Key key, this.article}) : super(key: key);
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
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(widget.article.image),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.article.category,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.article.time,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.article.title,
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
                            widget.article.authorImg,
                            height: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.article.description,
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
                  padding:
                  EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Color(0xff191919),
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.mode_comment_outlined, color: Colors.grey, size: 30,),
                            Padding(padding: EdgeInsets.only(left: 5,)),
                            Text("102", style: TextStyle(
                                color: Colors.grey
                            ),)
                          ],
                        ),
                        MyDivider3(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LikeButton(
                              size: 35,
                              circleColor:
                              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                              bubblesColor: BubblesColor(
                                dotPrimaryColor: Color(0xff33b5e5),
                                dotSecondaryColor: Color(0xff0099cc),
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(Icons.live_help,
                                  color: isLiked ? Colors.red : Colors.grey,
                                  size: 35,
                                );
                              },
                              likeCount: 669,
                              countBuilder: (int count, bool isLiked, String text) {
                                var color = isLiked ? Colors.red : Colors.grey;
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
                          circleColor:
                          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
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
                          countBuilder: (int count, bool isLiked, String text) {
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
              )
            )
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