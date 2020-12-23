import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import './Components/Utilities/Colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show base64, json, ascii;

class HomePage extends StatefulWidget {
  final String jwt;
  final Map<String, dynamic> payload;

  HomePage({Key key, this.jwt, this.payload}) : super(key: key);

  //Create another HomePage's object, after processing payload

  factory HomePage.fromBase64(String jwt) => HomePage(
        jwt: jwt,
        payload: json.decode(
            ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))),
      );

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //IP Adress of Node Server
  final SERVER_IP = "http://192.168.1.12:3000";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        body: Center(
          //Build a Widget according to the future value
          child: FutureBuilder(
            future: http.read("$SERVER_IP/data",
                headers: {"Authorization": widget.jwt}),
            builder: (context, snapshot) {
              //Check if there's a data on the snapshot of the future
              return snapshot.hasData
                  ? Column(
                      children: <Widget>[
                        Text(
                            "${widget.payload['username']}, here's the data : "),
                        Text(
                          snapshot.data,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    )
                  : snapshot.hasError
                      ? Text("An error occurred")
                      : CircularProgressIndicator();
            },
          ),
        ));
  }
}
