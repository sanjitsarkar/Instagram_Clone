import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
  
  return Scaffold(

       body: Container(
          width:double.infinity,
         height: double.infinity,
         child: Center(
           child: Text("Notification Screen"),
         ),
       ), 
       
    );
}
}