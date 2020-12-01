import 'package:flutter/material.dart';

class MyIndex extends StatefulWidget {
  @override
  _MyIndexState createState() => _MyIndexState();
}

class _MyIndexState extends State<MyIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("FireChat")
      ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 190,
                  height: 100,
                  child: Text('Registration'),
                  onPressed: (){
                  Navigator.pushNamed(context, "reg");
                },
                ),
              ),
              SizedBox(
                height: 40,
                ),
                Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 190,
                  height: 100,
                  child: Text('Login'),
                  onPressed: (){
                  Navigator.pushNamed(context, "login");
                },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}