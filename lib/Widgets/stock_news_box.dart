import 'package:flutter/material.dart';
import 'package:flutter_app/models/stocknews.dart';
import 'package:flutter_app/Screens/stock_news_screen.dart';

class ForYouContainer extends StatefulWidget {
  final Article article;

  const ForYouContainer({Key key, this.article}) : super(key: key);
  @override
  _ForYouContainerState createState() => _ForYouContainerState();
}

class _ForYouContainerState extends State<ForYouContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleScreen(
              article: widget.article,
            )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 7.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[900],),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.article.image),
                      ),
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.article.author,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.article.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.article.category,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.article.time,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
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