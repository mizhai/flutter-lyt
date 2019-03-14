import 'package:flutter/material.dart';
import 'homePage.dart';
import 'pozhuPage.dart';
import 'askPage.dart';
import 'myPage.dart';

class AfterSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<AfterSplash> {
  int _selectedIndex = 0;
  var pagelist;

  void initData() {
    pagelist = [new HomePage(), new PozhuPage(), new AskPage(), new MyPage()];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          new ThemeData(primaryColor: Colors.blue, primarySwatch: Colors.blue),
      home: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new Scaffold(
      body: pagelist[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("首页")),
          new BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text("破竹号")),
          new BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text("问答")),
          new BottomNavigationBarItem(
              icon: Icon(Icons.verified_user), title: Text("我的")),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        iconSize: 25.0,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
