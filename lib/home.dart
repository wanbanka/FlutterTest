import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import './Components/Utilities/Colors.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://www.omdbapi.com/?i=tt3896198&apikey=91cf00f8';
  Map<String, dynamic> film;
  bool dataOk = false;

  @override
  void initState() {
    super.initState();
    recupFilm();
  }

  Future<void> recupFilm() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      film = convert.jsonDecode(response.body);

      setState(() {
        dataOk = !dataOk;
      });
    }
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
      ),
      body: dataOk ? affichage() : attente(),
      backgroundColor: Colors.blueGrey[900],
      // ignore: missing_required_param
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), backgroundColor: colorRed),
    );
  }

  Widget attente() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "En attente de données",
            style: TextStyle(
                color: colorWhite, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget affichage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          film != null
              ? Text(
                  "${film['Title']}",
                  style: TextStyle(
                      color: colorWhite,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                )
              : Text("Aucune donnée"),
          film != null
              ? Text("${film['Year']}", style: TextStyle(color: colorWhite))
              : Text("Aucune donnée"),
          Padding(padding: const EdgeInsets.all(20.0)),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: colorBlack,
                  offset: Offset(0.0, 7.0),
                  spreadRadius: 3.0,
                  blurRadius: 15.0)
            ]),
            child: film != null
                ? Image.network("${film['Poster']}")
                : Text("Aucune donnée"),
          ),
          Padding(padding: const EdgeInsets.all(20.0)),
          film != null
              ? Text(
                  "${film['Plot']}",
                  style: TextStyle(color: colorWhite),
                  textAlign: TextAlign.center,
                )
              : Text("Aucune donnée")
        ],
      ),
    );
  }
}
