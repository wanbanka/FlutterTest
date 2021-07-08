import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
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

  //Controlleur de la pagination

  PageController pageController = PageController();

  //Notifier renvoyant une valeur aux différents listeners
  // (numéro de page)

  ValueNotifier<double> notifier = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Widget gérant la transition fadeIn entre plusieurs slides
      //avec fond coloré

      body: AnimatedBackgroundColor(
        //Liste des couleurs

        colors: Colors.accents,
        pageController: pageController,

        //Nombre de pages du slider
        pageCount: 4,

        //Création d'une liste de pages réalisant un slider

        child: PageView(
          controller: pageController,

          //Fonction réagissant au changement de page

          onPageChanged: (page) {
            setState(() {
              notifier.value = page.toDouble();
            });
          },
          children: List<Widget>.generate(4, (index) {
            //Widget définissant une page de slide

            return SlidingPage(
                child: Stack(
                  children: [
                    //Container d'une SlidingPage

                    SlidingContainer(
                      child: Center(child: Text("Title: $index")),
                      offset: 200,
                    ),
                    SlidingContainer(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text("Description: $index"),
                        ),
                      ),
                      offset: 350,
                    ),
                  ],
                ),

                //Numéro de page

                page: index,

                //Indique le numéro de page à la PageView
                notifier: notifier);
          }),
        ),
      ),
      appBar: AppBar(
        //Widget indiquant où en est l'utilisateur dans le slider

        title: SlidingIndicator(
          //Indique le numéro de page

          notifier: notifier,

          //Page actuelle

          activeIndicator: Container(
            color: Colors.green,
          ),

          //Autres pages

          inActiveIndicator: Container(
            color: Colors.yellow,
          ),

          //Nombre d'indicateurs

          indicatorCount: 4,
          margin: 8,

          //Taille d'un indicateur

          sizeIndicator: 20,
        ),
      ),
    );
  }
}
