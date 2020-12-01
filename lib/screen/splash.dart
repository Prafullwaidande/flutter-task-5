import 'package:firechat/screen/index.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Mysplash extends StatefulWidget {
  @override
  _MysplashState createState() => _MysplashState();
}

class _MysplashState extends State<Mysplash> {
  @override
  Widget build(BuildContext context) {
   return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text(
        'Fire Chat',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
      ),
      image: new Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.white,
      photoSize: 100.0,
      loaderColor: Colors.red,
    );
  }
}
class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyIndex();
  }
  }
