import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              title: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(children: <Widget>[
                    Container(
                      height: 45,
                      width: 60,
                      child: BackButton(),
                    ),
                    Container(
                        height: 45,
                        width: 300,
                        child: TextField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                hintText: 'Search',
                                prefix: Icon(Icons.search,
                                    color: Colors.grey[400], size: 20),
                                fillColor: Colors.grey[900],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16)))))),
                  ])),
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey[400],
                tabs: [
                  Tab(icon: Text('All')),
                  Tab(icon: Text('Recent')),
                  Tab(icon: Text('Popular')),
                  Tab(icon: Text('Cryptos')),
                ],
              ),
            ),
            body: Container(
              color: Colors.black,
              child: TabBarView(
                children: choices.map((Choice choice) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ChoicePage(
                      choice: choice,
                    ),
                  );
                }).toList(),
              ),
            )),
      ),
    );
  }

  Widget BackButton() {
    return Container(
        margin: EdgeInsets.only(right: 15),
        child: Material(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey[900],
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                margin: EdgeInsets.all(12),
                height: 40,
                width: 40,
                child: Image.asset('images/arrow.png'),
              ),
              onTap: () {},
            )));
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'CAR', icon: Icons.directions_car),
  Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  Choice(title: 'BUS', icon: Icons.directions_bus),
  Choice(title: 'BUS', icon: Icons.directions_bus),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.grey[900],
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 150.0,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
