import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchlistButton extends StatefulWidget {
  const WatchlistButton({Key key})
      : super(key: key);

  @override
  _WatchlistButtonState createState() => _WatchlistButtonState();
}

class _WatchlistButtonState extends State<WatchlistButton> {
  bool _state = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _state
          ? Image.asset(
        "images/bookmark_white.png",
        height: 25,
        width: 25,
      )
          : Image.asset(
        "images/bookmark_white_green.png",
        height: 25,
        width: 25,
      ),
      tooltip: 'Show Snackbar',
      onPressed: () {
        setState(() => (_state = !_state));
        ScaffoldMessenger.of(context).showSnackBar(_state
            ? (const SnackBar(
            content: Text('removed from watchlist')))
            : (const SnackBar(
            content: Text('added to watchlist'))));
      },
    );
  }
}
