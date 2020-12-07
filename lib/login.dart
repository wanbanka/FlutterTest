import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  void printLastValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  void initState() {
    super.initState();

    myController.addListener(printLastValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (text) {
                    print(text);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none, labelText: "Enter a username"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Entrez du texte';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: myController,
                  decoration: InputDecoration(
                      border: InputBorder.none, labelText: "Password"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('It works !')));
                      }
                    },
                    child: Text('Se connecter'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
