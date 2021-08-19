import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/Screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DataProvider/IEX_CLOUD/IEX_Interday.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class UploadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UploadPart();
}

class UploadPart extends State<UploadScreen> {
  bool _state = true;
  double mynumber = 54.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
          child: ListView(
            children: <Widget>[
              MyDivider(),
              buildSearchBar(),
              MyDivider(),
              buildChoosedAnalysed(),
              MyDivider(),
              buildBullOrBear(),
            ],
          ),
      ),
    );
  }

  Widget buildChoosedAnalysed(){
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10,),
                child: Icon(Icons.cancel,
                color: Colors.grey,),
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(context, '+ 2.53%', 'Today'),
            Padding(padding: EdgeInsets.all(6.0)),
            Center(
              child: buildChoosedImage(),
            ),
            Padding(padding: EdgeInsets.all(6.0)),
            buildButton(context, '50.2K', 'Followers'),
          ],
        ),
        const SizedBox(height: 20),
        buildChoosedName()
      ],
    );
  }

  Widget buildChoosedName() {
    return Column(
      children: [
        Text(
          'Nokia Corp.',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          'NOK',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Widget buildChoosedImage() {
    final image = NetworkImage('https://storage.googleapis.com/iex/api/logos/NOK.png',);

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 120,
          height: 120,
          child: InkWell(onTap: () {}),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.green),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
      );

  Widget buildSearchBar() {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SizedBox(
            height: 45,
            child: InkWell(
              child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15.0),
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      hintText: 'Choose analyzed',
                      prefixIcon: Icon(Icons.search,
                          color: Colors.grey[400], size: 25),
                      fillColor: Colors.grey[900],
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0, style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                              Radius.circular(16))))),
            )));
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Text(
          'What do you want to post?',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildBullOrBear(){
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 3.0, right: 3.0),
                          height: 40,
                          width: 40,
                          child: Image.asset('images/greenbull.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(7.0),
                          child: Text('Bullcase',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ]),
                )),
            Padding(padding: EdgeInsets.all(10)),
            Container(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 3.0, right: 3.0),
                          height: 40,
                          width: 40,
                          child: Image.asset('images/redbear.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(7.0),
                          child: Text('Bearcase',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ]),
                )),
          ]),
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
              Text('Analysis'),
            ],
            onTap: (index) {},
          ),
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