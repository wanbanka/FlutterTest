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
          child: ListView(
            children: <Widget>[
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
                  )
                ],
              ),
              Card(
                color: Color(0xddffffff),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xfffb3c00),
                      ),
                      title: Text("Dimanche 27 juin 2021, 03:00"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Color(0xfffb3c00),
                      ),
                      title: Text(
                        "HUELGOAT - 29690",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                            child:
                                Icon(Icons.nature, color: Color(0xfffb3c00))),
                        TextSpan(
                            text: "Trail - 80 km",
                            style: TextStyle(color: Colors.black)),
                        WidgetSpan(
                            child: Icon(Icons.speed_outlined,
                                color: Color(0xfffb3c00))),
                        TextSpan(
                            text: "5.3 km/h",
                            style: TextStyle(color: Colors.black)),
                        WidgetSpan(
                            child: Icon(Icons.directions,
                                color: Color(0xfffb3c00))),
                        TextSpan(
                            text: "Parcours chemin",
                            style: TextStyle(color: Colors.black)),
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.people_alt,
                                color: Color(0xfffb3c00))),
                        TextSpan(
                            text: "Activité liée au groupe UTMA 2021",
                            style: TextStyle(color: Colors.black))
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "2 participant(s) dont 2 homme(s) et 0 femme(s)",
                            style: TextStyle(color: Colors.black)),
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Proposée par B. (",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "0",
                            style:
                                TextStyle(backgroundColor: Color(0xff17a2b8))),
                        TextSpan(
                            text: "0",
                            style: TextStyle(
                                backgroundColor: Color(0xffffc107),
                                color: Colors.black)),
                        TextSpan(
                            text: ")", style: TextStyle(color: Colors.black)),
                      ]),
                    ),
                    ListTile(
                      title: Text("Prévoir 15 heures."),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Text("Ultra-trail",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff28a745)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)))),
                        ),
                        TextButton(
                          child: Text("Nature",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff28a745)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)))),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.forum, color: Color(0xfffb3c00)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            color: Colors.white,
                            label: Text("0")),
                        RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.messenger_outline,
                                color: Color(0xfffb3c00)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            color: Colors.white,
                            label: Text("ENVOYER UNE QUESTION")),
                      ],
                    ),
                    Row(
                      children: [
                        RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.add_box, color: Color(0xfffb3c00)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            color: Colors.white,
                            label: Text("S'INSCRIRE")),
                        RaisedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.share, color: Color(0xfffb3c00)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          color: Colors.white,
                          label: Text(""),
                        )
                      ],
                    )
                  ],
                ),
              ),
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
