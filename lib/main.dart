import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_app/demo/afterSplash.dart';

void main() => runApp(
      new MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new SplashScreen(
          seconds: 3,
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