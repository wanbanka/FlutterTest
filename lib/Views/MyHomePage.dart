import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show App, Colors, StateMVC;
import '../Controllers/Controller.dart';
import 'Badge.dart';

import 'package:eventify/eventify.dart';

import '../Models/EventHandler.dart';

//Page d'accueil

class MyHomePage extends StatefulWidget {
  final String title = 'Flutter Demo Home Page';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends StateMVC<MyHomePage> {
//Instanciation d'un controlleur permettant de récupérer logique et variables

  _MyHomePageState() : super(Controller()) {
    con = controller;
  }

//Controlleur à utiliser pour la page d'accueil

  Controller con;

  increment() {
//Appel de la fonction incrementCounter du controlleur
    setState(con.incrementCounter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title),
            Text(
              //Appel de la variable counter du controlleur
              '${con.counter}',
            ),
            Divider(
              color: Colors.black,
            ),
            BadgeClick(
              onPressed: () {
                EventHandler eventHandler = EventHandler(increment);

                eventHandler.initSystem();

                eventHandler.listener.callback(Event("add"), this);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
