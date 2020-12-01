import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Mychatpage extends StatefulWidget {
  @override
  _MychatpageState createState() => _MychatpageState();
}

class _MychatpageState extends State<Mychatpage> {
var msgtextcontroller = TextEditingController();

  var fs = FirebaseFirestore.instance;
var authc =FirebaseAuth.instance;
 
 
  String chatmsg;
 
  
  @override
  Widget build(BuildContext context) {
    
   var deviceWidth = MediaQuery.of(context).size.width; 
   var signInUser = authc.currentUser.email;
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text('Chat Box'),
         actions: <Widget>[
           CircleAvatar( backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/firechat-ee258.appspot.com/o/myimage%2Fmy1234.jpg?alt=media&token=59667cdd-1fc4-4522-bece-2ddc54b1c119'),),
           IconButton(icon: Icon(Icons.logout), onPressed: () async{
             print(" Sign Off");
             await authc.signOut();
             Navigator.pushNamed(context, "login"); 
           }),
        ],
      ),
      body:
    Container(
      color: Colors.blue[200],
      child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
             StreamBuilder<QuerySnapshot>(builder: (context, snapshot) {
 
               var msg = snapshot.data.docs;
               //print(msg);
                 List<Widget> y = [];

               for (var d in msg){
                 //print(d.data());       
                 var msgText = d.data()['text'];
                 var msgSender = d.data()['sender'];
                 var msgWidget = Text("  $msgText  <<<< \b  ( $msgSender ) ");
                 y.add(msgWidget);
               }
               print(y);
               return Container(
                 
                  width: deviceWidth * 0.50,
                alignment: Alignment.bottomRight,
                 padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical:100),
                 decoration: BoxDecoration(        
                   color: Colors.blue[400],
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: Column(children: y,),
               );
             },           
             stream: fs.collection("chat").snapshots(),
             ),
             
             Row(
               children: [
                 Container(
                   
                   width: deviceWidth * 0.78,
                   child:
                   TextField(
                     
                     controller: msgtextcontroller,
                     decoration: InputDecoration(hintText: 'Type here....', border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)),),
                     onChanged: (value){
                    chatmsg = value;
                   },),
                 ),
                 Container(
                   width: deviceWidth * 0.20,
                   child: FlatButton(
                      color: Colors.green[400],
                    padding: EdgeInsets.all(10.0),
                     child: Row(
                       children: [
                         Text('Send'),
                          Icon(Icons.send),
                       ],
                     ),
                   onPressed: () async {
                     msgtextcontroller.clear();
                    await fs.collection("chat").add({
                      "text": chatmsg,
                      "sender": signInUser,
                    });
                    print(signInUser);
                   },
                   ),
                 ),
               ],
             ),
        ],
        ),
      ),
      
    ));
  }
}