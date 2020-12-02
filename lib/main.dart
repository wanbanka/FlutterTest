import 'package:flutter/material.dart';
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
        home: RandomWords());
  }
}

//RandomWords' controller

class RandomWords extends StatefulWidget {
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
}
