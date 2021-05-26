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
            duration: Duration(seconds: 1),
            content: Text('Removed from your watchlist')))
            : (const SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Added to your watchlist'))));
      },
    );
  }
}
