import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  
var authc = FirebaseAuth.instance;

   String email;
  bool sspin = false;
  String password;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Login Page'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: sspin,
        child: Center(
          child: Container(
            width:300,
            child:Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                    email = value;

                  },
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
SizedBox(height: 20,),

                TextField(
                  obscureText: true,
                  onChanged: (value){
                     password = value;
                  },
                  decoration: InputDecoration(hintText: "Enter Your Password",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                ),
                  ),
                ),
SizedBox(height: 20,),
         
             RaisedButton(onPressed: () async{
               setState(() {
                 sspin = false;
               });
               print(email);
               print(password);
               var signIn = await authc.signInWithEmailAndPassword(email: email, password: password);
               print(signIn);
               if (signIn != null){
                 Navigator.pushNamed(context, "chatpage");
                         setState(() {
                      sspin = false;
                    });
               }

              },
              child: Text('Login'),
              ),
              ]
            )
          ),),
      ),
    );
  }
}