import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/profilescreen_upload_animated_fab_menu.dart';
import 'package:flutter_app/models/usertest.dart';
import 'package:flutter_app/utils/user_preferences.dart';
import 'package:flutter_app/Widgets/profilescreen_appbar.dart';
import 'package:flutter_app/Widgets/profilescreen_profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(),
          const SizedBox(height: 20),
          buildName(user),
          const SizedBox(height: 20),
          buildSelection(),
          Divider(color: Colors.grey,),
        ],
      ),
      floatingActionButton: UploadFabMenu(),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildSelection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(icon: Icon(Icons.sort_rounded), onPressed: () {}, color: Colors.blue.shade300,),
        IconButton(icon: Icon(Icons.account_balance_wallet), onPressed: () {}, color: Colors.grey,),
        IconButton(icon: Icon(Icons.source_rounded), onPressed: () {}, color: Colors.grey,),

      ],
    );
  }

}
