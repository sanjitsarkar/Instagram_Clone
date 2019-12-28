import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

       body: Container(
          width:double.infinity,
         height: double.infinity,
         child: Center(
           child: Text("Search Screen"),
         ),
       ), 
       
    );
}
}