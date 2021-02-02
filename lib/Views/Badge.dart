import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show App, Colors, StateMVC;
import '../Controllers/Controller.dart';

class BadgeClick extends StatefulWidget {
  Function onPressed;

  BadgeClick({this.onPressed, Key key}) : super(key: key);

  @override
  _BadgeClickState createState() => _BadgeClickState();
}

class _BadgeClickState extends StateMVC<BadgeClick> {
  _BadgeClickState() : super(Controller()) {
    con = controller;
  }

  Controller con;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text("Salut"),
        onPressed: () {
          widget.onPressed();
        },
        color: Colors.green,
      ),
    );
  }
}
