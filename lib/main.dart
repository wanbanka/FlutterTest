import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:english_words/english_words.dart';

//Start the app
void main() => runApp(MyApp());

//Start class, launching RandomsWords' controller

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup name generator',

        //Make theming of the app, thanks to ThemeData
        //@source https://api.flutter.dev/flutter/material/ThemeData-class.html
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.green,
        ),
        home: ButtonAnimation());
  }
}

class ButtonAnimation extends StatefulWidget {
  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController loginButtonController;
  var buttonSqueezeAnimation;
  var buttonZoomOut;

  @override
  void initState() {
    super.initState();

    loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);

    buttonSqueezeAnimation = new Tween(begin: 320.0, end: 70.0).animate(
        new CurvedAnimation(
            curve: new Interval(0.0, 0.250), parent: loginButtonController))
      ..addStatusListener((status) {
        print(status);
      });

    buttonZoomOut = new Tween(begin: 70.0, end: 1000.0).animate(
        new CurvedAnimation(
            parent: loginButtonController,
            curve: new Interval(0.550, 0.900, curve: Curves.bounceOut)));
  }

  @override
  void dispose() {
    loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await loginButtonController.forward();
      await loginButtonController.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Test")),
        body: Padding(
          padding: buttonZoomOut.value == 70
              ? const EdgeInsets.only(bottom: 50.0)
              : const EdgeInsets.only(top: 0.0, bottom: 0.0),
          child: InkWell(
            onTap: () {
              _playAnimation().then((value) => print('OK !'));
            },
            child: Hero(
              tag: "fade",
              child: Container(
                alignment: FractionalOffset.center,
                width: buttonZoomOut.value == 70
                    ? buttonSqueezeAnimation.value
                    : buttonZoomOut.value,
                height: buttonZoomOut.value == 70 ? 60.0 : buttonZoomOut.value,
                decoration: new BoxDecoration(
                    color: const Color.fromRGBO(247, 64, 106, 1.0),
                    borderRadius: buttonZoomOut.value < 400
                        ? new BorderRadius.all(const Radius.circular(30.0))
                        : new BorderRadius.all(const Radius.circular(0.0))),
                child: buttonSqueezeAnimation.value > 75.0
                    ? new Text(
                        "Sign in",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.3),
                      )
                    : buttonZoomOut.value < 300
                        ? new CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : null,
              ),
            ),
          ),
        ));
  }
}

//RandomWords' controller

/*class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

//Logic of RandomWords' controller

class _RandomWordsState extends State<RandomWords> {
  @override
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18.0);

//Build the page of RandomWords

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup name generator'),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: _buildSuggestions(),
    );
  }

//Create ListTiles with pair of words genereated randomly

  Widget _buildSuggestions() {
//Make a group of ListTiles

    return ListView.builder(
      padding: EdgeInsets.all(16.0),

      //Callback in order to generate ListTiles
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return new Divider();
        }

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

//Create a ListTile

  Widget _buildRow(WordPair pair) {
    //Check if a pair exists
    final _alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),

      //If the pair already exists in _saved, there's a red heart
      //on the right of the text
      trailing: Icon(
        _alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: _alreadySaved ? Colors.red : null,
      ),

      //Add or remove a pair when tapping on the ListTile
      onTap: () {
        //Refresh state of the RandomWords' controller
        setState(() {
          if (_alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

//Push to suggestions' route
  void _pushSaved() {
    Navigator.of(context).push(

        //Return a Material page
        MaterialPageRoute<void>(builder: (BuildContext context) {
      //Generate ListTiles with pairs
      final tiles = _saved.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });

      //Adds horizontal spacing between each ListTile
      //and make a list
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Suggestions saved'),
        ),

        //The body is a group of ListTiles
        body: ListView(children: divided),
      );
    }));
  }
}*/
