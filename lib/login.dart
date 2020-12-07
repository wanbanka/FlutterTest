import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  final controller2 = TextEditingController();

  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myController.dispose();
    controller2.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext globalContext = context;

    return Scaffold(
      body: Builder(
        builder: (context) => Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  focusNode: myFocusNode,
                  controller: myController,
                  decoration: InputDecoration(
                      border: InputBorder.none, labelText: "Username"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Champ vide';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Champ vide';
                    }

                    return null;
                  },
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  controller: controller2,
                  decoration: InputDecoration(
                      border: InputBorder.none, labelText: "Password"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        Navigator.pushReplacementNamed(globalContext, "/home");
                      }
                    },
                    child: Text('Se connecter')),
                FloatingActionButton(
                  onPressed: () {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("User: " +
                                myController.text +
                                "\n Password: " +
                                controller2.text),
                          );
                        });
                  },
                  tooltip: "Show me the value",
                  child: Icon(Icons.text_fields),
                ),
                FloatingActionButton(
                  child: Icon(Icons.edit),
                  onPressed: () {
                    myFocusNode.requestFocus();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
