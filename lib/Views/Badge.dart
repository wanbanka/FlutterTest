import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show App, Colors, StateMVC;
import 'package:eventify/eventify.dart' as Event
    show EventCallback, EventEmitter, Listener, Event;
import '../Controllers/Controller.dart';

class BadgeClick extends StatefulWidget {
  final dynamic objetManip;

  BadgeClick({this.objetManip, Key key}) : super(key: key);

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
//Callback computing according to the given event

          Event.EventCallback cb = (ev, cont) {
            if (null != ev) {
              switch (ev.eventName) {
                case "add":
                  con.incrementCounter();
                  print(con.counter);
                  break;
              }
            }
          };

//Create a new EventEmitter

          Event.EventEmitter emitter = new Event.EventEmitter();

          Event.Listener listener = emitter.on("add", this, cb);
          //Emits the result of the event, with sending information or not

          emitter.emit("add", "keyboard", 1);

          listener.callback(Event.Event("add"), widget.objetManip);
        },
        color: Colors.green,
      ),
    );
  }
}
