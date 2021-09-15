import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Screens/screens.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final title;
  SettingsScreen({this.title});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool _lights = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: Colors.black,
        child: SafeArea(
            child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15),
                    child: Row(
                      children: [
                        IconButton(icon: const Icon(Icons.arrow_back_rounded),
                          padding: new EdgeInsets.all(0.0),
                          iconSize: 25.0,
                          color: Colors.grey,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20),
                      child: Column(
                        children: <Widget>[
                          MyDivider(),
                          buildBox(),
                        ],
                      )
                  )]
            )));
  }
  Widget buildBox(){
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ChildBuildBoxHeader("Basic settings"),
            Container(
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ChildBuildBoxInternToggleSwich(Icons.nights_stay_outlined, "Darkmode"),
                        MyDivider(),
                        ChildBuildBoxIntern(Icons.security_rounded, "Security & Privacy"),
                        MyDivider(),
                        ChildBuildBoxIntern(Icons.mobile_friendly_rounded, "Appearance & Display"),

                      ]),
                )),
            Padding(padding: EdgeInsets.only(top: 10,)),
            ChildBuildBoxHeader("Support"),
            Container(
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ChildBuildBoxIntern(Icons.bug_report_outlined, "Bug Report"),
                        MyDivider(),
                        ChildBuildBoxIntern(Icons.thumbs_up_down_outlined, "Leave Feedback"),
                        MyDivider(),
                        ChildBuildBoxIntern(Icons.mail_outline_rounded, "Contact Us")

                      ]),
                )),
            Padding(padding: EdgeInsets.only(top: 10,)),
            ChildBuildBoxHeader("Misc"),
            Container(
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ChildBuildBoxIntern(Icons.privacy_tip_outlined, "Privacy Policy"),
                        MyDivider(),
                        ChildBuildBoxIntern(Icons.article_outlined, "Terms and Conditions"),

                      ]),
                )),
            Padding(padding: EdgeInsets.only(top: 10,)),
            ChildBuildBoxHeader("Support the project"),
            Container(
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ChildBuildBoxIntern(Icons.payment_rounded, "Donate"),
                        MyDivider(),
                        ChildBuildBoxIntern(Icons.vpn_key_rounded, "Invitation keys")

                      ]),
                )),
          ],
    );
  }

  Widget ChildBuildBoxHeader(String header){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,),
      child: Text(
        header,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget ChildBuildBoxIntern(icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.grey[200], size: 24,),
            Padding(padding: EdgeInsets.only(left: 10,)),
            Container(
              child: Text(text,
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[200], size: 20,),
          ],
        ),
      ],
    );
  }

  Widget ChildBuildBoxInternToggleSwich(icon, String text) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.grey[200], size: 24,),
              Padding(padding: EdgeInsets.only(left: 10,)),
              Container(
                child: Text(text,
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ],
          ),
          Container(
            height: 20,
            child: Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                value: _lights,
                onChanged: (bool value) { setState(() { _lights = value; }); },
              ),
            ),
          ),
        ],
      ),
      onTap: () { setState(() { _lights = !_lights; }); },
    );
  }

  Widget MyDivider() {
    return Divider(
      height: 20,
      color: Colors.grey,
    );
  }

}