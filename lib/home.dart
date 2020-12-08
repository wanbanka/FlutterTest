import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background_home.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              RaisedButton.icon(
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
              RaisedButton.icon(
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
              )
            ],
          ),
        ),
      ),
      // ignore: missing_required_param
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), backgroundColor: Color(0xfffb3c00)),
    );
  }
}
