import 'dart:ui';
import 'package:flutter_app/Screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/assets/my_flutter_app_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_app/models/stocknewsmodel.dart';
import 'package:flutter_app/Widgets/stock_news_box.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_app/models/stocknews.dart';



class AnalysisScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Stockscreen();
}

class Stockscreen extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TopBar(),
    );
  }
}

class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool _state = true;
  bool _alarm = false;
  List<SalesData> chartData;
  String _selectedCategory = "Test";

  bool _showBackToTopButton = false;
  ScrollController _scrollController;

  //StockChartWidget
  String timespan = "Today";
  TrackballBehavior _trackballBehavior;

  //KeyMetricsWidget
  double _currentprice = 701.89;
  double _min = 329.88;
  double _max = 900.40;

  //NewsWidget
  var newslist;
  bool _loading;

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    newslist = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {

    super.initState();
    //News
    _loading = true;
    getNews();

    //Chart
    _trackballBehavior = TrackballBehavior(
        lineColor: Colors.grey[400],
        enable: true,
        tooltipDisplayMode: TrackballDisplayMode.none,
        activationMode: ActivationMode.singleTap,
        lineWidth: 2,
        lineType: TrackballLineType.horizontal,
        markerSettings: TrackballMarkerSettings(
            color: Colors.white,
            borderColor: Colors.white,
            markerVisibility: TrackballVisibilityMode.visible));
    chartData = getChartData();
    //Scroller
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.linear);
  }

  void _onCategoryButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.black,
            height: 240,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15)),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.analytics,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Analysis",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => _selectCategory('Information'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Information",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => _selectCategory('Information'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Example",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => _selectCategory('Information'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.eco,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Example 2",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => _selectCategory('Information'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _selectCategory(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedCategory = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.white,
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.alarm_add_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() => (_alarm = !_alarm));
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: _state
                  ? Icon(Icons.bookmark_border_rounded)
                  : Icon(Icons.bookmark_rounded),
              onPressed: () {
                setState(() => (_state = !_state));
                ScaffoldMessenger.of(context).showSnackBar(_state
                    ? (const SnackBar(content: Text('removed from watchlist')))
                    : (const SnackBar(content: Text('added to watchlist'))));
              },
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: SafeArea(
          child: ListView(
            controller: _scrollController,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                          ),
                          constraints: BoxConstraints.expand(
                            height: 40.0,
                            width: 40.0,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                'https://storage.googleapis.com/iex/api/logos/TSLA.png',
                              )),
                        ),
                        Padding(padding: EdgeInsets.all(5.0)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ticker',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '23.02.2002',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'StockName',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '3:23AM',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.wb_sunny_rounded, color: Colors.white),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "\$1234.56",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, bottom: 15),
                          child: SizedBox(
                              width: 80,
                              height: 35,
                              child: InkWell(
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.green),
                                    child: Text("+ 5.34%",
                                        style: TextStyle(color: Colors.white))),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              buildChart(context),
              buildTimeChooser(),
              MyDivider2(),
              Padding(padding: EdgeInsets.only(top: 5)),
              buildSocialSpace(),
              buildScroller(),
              buildBox("Key metrics", Icons.vpn_key_rounded, buildKeyMetrics(), false),
              Padding(padding: EdgeInsets.only(top: 10)),
              buildBox("Analysts", Icons.analytics_outlined, buildAnalysis(), false),
              Padding(padding: EdgeInsets.only(top: 10)),
              buildBox("AI-Analysis", Icons.computer_rounded, buildAIAnalysis(), false),
              Padding(padding: EdgeInsets.only(top: 10)),
              buildBox("Sentiment Analysis", Icons.bubble_chart_outlined, buildSentimentAnalysis(), true),
              Padding(padding: EdgeInsets.only(top: 10)),
              buildBox("News", Icons.insert_drive_file_outlined, buildNews(), true),
              Padding(padding: EdgeInsets.only(top: 10)),
              buildBox("Information", Icons.info_outline_rounded, buildInformation(), false),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              elevation: 0.0,
              onPressed: _scrollToTop,
              backgroundColor: Colors.blue.shade300,
              child: const Icon(Icons.keyboard_arrow_up_rounded, size: 40,),),
    );
  }

  //---------------------------WIDGETS----------------------------------

  Widget buildBox(mytoptext, mytopicon, mybox, timechanger) {
  return Container(
    padding:
    EdgeInsets.only(top: 20, bottom: 15),
    decoration: BoxDecoration(
        color: Color(0xff191919),
        borderRadius: BorderRadius.all(Radius.circular(12))),
    child: Column(
      children: [
        ChildBuildBoxCategory(mytoptext, mytopicon, timechanger),
        mybox
      ],
    ),
  );
  }

  Widget MyDivider() {
    return Divider(
      height: 30,
      color: Colors.grey,
    );
  }

  Widget MyDivider2() {
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45,),
      child: Divider(
        height: 30,
        color: Colors.grey,
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

  Widget buildKeyMetrics(){
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChildbuildInformation("Market cap:", "\$707.42 Billion"),
          ChildbuildInformation("Dividend:", "-"),
          ChildbuildInformation("PEG Ratio:", "358,60"),
          MyDivider(),
          ChildbuildKeyMetrics2("1-day:", 200.82, 799.21, 321.23),
          ChildbuildKeyMetrics2("52-week:", _min, _max, _currentprice),
          MyDivider(),
          ChildbuildKeyMetrics("Bid:", "713,27", "Ask:", "703,90"),
          ChildbuildKeyMetrics("Volume:", "4.440.048", "Aver. Vol.:", "22.970.134"),
          MyDivider(),
          ChildbuildKeyMetrics("Float:", "801,74M", "Shares:", "990,01M"),
          ChildbuildKeyMetrics("Short:", "29,91M", "Short Ratio:", "1,41"),
          MyDivider(),
          ChildbuildKeyMetrics3(),
        ],
      ),
    );
  }

  Widget ChildbuildKeyMetrics3 (){
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Intrinsic Value:",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 5,)),
              Text(
                "\$20.11",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.redAccent),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.trending_down, color: Colors.white, size: 14,),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text("Bear",
                          style: TextStyle(color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget buildAIAnalysis(){
    return Container(
      height: 180,
      width: 250,
      child: Container(decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(25))),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SfRadialGauge(

              axes: <RadialAxis>[
                RadialAxis(minimum: 0,maximum: 150,
                    startAngle: 180, endAngle: 360,
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0,endValue: 50,color: Colors.redAccent,startWidth: 40,endWidth: 40),
                      GaugeRange(startValue: 50,endValue: 100,color: Colors.yellowAccent[100],startWidth: 40,endWidth: 40),
                      GaugeRange(startValue: 100,endValue: 150,color: Colors.greenAccent,startWidth: 40,endWidth: 40),],
                    pointers: <GaugePointer>[NeedlePointer(needleColor: Colors.grey, value:29)],
                    // annotations: <GaugeAnnotation>[
                    //   GaugeAnnotation(widget: Container(child:
                    //   Text('BUY',style: TextStyle(fontSize: 50,fontWeight:FontWeight.w500, color: Colors.grey))),
                    //       angle: 90,positionFactor: 0.5)]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSentimentAnalysis(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(padding: EdgeInsets.only(top: 5,)),
        ChildbuildSentimentAnalysis("StonksApp", 22),
        Padding(padding: EdgeInsets.only(top: 20,)),
        ChildbuildSentimentAnalysis("WallStreetBets", 58),
        Padding(padding: EdgeInsets.only(top: 20,)),
        ChildbuildSentimentAnalysis("News", 88),
      ],
    );
  }

  Widget ChildbuildSentimentAnalysis(String text, double sentimentvalue){
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 5,)),
          Container(
            width: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SfLinearGauge(
                  showTicks: false,
                  showLabels: false,
                  useRangeColorForAxis: true,
                  axisTrackStyle: LinearAxisTrackStyle(thickness: 8, color: Colors.grey, edgeStyle: LinearEdgeStyle.bothCurve,
                      gradient: LinearGradient(
                          colors: [Colors.redAccent, Colors.greenAccent],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.1, 0.9],
                          tileMode: TileMode.clamp)),
                  minimum: 0,
                  maximum: 100,
                  markerPointers: [LinearWidgetPointer(value: sentimentvalue, child: Container(
                    height: 15,
                    width: 7.5,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(4.0)),),
                  ))],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "negative",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "positive",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAnalysis(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                  width: 300,
                  child: Text(
                    "The stock is covered by 67 analysts. The average assesment is:",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              Padding(padding: EdgeInsets.only(top: 10,)),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "\$",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Container(height: 10,)
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 5,)),
                  Text(
                      "634.30",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10,)),
              ChildbuildAnalysis2("Highest assesment:", 1200.28),
              ChildbuildAnalysis2("Lowest assesment:", 321.1),
              Padding(padding: EdgeInsets.only(top: 10,),),
            ],
          ),
        ),
        ChildbuildAnalysis(),
      ],
    );
  }

  Widget ChildbuildAnalysis2(String text, double assesment){
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 5,)),
        Column(
          children: [
            Text(
              "\$",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Container(height: 5,)
          ],
        ),
        Padding(padding: EdgeInsets.only(left: 2.5,)),
        Text(
          assesment.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget ChildbuildAnalysis(){
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 110,
            width: 110,
            child: Container(
                child: SfCircularChart(
                    margin: const EdgeInsets.all(0),
                    // legend: Legend(
                    //     isVisible: true,
                    //     position: LegendPosition.right,
                    //     textStyle: TextStyle(
                    //         color: Colors.white, fontWeight: FontWeight.w500)),
                    series: <CircularSeries>[
                      DoughnutSeries<PieChartData, String>(
                          dataSource: getPieData(),
                          pointColorMapper: (PieChartData data, _) => data.color,
                          xValueMapper: (PieChartData data, _) => data.x,
                          yValueMapper: (PieChartData data, _) => data.y)
                    ])),
          ),
          Padding(padding: EdgeInsets.only(left: 5,),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChildChildbuildAnalysisChartLegend("Buy:", "121 Analysts", Colors.greenAccent),
              Padding(padding: EdgeInsets.only(top: 10,),),
              ChildChildbuildAnalysisChartLegend("Sell:", "29 Analysts", Colors.redAccent),
              Padding(padding: EdgeInsets.only(top: 10,),),
              ChildChildbuildAnalysisChartLegend("Hold:", "14 Analysts", Colors.white),
            ],
          )
        ],
      ),
    );
  }

  Widget ChildChildbuildAnalysisChartLegend(String text, String text2, color){
    return Container(
      child: Row(
        children: [
          Icon(Icons.circle, size: 14, color: color,),
          Padding(padding: EdgeInsets.only(left: 5)),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 5)),
          Text(
            text2,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSocialSpace(){
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
      child: Container(
        padding:
        EdgeInsets.all(8.0),
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
                      return Icon(MyFlutterApp.bear,
                        color: isLiked ? Colors.redAccent : Colors.grey,
                        size: 35,
                      );
                    },
                    likeCount: 669,
                    countBuilder: (int count, bool isLiked, String text) {
                      var color = isLiked ? Colors.redAccent : Colors.grey;
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
                    color: isLiked ? Colors.greenAccent : Colors.grey,
                    size: 35,
                  );
                },
                likeCount: 302249,
                countBuilder: (int count, bool isLiked, String text) {
                  var color = isLiked ? Colors.greenAccent : Colors.grey;
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
    );
  }

  Widget buildNews() {

    return _loading ? Center(
      child: Container(
        height: 200,
        child: CircularProgressIndicator(),
      ),
    ) : Container(
      margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return NewsTile(
              imgUrl: newslist[index].urlToImage,
              title: newslist[index].title,
              desc: newslist[index].description,
              content: newslist[index].content,
              posturl: newslist[index].url,
              publishedAt: newslist[index].publishedAt.toString(),
            );
          }),
    );
  }

  Widget buildtopcomments() {
    final myimage = NetworkImage('https://images.unsplash.com/photo-1559548331-'
        'f9cb98001426?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib='
        'rb-1.2.1&auto=format&fit=crop&w=1050&q=80');
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
          Widget>[
        Container(
            padding: EdgeInsets.only(right: 15, left: 15),
            // child: Container(
            //   padding:
            //       EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            //   decoration: BoxDecoration(
            //       color: Colors.grey[900],
            //       borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0)),
                                ),
                                constraints: BoxConstraints.expand(
                                  height: 40,
                                  width: 40,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Ink.image(
                                      image: myimage,
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                      child: InkWell(onTap: () {}),
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                              left: 10,
                            )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text('@elonmusk',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                  top: 2.5,
                                )),
                                Row(
                                  children: [
                                    Container(
                                      child: Text('\$TSLA',
                                          style: TextStyle(
                                            color: Colors.blue.shade300,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 6,
                                    )),
                                    SizedBox(
                                        width: 30,
                                        height: 12.5,
                                        child: InkWell(
                                          child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: Colors.green),
                                              child: Text("Bull",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12))),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                              'Today TSLA +5,42% OMFG TOOOO THE MOOOON. Buy hbuy buy this will be hugeee🚀🚀🚀 Elon posted a Tweet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                height: 1.25,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        Column(
                          children: [
                            const Icon(Icons.keyboard_arrow_up_rounded,
                                color: Colors.grey),
                            const Text('420',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                )),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.comment,
                              color: Colors.grey,
                              size: 18,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text('257 Comments',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        Container(
                          child: Text('2 hours ago',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                  ]),
            ),
      ]),
    );
  }

  Widget buildInformation() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Tesla, Inc. (bis 1. Februar 2017 Tesla Motors) ist ein US-amerikanisches Unternehmen, das Elektroautos sowie Batteriespeicher und Photovoltaikanlagen...",
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          ChildbuildInformation2(),
          MyDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Listed on the NASDAQ",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Container(
                height: 22,
                child: Image.asset('images/nasdaq.png'),
              )
            ],
          ),
          MyDivider(),
          ChildbuildInformation("(Ticker) Name:", "(TSLA) Tesla, Inc."),
          ChildbuildInformation("ISIN:", "US88160R1014"),
          ChildbuildInformation("Industry:", "Automotive industry"),
          ChildbuildInformation("Revenue:", "\$31.5 billion (2020)"),
          ChildbuildInformation("Owner:", "Elon Musk (23.1%)"),
          ChildbuildInformation("Number of employees:", "70,757 (2020)"),
          ChildbuildInformation("Website", "tesla.com"),
        ],
      ),
    );
  }

  Widget ChildbuildInformation2(){
    return Padding(
      padding: const EdgeInsets.only(top: 7.5),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "see more",
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget ChildbuildKeyMetrics(String text1, String text2, String text3, String text4,) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Text(
                  text2,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 7.5)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text3,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Text(
                  text4,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ChildbuildKeyMetrics2(String toptext, min, max, current) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            toptext,
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
        Container(
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                min.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Container(
                width: 175,
                child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.grey,
                    inactiveTrackColor: Colors.grey,
                    trackShape: RectangularSliderTrackShape(),
                    trackHeight: 3.0,
                    thumbColor: max / 2 > current? Colors.redAccent : Colors.greenAccent,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
                    overlayColor: max / 2 > current? Colors.red.withAlpha(32) : Colors.green.withAlpha(32),),
                  child: Slider(
                    value: current,
                    min: min,
                    max: max,
                    label: current.round().toString(),
                    onChanged: (double value) {},
                )),
              ),
              Text(
                max.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget ChildbuildInformation(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildScroller() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Stockinfo",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, left: 10, right: 3, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Scroll to",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _onCategoryButtonPressed();
      },
    );
  }

  Widget ChildBuildBoxCategory(String header, myicon, timechanger) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 20,
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  myicon,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    header,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            timechanger == true? Container(
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                              Text("24h",
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                  )),
            ): Container(),
          ],
        ),
      ),
    );
  }

  Widget buildTimeChooser() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Row(
              children: [
                Icon(Icons.circle, color: timespan == "Live" ? Colors.red : Colors.grey, size: 10,),
                Padding(padding: EdgeInsets.only(left: 5,)),
                Text("Live",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: timespan == "Live"
                            ? Colors.white
                            : Colors.grey)),
              ],
            ),
            onTap: (){
              setState(() {
              timespan = "Live";
            });}
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("1D",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: timespan == "Today"
                              ? Colors.white
                              : Colors.grey)),
                  // SizedBox(
                  //     height: 10.0,
                  //     child: new Center(
                  //         child: new Container(
                  //       height: 5.0,
                  //       color: Colors.red,
                  //     ))),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                timespan = "Today";
              });
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text("1W",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: timespan == "Week" ? Colors.white : Colors.grey)),
            ),
            onTap: () {
              setState(() {
                timespan = "Week";
              });
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text("1M",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: timespan == "Month" ? Colors.white : Colors.grey)),
            ),
            onTap: () {
              setState(() {
                timespan = "Month";
              });
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text("1Y",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: timespan == "Year" ? Colors.white : Colors.grey)),
            ),
            onTap: () {
              setState(() {
                timespan = "Year";
              });
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text("Max",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: timespan == "Max" ? Colors.white : Colors.grey)),
            ),
            onTap: () {
              setState(() {
                timespan = "Max";
              });
            },
          )
        ],
      ),
    );
  }

  Widget buildChart(BuildContext context) {
    return Container(
        child: SfCartesianChart(
            trackballBehavior: _trackballBehavior,
            enableAxisAnimation: true,
            plotAreaBorderWidth: 0,
            primaryXAxis: CategoryAxis(
                labelPlacement: LabelPlacement.onTicks,
                plotOffset: 0,
                edgeLabelPlacement: EdgeLabelPlacement.none,
                isVisible: false,
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0)),
            primaryYAxis: NumericAxis(
                plotBands: <PlotBand>[
                  PlotBand(
                      isVisible: true,
                      dashArray: <double>[3, 8],
                      verticalTextPadding: '5%',
                      horizontalTextPadding: '5%',
                      text: '\$1210.21',
                      textAngle: 0,
                      start: 20,
                      end: 20,
                      horizontalTextAlignment: TextAnchor.start,
                      textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      borderColor: Colors.grey,
                      borderWidth: 1.5)
                ],
                plotOffset: 0,
                edgeLabelPlacement: EdgeLabelPlacement.none,
                isVisible: false,
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0)),
            series: <ChartSeries>[
          // Renders line chart
          LineSeries<SalesData, double>(
            dataSource: chartData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            color: Colors.green,
          )
        ]));
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(1, 4),
      SalesData(2008, 1),
      SalesData(2009, 5),
      SalesData(2010, 12),
      SalesData(2011, 13),
      SalesData(2012, 14),
      SalesData(2013, 15),
      SalesData(2014, 23),
      SalesData(2015, 28),
      SalesData(2016, 25),
      SalesData(2017, 32),
      SalesData(2018, 30)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
