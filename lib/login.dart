import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'home.dart';
import 'dart:convert' show base64, json, ascii;

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //IP Adress of Node Server

  final SERVER_IP = "http://192.168.1.12:3000";

  //Init FlutterSecureStorage

  final storage = FlutterSecureStorage();

  //textEditingControllers

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  //Unique key

  final key = GlobalKey<FormState>();

  //Validators

  final usernameValidator = MultiValidator([
    RequiredValidator(errorText: "Champ requis"),
    MinLengthValidator(4, errorText: "Plus de 4 caractères")
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: "Champ requis"),
    MinLengthValidator(4, errorText: "Plus de 4 caractères")
  ]);

  //Use of an AlertDialog

  void displayDialog(BuildContext context, String title, String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
          );
        });
  }

  //Try to login on Node Server with credentials username/password

  Future<String> attemptLogIn(String username, String password) async {
    var res = await http.post("$SERVER_IP/login",
        body: {"username": username, "password": password});

    if (res.statusCode == 200) {
      return res.body;
    }

    return null;
  }

  //Try to signup on NodeServer with credentials username/password

  Future<int> attemptSignUp(String username, String password) async {
    var res = await http.post("$SERVER_IP/signup",
        body: {"username": username, "password": password});

    return res.statusCode;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Log in"),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background_login.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color(0x88aaaaaa), BlendMode.exclusion))),
            child: Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    validator: usernameValidator,
                    decoration: InputDecoration(labelText: "Username"),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: passwordValidator,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    enableSuggestions: false,
                  ),
                  FlatButton(
                      child: Text("Log In"),
                      onPressed: () async {
                        //If all fields are filled

                        if (key.currentState.validate()) {
                          var username = _usernameController.text;
                          var password = _passwordController.text;

                          //Try to retrieve the token

                          var jwt = await attemptLogIn(username, password);

                          //If the token is not null, save the token in the storage

                          if (jwt != null) {
                            storage.write(key: "jwt", value: jwt);

                            //Go to HomePage, with the token as parameter

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage.fromBase64(jwt);
                            }));
                          } else {
                            displayDialog(context, "An error occurred",
                                "No account matching with this username and password");
                          }
                        } else {
                          return null;
                        }
                      }),
                  FlatButton(
                      child: Text("Sign Up"),
                      onPressed: () async {
                        //If all fields are filled

                        if (key.currentState.validate()) {
                          var username = _usernameController.text;
                          var password = _passwordController.text;

                          //Try to retrieve the response code
                          var res = await attemptSignUp(username, password);

                          if (res == 201) {
                            displayDialog(context, "Success",
                                "The user was created. Log in now");
                          } else if (res == 409) {
                            displayDialog(
                                context,
                                "The username is already registered",
                                "Please try to sign up using another username or log in if you already have an account.");
                          } else {
                            displayDialog(
                                context, "Error", "An error occurred");
                          }
                        } else {
                          return null;
                        }
                      })
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )));
  }
}
