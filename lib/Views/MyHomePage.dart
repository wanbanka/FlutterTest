import 'package:appMVC/Services/CalendarService.dart';
import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show App, Colors, StateMVC;
import '../Controllers/Controller.dart';

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

  CalendarService calendarService = CalendarService();

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
            Padding(
              padding: EdgeInsets.all(16.0),
              child: IconButton(
                  onPressed: () async {
                    await calendarService.addEvent();
                  },
                  icon: Icon(Icons.calendar_today)),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Appel de la fonction incrementCounter du controlleur
          setState(con.incrementCounter);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
