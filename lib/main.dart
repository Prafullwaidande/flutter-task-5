
import 'package:firebase_app/screen/chat.dart';
import 'package:firebase_app/screen/home.dart';
import 'package:firebase_app/screen/login.dart';
import 'package:firebase_app/screen/reg.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyHome(),
    theme: ThemeData.dark(),
    initialRoute: "home",
    routes: {
      "home": (context) => MyHome(),
      "reg": (context) => MyReg(),
      "log": (context) => MyLog(),
      "chat": (context) => MyChat(),
    },
  ),
  );
}




















/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
var fsconnect = FirebaseFirestore.instance;

  myget() async {
  var d = await fsconnect.collection("students").get();
  //print(d.docs[0].data());
   for (var i in d.docs) {
     print(i.data());
   }
   }

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firestore Firebase App'),
         ),
         body: Column(
           children: <Widget>[
             RaisedButton(
                  child: Text('Send Data'),
             onPressed: (){
               fsconnect.collection("students").add({
                 'name': 'sam',
                 'title': 'youtube',
                 'email': 'sam@sa.com',
               });
               print('send data');
             },
             ),
             RaisedButton(
                  child: Text('Get Data'),
             onPressed: (){
               myget();
               print("geting data");
               },
             )
           ],
         ),
         ));
  }
}

*/