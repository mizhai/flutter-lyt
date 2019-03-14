import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => _homelist();
}

class _homelist extends State<HomePage> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0, fontFamily: 'Schyler');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("首页"),
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
          tooltip: 'Add',
          child: new Icon(Icons.add),
          onPressed: () {
            Fluttertoast.showToast(
                msg: "您点击了添加按钮",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIos: 1,
                gravity: ToastGravity.CENTER,
                fontSize: 16.0);
          }),
    );
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
  }
}
