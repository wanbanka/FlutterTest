import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  final controller2 = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    controller2.dispose();
    super.dispose();
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
                            Navigator.pushReplacementNamed(
                                globalContext, "/home");
                          }
                        },
                        child: Text('Se connecter'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff98c045)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.only(
                                    left: 48, right: 48, top: 16, bottom: 16)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffffffff)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(fontSize: 20.0)))),
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
