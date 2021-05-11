import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({Key key, @required this.dividerText})
      : super(key: key);
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 15),
              child: Divider(color: Colors.grey[400]),
            )),
        Text(dividerText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            )),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 15),
              child: Divider(color: Colors.grey[400]),
            )),
      ],
    );
  }
}