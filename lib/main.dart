import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(
      new MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new SplashScreen(
          seconds: 5,
          navigateAfterSeconds: new AfterSplash(),
          title: new Text(
            'Welcome In 破竹',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          image: new Image.network(
              'https://flutter.io/images/catalog-widget-placeholder.png'),
          gradientBackground: new LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          onClick: () => print("Flutter Egypt"),
          loaderColor: Colors.red,
        ));
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "wlcome to Flutter",
        theme: ThemeData(primaryColor: Colors.white),
        home: RandomWords(),
        debugShowCheckedModeBanner: false);
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0, fontFamily: 'Schyler');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(title: Text("name Generator")),
      body: _buildSuggestions(),
    );
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
          tooltip: 'Add', child: new Icon(Icons.add), onPressed: () {
        Fluttertoast.showToast(
            msg: "您点击了添加按钮",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIos: 1,
            fontSize: 16.0
        );
      }),
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
        onTap: () {
          Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        },
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
