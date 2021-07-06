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

  PageController pageController = PageController();

  ValueNotifier<double> notifier = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackgroundColor(
        colors: Colors.accents,
        pageController: pageController,
        pageCount: 4,
        child: PageView(
          controller: pageController,
          onPageChanged: (page) {
            setState(() {
              notifier.value = page.toDouble();
            });
          },
          children: List<Widget>.generate(4, (index) {
            return SlidingPage(
                child: Stack(
                  children: [
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
                page: index,
                notifier: notifier);
          }),
        ),
      ),
      appBar: AppBar(
        title: SlidingIndicator(
          notifier: notifier,
          activeIndicator: Container(
            color: Colors.green,
          ),
          inActiveIndicator: Container(
            color: Colors.yellow,
          ),
          indicatorCount: 4,
          margin: 8,
          sizeIndicator: 20,
        ),
      ),
    );
  }
}
