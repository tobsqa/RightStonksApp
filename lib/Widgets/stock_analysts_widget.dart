import 'package:flutter/material.dart';
import 'package:flutter_app/models/analysts.dart';
import 'package:flutter_app/Cloudservices/IEX_cloud.dart';
import 'dart:ui';
import 'package:flutter_app/Screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class AnalysisWidget extends StatelessWidget {

  //Cloudservices
  IEXCloudServicePrice iexcloudprice = IEXCloudServicePrice();
  IEXCloudServiceAnalysts iexcloudanalysts = IEXCloudServiceAnalysts();



  @override
  Widget build(BuildContext context) {
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
              Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  )),
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
                      Container(
                        height: 10,
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: 5,
                      )),

                  FutureBuilder<List<Analysts>>(
                      future: iexcloudanalysts.getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data[0]?.marketConsensusTargetPrice ?? 'N/A Null',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        if(snapshot.hasError){
                          return Text(
                            'N/A',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        else {
                          return const Text(
                            "---",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                      }
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  )),
              ChildbuildAnalysis2("Highest assesment:", 1200.28),
              ChildbuildAnalysis2("Lowest assesment:", 321.1),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
              ),
            ],
          ),
        ),
        ChildbuildAnalysis(),
      ],
    );
  }
  Widget ChildbuildAnalysis() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 110,
            width: 110,
            child: Container(
                child: SfCircularChart(margin: const EdgeInsets.all(0),
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
          Padding(
            padding: EdgeInsets.only(
              left: 5,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChildChildbuildAnalysisChartLegend(
                  "Buy:", "121 Analysts", Colors.greenAccent),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
              ),
              ChildChildbuildAnalysisChartLegend(
                  "Sell:", "29 Analysts", Colors.redAccent),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
              ),
              ChildChildbuildAnalysisChartLegend(
                  "Hold:", "14 Analysts", Colors.white),
            ],
          )
        ],
      ),
    );
  }

  Widget ChildChildbuildAnalysisChartLegend(String text, String text2, color) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 14,
            color: color,
          ),
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


  Widget ChildbuildAnalysis2(String text, double assesment) {
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
        Padding(
            padding: EdgeInsets.only(
              left: 5,
            )),
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
            Container(
              height: 5,
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.only(
              left: 2.5,
            )),
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
}


