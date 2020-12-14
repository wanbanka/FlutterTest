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
          "https://www.corunning.fr//avatar/5f612883e75c1d10ec38f9d6_activite.jpg",
      "inscrit": true,
      "distanciation": false,
      "placesRestantes": 15
    }
  ];

  List<int> listeEntiers = [];

  int get count => listeEntiers.length;

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

    listeEntiers.addAll(List.generate(25, (index) => index));

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
        child: ListView(children: [
          Column(
            children: [
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
            ],
          ),
          RefreshIndicator(
            child: LoadMore(
              isFinish: count >= 1,
              onLoadMore: loadMore,
              child: cards,
              whenEmptyLoad: false,
              delegate: DefaultLoadMoreDelegate(),
              textBuilder: DefaultLoadMoreTextBuilder.english,
            ),
            onRefresh: refresh,
          ),
        ]),
      ),
      // ignore: missing_required_param
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), backgroundColor: colorRed),
    );
  }

  void load() {
    print("load");

    setState(() {
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
}
