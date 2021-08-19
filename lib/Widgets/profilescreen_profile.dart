import 'package:flutter/material.dart';
import 'package:flutter_app/utils/user_preferences.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath = UserPreferences.myUser.imagePath;

  @override
  Widget build(BuildContext context) {
    final color = Theme
        .of(context)
        .colorScheme
        .primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(context, '4.8K', 'Following'),
        Padding(padding: EdgeInsets.all(6.0)),
        Center(
          child: Stack(
            children: [
              buildImage(),
              Positioned(
                bottom: 0,
                right: 4,
                child: buildEditIcon(color),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(6.0)),
        buildButton(context, '50.2K', 'Followers'),
      ],
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

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
                  color: Colors.white),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      );

  Widget buildEditIcon(Color color) =>
      Container(
        color: Color.fromRGBO(33, 33, 33, 0),
        padding: EdgeInsets.all(2),
        child: ClipOval(
            child: Container(
              padding: EdgeInsets.all(6),
              color: Colors.blue.shade300,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            )
        ),
      );
}
