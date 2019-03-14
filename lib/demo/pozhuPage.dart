import 'package:flutter/material.dart';

class PozhuPage extends StatefulWidget {
  @override
  State createState() => _pozhuinfo();
}

class _pozhuinfo extends State<PozhuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("破竹号"),
      ),
      body: new Container(
        child: new Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Text("关于破竹的意见和建议请添加破竹小助手微信同手机18837153716咨询",style: new TextStyle(fontSize: 22.0),textAlign: TextAlign.right,),
              alignment: Alignment.topLeft,
              width: 300.0,
              height: 140.0,
              color: Colors.lightBlue,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
            ),
            new Container(
              child: new Text("关于破竹的意见和建议请添加破竹小助手微信同手机18837153716咨询",style: new TextStyle(fontSize: 22.0),textAlign: TextAlign.right,),
              alignment: Alignment.topLeft,
              width: 300.0,
              height: 300.0,
              color: Colors.lightBlue,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
