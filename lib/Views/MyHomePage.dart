import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show StateMVC;
import '../Controllers/Controller.dart';
import 'Badge.dart';

import 'package:flutter/cupertino.dart' show CupertinoSwitch;

import '../Models/EventHandler.dart';

//Liste constante de choix de modes de transport

enum RadioChoix { Voiture, Avion, Bateau }

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

  //Valeur initiale du switch

  bool _choixSwitch = false;

  //Bouton radio Avion cochée

  RadioChoix _choixRadio = RadioChoix.Avion;

  //Icône de l'avion affichée dès l'initialisation

  Icon _iconRadio = Icon(Icons.airplanemode_active);

  //Map pour les checkobx

  Map _mapTransport = {
    RadioChoix.Avion: false,
    RadioChoix.Bateau: false,
    RadioChoix.Voiture: false
  };

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
              },
            ),
            Text(
              "Choix de l'utilisateur",
              style: TextStyle(color: Colors.blueGrey, fontSize: 38),
            ),
            Divider(),
            Text(
              "Switch",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoSwitch(
                  value: _choixSwitch, //Valeur du switch
                  activeColor: Colors.green, //Couleur du switch s'il est activé
                  onChanged: (value) {
                    //Affecte le booléen à une variable
                    setState(() {
                      _choixSwitch = value;
                    });
                  },
                ),
                Text(_choixSwitch ? "Pour" : "Contre")
              ],
            ),
            Divider(),
            Text(
              "Radio",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: RadioChoix.Voiture, //Valeur du bouton radio
                  groupValue:
                      _choixRadio, //Bouton radio rattaché à une variable, comme les autres
                  activeColor:
                      Colors.green, //Couleur du bouton radio s'il est activé
                  onChanged: (value) {
                    //Affecte le booléen à une variable
                    setState(() {
                      _choixRadio = value;
                      _iconRadio = Icon(Icons.directions_car);
                    });
                  },
                ),
                Text(
                  "Voiture",
                  style: _choixRadio ==
                          RadioChoix
                              .Voiture //Change la couleur du texte si le bouton radio est activé
                      ? TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)
                      : TextStyle(),
                ),
                Radio(
                  value: RadioChoix.Avion,
                  groupValue: _choixRadio,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _choixRadio = value;
                      _iconRadio = Icon(Icons.airplanemode_active);
                    });
                  },
                ),
                Text(
                  "Avion",
                  style: _choixRadio == RadioChoix.Avion
                      ? TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)
                      : TextStyle(),
                ),
                Radio(
                  value: RadioChoix.Bateau,
                  groupValue: _choixRadio,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _choixRadio = value;
                      _iconRadio = Icon(Icons.directions_boat);
                    });
                  },
                ),
                Text(
                  "Bateau",
                  style: _choixRadio == RadioChoix.Bateau
                      ? TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)
                      : TextStyle(),
                )
              ],
            ),
            _iconRadio,
            Divider(),
            Text(
              "Checkbox",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor:
                      Colors.green, //Couleur du checkbox s'il est activé
                  value: _mapTransport[RadioChoix.Voiture], //Valeur du checkbox
                  onChanged: (value) {
                    //Affecte le booléen à une variable
                    setState(() {
                      _mapTransport[RadioChoix.Voiture] = value;
                    });
                  },
                ),
                Text(
                  "Voiture",
                  style: _mapTransport[RadioChoix
                          .Voiture] //Change la couleur du texte si le checkbox est activé
                      ? TextStyle(color: Colors.green)
                      : TextStyle(),
                ),
                Checkbox(
                  activeColor: Colors.green,
                  value: _mapTransport[RadioChoix.Avion],
                  onChanged: (value) {
                    setState(() {
                      _mapTransport[RadioChoix.Avion] = value;
                    });
                  },
                ),
                Text(
                  "Avion",
                  style: _mapTransport[RadioChoix.Avion]
                      ? TextStyle(color: Colors.green)
                      : TextStyle(),
                ),
                Checkbox(
                  activeColor: Colors.green,
                  value: _mapTransport[RadioChoix.Bateau],
                  onChanged: (value) {
                    setState(() {
                      _mapTransport[RadioChoix.Bateau] = value;
                    });
                  },
                ),
                Text(
                  "Bateau",
                  style: _mapTransport[RadioChoix.Bateau]
                      ? TextStyle(color: Colors.green)
                      : TextStyle(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.directions_car,
                  color: _mapTransport[RadioChoix
                          .Voiture] //Change la couleur de l'icône si la checkbox correspondante est activée
                      ? Colors.green
                      : Colors.grey[300],
                ),
                Icon(
                  Icons.airplanemode_active,
                  color: _mapTransport[RadioChoix.Avion]
                      ? Colors.green
                      : Colors.grey[300],
                ),
                Icon(
                  Icons.directions_boat,
                  color: _mapTransport[RadioChoix.Bateau]
                      ? Colors.green
                      : Colors.grey[300],
                )
              ],
            )
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
