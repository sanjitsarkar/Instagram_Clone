import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_services.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: Container(
          width:double.infinity,
         height: double.infinity,
         child: Center(
           child: InkWell(
             onTap: ()=>AuthService.logout(context),
             child: Text("Logout")),
         ),
       ), 
       
    );
}
}