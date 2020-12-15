import 'dart:async';
import 'package:flutter/material.dart';
import 'Components/CardActivity.dart';
import './Components/Utilities/Colors.dart';
import 'package:loadmore/loadmore.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<dynamic> objetTest = [
    {
      "date": new DateTime(2021, 06, 27, 3),
      "lieu": "HUELGOAT - 29690",
      "type": "Marche",
      "activite": "Trail",
      "distance": 80,
      "vitesse": 5.3,
      "parcours": "Chemin",
      "groupe": "UTMA 2021",
      "participants": 2,
      "organisateur": "Benjamin",
      "coactivites": 0,
      "recommandations": 0,
      "description": "Prévoir 15 heures.",
      "tags": ["Ultra-Trail", "Nature"],
      "image":
          "https://www.corunning.fr/avatar/5f612883e75c1d10ec38f9d6_activite.jpg",
      "inscrit": false,
      "distanciation": false,
      "placesRestantes": 15
    },
    {
      "date": new DateTime(2020, 12, 12, 9),
      "lieu": "FRETERIVE - 73250",
      "type": "Course",
      "activite": "Course à pied",
      "distance": 14,
      "vitesse": 14.0,
      "parcours": "Route",
      "participants": 1,
      "organisateur": "Lucien",
      "coactivites": 0,
      "recommandations": 0,
      "description": "Prévoir 1 heure.",
      "tags": ["Botanique", "Nature", "Yoga"],
      "inscrit": true,
      "distanciation": false,
      "placesRestantes": 15
    },
    {
      "date": new DateTime(2020, 11, 16, 13, 10),
      "lieu": "Toulouse",
      "type": "Marche",
      "activite": "Marche à pied",
      "distance": 10,
      "vitesse": 10.0,
      "parcours": "Route",
      "groupe": "Toulouse st Cyprien",
      "participants": 1,
      "organisateur": "Emma",
      "coactivites": 0,
      "recommandations": 0,
      "description": "Prévoir 1 heure.",
      "tags": ["Balade", "Randonnée", "Echauffement"],
      "inscrit": true,
      "distanciation": false,
      "placesRestantes": 15
    }
  ];

  List<Widget> cards = [];

  int get cardsLen => cards.length;

  listCards() {
    for (int index = 0; index < objetTest.length; index++) {
      cards.add(CardActivity(
        date: objetTest[index]['date'],
        lieu: objetTest[index]['lieu'],
        type: objetTest[index]['type'],
        activite: objetTest[index]['activite'],
        distance: objetTest[index]['distance'],
        vitesse: objetTest[index]['vitesse'],
        parcours: objetTest[index]['parcours'],
        participants: objetTest[index]['participants'],
        organisateur: objetTest[index]['organisateur'],
        coactivites: objetTest[index]['coactivites'],
        recommandations: objetTest[index]['recommandations'],
        description: objetTest[index]['description'],
        tags: objetTest[index]['tags'],
        image: objetTest[index]['image'],
        inscrit: objetTest[index]['inscrit'],
        distanciation: objetTest[index]['distanciation'],
        placesRestantes: objetTest[index]['placesRestantes'],
      ));
    }
  }

  @override
  void initState() {
    super.initState();

    listCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CoRunning",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: null)],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background_home.png'),
                fit: BoxFit.cover)),
        child: RefreshIndicator(
          child: LoadMore(
            isFinish: cardsLen >= 4,
            onLoadMore: loadMore,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int i) {
                return cards[i];
              },
              itemCount: cardsLen,
            ),
            whenEmptyLoad: false,
            delegate: DefaultLoadMoreDelegate(),
            textBuilder: DefaultLoadMoreTextBuilder.english,
          ),
          onRefresh: refresh,
        ),
      ),
      // ignore: missing_required_param
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), backgroundColor: colorRed),
    );
  }

  void load() {
    print("load");

    var newObjet = [
      {
        "date": new DateTime(2020, 11, 16, 13, 10),
        "lieu": "Toulouse",
        "type": "Marche",
        "activite": "Marche à pied",
        "distance": 10,
        "vitesse": 10.0,
        "parcours": "Route",
        "groupe": "Toulouse st Cyprien",
        "participants": 1,
        "organisateur": "Emma",
        "coactivites": 0,
        "recommandations": 0,
        "description": "Prévoir 1 heure.",
        "tags": ["Balade", "Randonnée", "Echauffement"],
        "inscrit": true,
        "distanciation": false,
        "placesRestantes": 15
      },
      {
        "date": new DateTime(2020, 10, 31, 10),
        "lieu": "Morlaix",
        "type": "Velo",
        "activite": "Vélo",
        "distance": 10,
        "vitesse": 4.0,
        "parcours": "Chemin",
        "groupe": "ASHM",
        "participants": 1,
        "organisateur": "Benjamin",
        "coactivites": 3,
        "recommandations": 0,
        "description":
            "Prévoir 2 heures 30 minutes. Octobre Rose organise pour la première fois à Morlaix une Marche Rose",
        "tags": ["Balade"],
        "inscrit": true,
        "distanciation": false,
        "placesRestantes": 15,
        "image":
            "https://www.corunning.fr/avatar/5f91a977d04392097db5c178_activite.jpg"
      }
    ];

    setState(() {
      for (int index = 0; index < newObjet.length; index++) {
        cards.add(CardActivity(
          date: newObjet[index]['date'],
          lieu: newObjet[index]['lieu'],
          type: newObjet[index]['type'],
          activite: newObjet[index]['activite'],
          distance: newObjet[index]['distance'],
          vitesse: newObjet[index]['vitesse'],
          parcours: newObjet[index]['parcours'],
          participants: newObjet[index]['participants'],
          organisateur: newObjet[index]['organisateur'],
          coactivites: newObjet[index]['coactivites'],
          recommandations: newObjet[index]['recommandations'],
          description: newObjet[index]['description'],
          tags: newObjet[index]['tags'],
          image: newObjet[index]['image'],
          inscrit: newObjet[index]['inscrit'],
          distanciation: newObjet[index]['distanciation'],
          placesRestantes: newObjet[index]['placesRestantes'],
        ));
      }
      print("Data count : ${cards.length}");
    });
  }

  Future<bool> loadMore() async {
    print("On loadMore");
    await Future.delayed(Duration(milliseconds: 2000));
    load();
    return true;
  }

  Future<void> refresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    cards.clear();
    load();
  }

  /* Put these buttons on the burger menu

Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton.icon(
                  onPressed: () {
                    print('Raise your hands 2');
                  },
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: const Color(0xffffffff),
                  ),
                  padding: const EdgeInsets.all(17),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: const Color(0xfffb3c00),
                  label: Text(
                    'Propose une activité, Théo',
                    style: TextStyle(color: const Color(0xffffffff)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton.icon(
                  onPressed: () {
                    print('Raise your hands');
                  },
                  icon: Icon(
                    Icons.search,
                    color: const Color(0xffffffff),
                  ),
                  padding: const EdgeInsets.all(17),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: const Color(0xff98c045),
                  label: Text(
                    'Recherche par activité, lieu',
                    style: TextStyle(color: const Color(0xffffffff)),
                  ),
                ),
              ),

  */
}
