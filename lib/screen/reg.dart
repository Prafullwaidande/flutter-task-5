import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyReg extends StatefulWidget {
  
  @override
  MyRegState createState() => MyRegState();
}

class MyRegState extends State<MyReg> {

var authc = FirebaseAuth.instance;
var fs = FirebaseFirestore.instance;

  String email;
  bool sspin = false;
  String password;

File imagefilepath;
var imgurl;
var furl;
clickedphoto() async {
  var picker =  ImagePicker();
  var image =  await picker.getImage(source: ImageSource.camera,
  //maxHeight: 300,
  //maxWidth: 300,
  );
 
  print(imagefilepath);
  print('photo clicked');

  setState(
    (){
   imagefilepath = File(image.path);
    }
  );
var fbstorage = FirebaseStorage.instance.ref().child("myimage").child("my1234.jpg");
print(fbstorage);
fbstorage.putFile(imagefilepath);
imgurl = await fbstorage.getDownloadURL();
print(imgurl);
 
await fs.collection("imgurl").add({
  "profileurl": imgurl == null ? "waiting" : imgurl,
});


setState(() {
  furl = imgurl;
});
}
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder();

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: sspin,
        child: Center(
          child: Container(
            width:300,
            child:Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    radius: 60.0,
                    backgroundImage: furl != null ? NetworkImage(furl): null,
                ),
                RaisedButton(child: Text('click'),onPressed: (){
                   clickedphoto();
                },),
                

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
               var user = await authc.createUserWithEmailAndPassword(email: email, password: password);
               print(user);
               if (user.additionalUserInfo.isNewUser == true){
                 Navigator.pushNamed(context, "chatpage");
                         setState(() {
                      sspin = false;
                    });
               }

              },
              child: Text('Register'),
              ),
              ]
            )
          ),),
      ),
    );
  }
}
