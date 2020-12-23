import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'login.dart';
import 'home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, ascii, base64;

//Start the app
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //Init FlutterSecureStorage

  final storage = FlutterSecureStorage();

  //Check if there's already a token saved in the local storage

  Future<String> get JwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");

    if (jwt == null) {
      return "";
    }

    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Form Test",
        //Build a Widget according to the future value
        home: FutureBuilder(
          future: JwtOrEmpty,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            if (snapshot.data != "") {
              var str = snapshot.data;
              var jwt = str.split(".");

              //Check if there's three parts composing the token

              if (jwt.length != 3) {
                return LoginForm();
              } else {
                //Retrive the payload (username, expiration date...)

                var payload = json.decode(
                    ascii.decode(base64.decode(base64.normalize(jwt[1]))));

                //Check the expiration date and return required page

                if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
                    .isAfter(DateTime.now())) {
                  return HomePage(
                    jwt: str,
                    payload: payload,
                  );
                } else {
                  return LoginForm();
                }
              }
            } else {
              return LoginForm();
            }
          },
        ));
  }
}
