import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Project {
  final String title;
  final String decription;

  Project(this.title, this.decription);
}

class MyPage extends StatefulWidget {
  @override
  State createState() => _myinfo();
}

class _myinfo extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("个人中心"),
        ),
        body: ProjectList(
            projects:
                List.generate(20, (i) => Project("用户id为: $i", "这是描述 $i"))));
  }
}

class ProjectList extends StatelessWidget {
  final List<Project> projects;

  ProjectList({Key key, @required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text("测试标题:" + projects[index].title),
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
  final Project project;

  ProjectDetail({Key key, @required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("标题：" + project.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        width: 300.0,
        height: 400.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(project.decription),
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
