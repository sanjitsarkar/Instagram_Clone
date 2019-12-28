import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';

import 'create_post_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  // HomeScreen({Key key}) : super(key: key);
 static final String id = 'home_screen';
 final String userId;
HomeScreen({this.userId});
  @override
   
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


PageController _pageController;
@override
void initState() { 
  super.initState();
  _pageController = new PageController();
}

 int _currentTab=0;
// final String username=  Future<FirebaseUser>;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Instagram",style: TextStyle(fontFamily: 'Billabong',fontSize: 30.0),),
        centerTitle: true,
      ),
       body: PageView(
         
         controller: _pageController,
         children: <Widget>[
           FeedScreen(),
           SearchScreen(),
           CreatePostScreen(),
           NotificationScreen(),
           ProfileScreen(userId:widget.userId)
           
           
         ],
         onPageChanged: (int index)
         {
           setState(() {
             _currentTab = index;
           });
         },
         
       ),
       
       bottomNavigationBar:
        Material(
          // color: Colors.white.withOpacity(1),
                  child: BottomNavigationBar(
          
           currentIndex: _currentTab,
           onTap: (int index)
           {
             setState(() {
               _currentTab=index;
             });
             _pageController.animateToPage(index, 
             duration:Duration(milliseconds: 200),
             curve: Curves.easeIn
             );
           },
           backgroundColor: Colors.white.withOpacity(.1),
          
           selectedFontSize: 0.0,
          
           
          //  fixedColor: Colors.black,
           selectedItemColor: Colors.blue,
           unselectedItemColor: Colors.white,
           type: BottomNavigationBarType.fixed,
          //  elevation: 10,
           iconSize: 32.0,
          items: [

            new BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              title:Text(""),
              

            ),
             new BottomNavigationBarItem(
              icon: Icon(Icons.search,),
              title:Text(""),
              

            ),
             new BottomNavigationBarItem(
              icon: Icon(Icons.camera,),
              title:Text(""),
              

            ),
             new BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title:Text(""),
              

            ),
             new BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title:Text(""),
              

            )
          ],
       ),
        ),
    );
  }
}