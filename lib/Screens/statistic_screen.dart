import 'package:flutter/foundation.dart';
import 'package:flutter_app/Screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DataProvider/IEX_CLOUD/IEX_Interday.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Stockscreen();
}

class Stockscreen extends State<NewsScreen> {
  bool _state = true;
  double mynumber = 54.0;
  String _buildoption = "Wallstreetbets";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
        leading: Icon(Icons.bar_chart_rounded),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            buildHeader(),
            buildPlatformChooser(),
            buildOptionNav(),
            MyDivider(),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  buildBullOrBear(),
                  buildPlatformActivityGauge(),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: buildTrendingTicker()),
            Container(padding: EdgeInsets.only(top: 10, bottom: 10),
                child: buildMostMentionedBarChart()),
            Container(
              child: buildPieChart()),
          ],
        ),
      ),
    );
  }

  Widget buildBullOrBear() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(' Performance ',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Container(
                        height: 70,
                        width: 100,
                        child: Image.asset(mynumber > 50
                            ? 'images/greenbull.png'
                            : 'images/redbear.png'),
                      ),
                      Text('Today: +5,42%',
                          style: TextStyle(
                            color: Colors.green.shade300,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ]),
              )),
        ]);
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Text(
          'Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildOptionNav(){
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("StonksApp",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
                      color: _buildoption == "StonksApp" ? Colors.white: Colors.grey)),
            ),
            onTap: (){
              setState(() {
                _buildoption = "StonksApp";
              });
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("WallStreetBets",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
              color: _buildoption == "Wallstreetbets" ? Colors.white: Colors.grey)),
            ),
            onTap: (){
              setState(() {
                _buildoption = "Wallstreetbets";
              });
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("Twitter",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
              color: _buildoption == "Twitter" ? Colors.white: Colors.grey)),
            ),
            onTap: (){
              setState(() {
                _buildoption = "Twitter";
              });
            },
          )
        ],
      ),
    );

  }

  Widget buildPlatformChooser() {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.grey[700],
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Text('Social'),
              Text('Market'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  Widget buildTrendingTicker() {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            constraints: BoxConstraints.expand(
                              height: 42.5,
                              width: 42.5,
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  'https://storage.googleapis.com/iex/api/logos/NOK.png',
                                )),
                          ),
                          contentPadding: EdgeInsets.all(5),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2.5),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.insights_rounded,
                                      color: Colors.grey,
                                      size: 14,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 5,
                                    )),
                                    Text("Trending-newcomer-stock:",
                                        style: TextStyle(
                                            color:
                                                Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Gamestop',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text("\$80.7",
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 16)),
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                    left: 10,
                                  )),
                                  Container(
                                      width: 70,
                                      height: 28,
                                      child: Material(
                                          color:
                                              Color.fromRGBO(65, 157, 120, 1),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text('+ 5.72%',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white,
                                                      fontSize: 14))),
                                              onTap: () {}))),
                                ],
                              )
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ))),
                  onTap: () {
                    print('Button pressed');
                  }))),
    );
  }

  Widget buildPlatformActivityGauge() {
    return Container(
      height: 115,
      width: 115,
          child: Container(decoration: BoxDecoration(
              color: Colors.grey[900],
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
                                  GaugeRange(startValue: 0,endValue: 50,color: Colors.red,startWidth: 40,endWidth: 40),
                                  GaugeRange(startValue: 50,endValue: 100,color: Colors.orange,startWidth: 40,endWidth: 40),
                                  GaugeRange(startValue: 100,endValue: 150,color: Colors.green,startWidth: 40,endWidth: 40)],
                                pointers: <GaugePointer>[NeedlePointer(needleColor: Colors.grey, value:29)],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(widget: Container(child:
                                  Text('WSB Activity',style: TextStyle(fontSize: 50,fontWeight:FontWeight.w500, color: Colors.grey))),
                                      angle: 90,positionFactor: 0.5)]
                      ),
              ],
            ),
                    ),
                  ),
          ),
        );
  }

  Widget buildThirdBox(){}

  Widget buildPieChart() {
    return Container(
        height: 200,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.all(Radius.circular(20))),
            child: SfCircularChart(
              legend: Legend(
                  isVisible: true,
                  position: LegendPosition.right,
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              series: <CircularSeries>[
                // Render pie chart
                PieSeries<PieChartData, String>(
                    dataSource: getPieData(),
                    pointColorMapper: (PieChartData data, _) => data.color,
                    xValueMapper: (PieChartData data, _) => data.x,
                    yValueMapper: (PieChartData data, _) => data.y)
              ])),
    );
  }

  Widget buildMostMentionedBarChart(){

    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Most mentioned Stocks today',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                IconButton(
                    icon: Icon(
                      Icons.autorenew_rounded,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      print('Buttonpressed');
                    })
              ],
            ),
            Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 150,
                child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                        majorGridLines: MajorGridLines(width: 0),
                        majorTickLines: MajorTickLines(width: 0)),
                    primaryYAxis: NumericAxis(
                        majorGridLines: MajorGridLines(width: 0),
                        majorTickLines: MajorTickLines(width: 1)),
                    series: <ChartSeries>[
                      ColumnSeries<ChartData, String>(
                          dataSource: getColumnData(),
                          borderRadius: BorderRadius.only(
                            // The top left and bottom right corners radii are changed to make them
                            // as rounded corners.
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          xValueMapper: (ChartData data, _) => data.x,
                          pointColorMapper: (ChartData data, _) => data.color,
                          yValueMapper: (ChartData data, _) => data.y)
                    ]),
              ),
          ],
        ),
      ),
    );
  }

  Widget MyDivider(){
    return Divider(
      height: 30,
      color: Colors.grey,
    );
  }

}

class PieChartData {
  PieChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class ChartData {
  String x;
  double y;
  Color color;
  ChartData(this.x, this.y, this.color);
}

dynamic getColumnData() {
  List<ChartData> columnData = <ChartData>[
    ChartData("BMW", 54, Color.fromRGBO(65, 157, 120, 1)),
    ChartData("AMC", 19, Color.fromRGBO(65, 157, 120, 1)),
    ChartData("VW", 7, Color.fromRGBO(219, 80, 74, 1)),
    ChartData("BB", 5, Color.fromRGBO(65, 157, 120, 1)),
    ChartData("HITI", 3, Color.fromRGBO(219, 80, 74, 1)),
  ];
  return columnData;
}

dynamic getPieData() {
  List<PieChartData> piechartData = [
    PieChartData('positive mentions', 50, Color.fromRGBO(65, 157, 120, 1)),
    PieChartData('negative mentions', 20, Color.fromRGBO(219, 80, 74, 1)),
    PieChartData('neutral', 30, Color.fromRGBO(221, 209, 199, 1)),
  ];
  return piechartData;
}
