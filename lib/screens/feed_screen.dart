import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String userid;
   getUserId()
  async{
      SharedPreferences prefs =  await SharedPreferences.getInstance();
          userid = prefs.getString('userId');
  }
  @override
  void initState() { 
    super.initState();
    print(userid);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        title: Text("Instagram",style: TextStyle(fontFamily: 'Billabong',fontSize: 30.0),),
        centerTitle: true,
      ),
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