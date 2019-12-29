import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({Key key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
appBar: AppBar(
        title: Text("Instagram",style: TextStyle(fontFamily: 'Billabong',fontSize: 30.0),),
        centerTitle: true,
      ),
       body: 
       
       Container(
         width:double.infinity,
         height: double.infinity,
         child: Center(
           child: Text("Create Post Screen"),
         ),
       ), 
       
    );
}
}