import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  final controller2 = TextEditingController();

  AnimationController buttonController;

  var buttonZoomOut;

  double paddingTop;

  double paddingLeft;

  @override
  void initState() {
    super.initState();
    buttonController = new AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);

    buttonZoomOut = new Tween(begin: 70.0, end: 1000.0).animate(
        new CurvedAnimation(parent: buttonController, curve: Curves.bounceOut));

    this.initAnimations();
  }

  @override
  void dispose() {
    myController.dispose();
    controller2.dispose();
    buttonController.dispose();
    super.dispose();
  }

  void executeAnimation({animation: AnimationController, interval: Double}) {
    Future.delayed(Duration(milliseconds: interval), () {
      if (animation != null) {
        animation.forward();
      }
    });
  }

  void initAnimations() async {
    this.executeAnimation(animation: buttonController, interval: 300);
  }

  @override
  Widget build(BuildContext context) {
    BuildContext globalContext = context;

    final usernameValidator = MultiValidator([
      RequiredValidator(errorText: "Champ requis"),
      PatternValidator("^.{8,}", errorText: "Plus de 8 caractères")
    ]);

    return Scaffold(
      body: Builder(
        builder: (context) => Center(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background_login.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color(0x88aaaaaa), BlendMode.exclusion))),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xffffffff)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: "Identifiant",
                          icon: Icon(
                            Icons.person,
                            color: Color(0xffffffff),
                          )),
                      validator: usernameValidator,
                      style: TextStyle(color: Color(0xffffffff)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: RequiredValidator(errorText: "Champ requis"),
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                      controller: controller2,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xffffffff)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: "Mot de passe",
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xffffffff),
                          )),
                      style: TextStyle(color: Color(0xffffffff)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            if (buttonController.isCompleted) {
                              Navigator.pushReplacementNamed(
                                  globalContext, "/home");
                            }
                          }
                        },
                        child: buttonZoomOut.value < 100.0
                            ? Text('Se connecter')
                            : buttonZoomOut.value < 500.0
                                ? new CircularProgressIndicator(
                                    value: null,
                                    strokeWidth: 1.0,
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Colors.white),
                                  )
                                : null,
                        style: ButtonStyle(
                            animationDuration: Duration(milliseconds: 3000),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff98c045)),
                            padding: buttonZoomOut.value < 300.0
                                ? MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.only(
                                        left: buttonZoomOut.value - 22,
                                        right: buttonZoomOut.value - 22,
                                        top: buttonZoomOut.value - 54,
                                        bottom: buttonZoomOut.value - 54))
                                : MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.all(1000.0)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffffffff)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                            textStyle:
                                MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20.0)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: TextButton(
                      onPressed: () {
                        print('OK Mot de passe !');
                      },
                      child: Text("J'ai oublié mon mot de passe"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0x00000000)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffffffff)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
