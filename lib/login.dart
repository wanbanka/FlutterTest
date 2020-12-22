import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show base64, json, ascii;

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final SERVER_IP = "http://192.168.1.167:5000";
  final storage = FlutterSecureStorage();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final key = GlobalKey<FormState>();

  final usernameValidator = MultiValidator([
    RequiredValidator(errorText: "Champ requis"),
    MinLengthValidator(8, errorText: "Plus de 8 caractères")
  ]);

  void displayDialog(BuildContext context, String title, String text) {
    showDialog(
        context: context,
        builder: (context) {
          AlertDialog(
            title: Text(title),
            content: Text(text),
          );
        });
  }

  Future<String> attemptLogIn(String username, String password) async {
    var res = await http.post("$SERVER_IP/login",
        body: {"username": username, "password": password});

    if (res.statusCode == 200) {
      return res.body;
    }

    return null;
  }

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
                    validator: RequiredValidator(errorText: "Chanp requis"),
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: false,
                    enableSuggestions: false,
                  ),
                  FlatButton(child: Text("Log In"), onPressed: () {}),
                  FlatButton(child: Text("Sign Up"), onPressed: () {})
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )));
  }
}
