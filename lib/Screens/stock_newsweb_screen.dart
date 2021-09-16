import 'dart:async';
import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String postUrl;
  ArticleView({@required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "STONKS",
              style:
              TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.w900),
            ),
            Text(
              "APP",
              style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.w900),
            )
          ],
        ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.bookmark_outline_rounded,))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WebView(
              initialUrl: widget.postUrl,
              onWebViewCreated: (WebViewController webViewController){
                _controller.complete(webViewController);
              },
            ),
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