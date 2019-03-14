import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {

  @override
  State createState() => _myinfo();
}

class _myinfo extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text("个人中心"),),
    );
  }
}