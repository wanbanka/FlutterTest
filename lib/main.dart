import 'package:flutter/material.dart';

import 'Views/MyHomePage.dart';

import 'package:mvc_application/view.dart' show AppMVC;

void main() {
  runApp(MyApp());
}

//Classe de démarrage, avec page d'accueil définie

class MyApp extends AppMVC {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
