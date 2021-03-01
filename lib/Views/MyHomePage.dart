import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show StateMVC;
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

  //Index de l'étape du stepper

  int _index = 0;

  //Permet d'incrémenter l'index (pour passer à l'étape suivante)

  void _incrementStepper() {
    setState(() {
      if (_index < 3) {
        _index++;
      }
    });
  }

//Permet de décrémenter l'index (pour passer à l'étape précédente)

  void _decrementStepper() {
    setState(() {
      if (_index > 0) {
        _index--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//Liste des différentes étapes à suivre

    List<Step> steps = [
      Step(
          title: Text("Palier 1"), //Titre de l'étape
          isActive: _index ==
              0, //Etape active ou non (coloration d'une icône en bleu)
          state: _index > 0
              ? StepState.complete
              : StepState
                  .indexed, //Icône à afficher si l'étape est remplie ou non par l'utilisateur
          content: Text("Ceci est le contenu du Stepper 1")),
      Step(
          title: Text("Palier 2"),
          isActive: _index == 1,
          state: _index > 1 ? StepState.complete : StepState.indexed,
          content: Text("Ceci est le contenu du Stepper 2")),
      Step(
          title: Text("Palier 3"),
          isActive: _index == 2,
          state: _index > 2 ? StepState.complete : StepState.indexed,
          content: Text("Ceci est le contenu du Stepper 3")),
      Step(
          title: Text("Palier 4"),
          isActive: _index == 3,
          state: _index > 3 ? StepState.complete : StepState.indexed,
          content: Text("Ceci est le contenu du Stepper 4"))
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stepper(
          physics: ScrollPhysics(),
          steps: steps, //Etapes du Stepper
          currentStep: _index, //Etape actuelle à afficher
          onStepContinue:
              _incrementStepper, //Appelle la fonction pour afficher l'étape suivante
          onStepCancel:
              _decrementStepper, //Appelle la fonction pour afficher l'étape précédente
          type: StepperType.horizontal, //Stepper vertical ou horizontal
        ));
  }
}
