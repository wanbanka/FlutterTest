import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'login.dart';
import 'home.dart';

//Start the app
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Form Test",
      home: new LoginForm(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [const Locale("fr"), const Locale("en")],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new MaterialPageRoute(
                builder: (_) => new LoginForm(), settings: settings);
            break;

          case '/home':
            return new MaterialPageRoute(
                builder: (_) => new HomePage(), settings: settings);
            break;
        }
      },
    );
  }
}
