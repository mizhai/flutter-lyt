import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "wlcome to Flutter",
        theme: ThemeData(primaryColor: Colors.white),
        home: RandomWords());
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(title: Text("name Generator")),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    /*
    return RaisedButton(
      onPressed: _launchUrl,
      child: Text("show Flutter homepage"),
    );*/

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("例子"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();
            final index = i ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
          }),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Add', child: new Icon(Icons.add), onPressed: null),
    );
    /*return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });*/
  }

  _launchUrl() async {
    const url = "https://m.pozhu.com";
    await launch(url);
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("例子"),
      ),
      body: ListTile(
          title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      )),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Add', child: new Icon(Icons.add), onPressed: null),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
