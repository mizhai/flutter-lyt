import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../beans/loupan.dart';

class MyPage extends StatefulWidget {
  @override
  State createState() => _myinfo();
}

class _myinfo extends State<MyPage> {
  List<DataListBean> loupan;
  String showtext = "000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("个人中心"),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text(showtext),
              RaisedButton(
                  child: Text("获取"),
                  onPressed: () {
                    getHttp().then((val) {
                      setState(() {
                        showtext = val['data'][0]['name'].toString();

                      });
                    });
                  }),
            ],
          )),
    );
    return Scaffold(
        appBar: new AppBar(
          title: Text("个人中心"),
        ),
        body: ProjectList(projects: loupan));
  }
}

class ProjectList extends StatelessWidget {
  final List<DataListBean> projects;

  ProjectList({Key key, @required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text("测试标题:" + projects[index].name),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProjectDetail(project: projects[index])));
                },
              ),
              Divider(),
            ],
          );
        });
  }
}

class ProjectDetail extends StatelessWidget {
  final DataListBean project;

  ProjectDetail({Key key, @required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("标题：" + project.name),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        width: 300.0,
        height: 400.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(project.address),
            RaisedButton(
                child: Text("返回"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        color: Colors.green,
      ),
    );
  }
}

Future getHttp() async {
  try {
    Response response = await Dio().get(
        "https://newapi.mizhai.com/SDK/LoupanSaiXuan.html?siteID=1&typeid=0&areaid=0&priceid=0&tagid=0&hide=0&sort=0&keyword=&mapX=0&mapY=0&juli=0&p=1&streetid=0&tj=0");
    print(response);
    return response.data;
//      loupan = json.decode(response.data.toString());
  } catch (e) {
    print(e);
  }
}
