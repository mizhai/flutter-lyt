import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AskPage extends StatefulWidget {
  @override
  State createState() => _askinfo();
}

class _askinfo extends State<AskPage> with SingleTickerProviderStateMixin {
  var tabview;
  TabController _tabController;
  List tabs = ["国内房产", "海外房产", "金融财经", "其他"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("破竹问答"),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: _doShare),
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      body: TabBarView(controller: _tabController, children: [
        new TabView1(),
        new TabView2(),
        new TabView3(),
        new TabView4(),
      ]),
    );
  }

  void _doShare() {
    Fluttertoast.showToast(
        msg: "你点击了分享按钮",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.deepPurple,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

// 国内房产，海外房产，金融财经，其他，立即提问

class TabView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: 300.0,
        height: 250.0,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(10.0),
        color: Colors.blue,
        child: Text(
          "国内房产",
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}

class TabView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: 300.0,
        height: 250.0,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(10.0),
        color: Colors.red,
        alignment: Alignment.topLeft,
        child: Text(
          "海外房产",
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}

class TabView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: 300.0,
        height: 250.0,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(10.0),
        color: Colors.green,
        alignment: Alignment.center,
        child: Text(
          "金融财经",
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}

class TabView4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: 300.0,
        height: 250.0,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(10.0),
        color: Colors.black,
        alignment: Alignment.centerRight,
        child: Text(
          "其他",
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}
