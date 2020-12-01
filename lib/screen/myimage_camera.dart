import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MyImage extends StatefulWidget {
  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {

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
var fbstorage = FirebaseStorage.instance.ref().child("myimage").child("my.jpg");
print(fbstorage);
fbstorage.putFile(imagefilepath);
 imgurl = await fbstorage.getDownloadURL();
print(imgurl);
 
setState(() {
  furl = imgurl;
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: clickedphoto,
      ),
    appBar: AppBar(title: Text("My Images"),
    actions: <Widget>[
      CircleAvatar(
        backgroundImage: furl == null ? NetworkImage('https://firebasestorage.googleapis.com/v0/b/firechat-ee258.appspot.com/o/myimage%2Fmy.jpg?alt=media&token=4d0519c1-e535-45aa-9fab-0b851a88373d') : NetworkImage(furl),
      ),
    ],
    ),
    body: Center(
      child: Container(
        width: 290,
        height: 350,
        color: Colors.amberAccent,
        child:  imagefilepath == null
        ?Text('select ur Image')
        :Image.file(imagefilepath),


      ),
    ),
    );
  }
}