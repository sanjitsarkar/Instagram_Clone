import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/login.dart';
import 'package:instagram_clone/screens/sign_up.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId()
  {
    return StreamBuilder<FirebaseUser>(
 
      stream:FirebaseAuth.instance.onAuthStateChanged,
      builder:(BuildContext context,snapshot)
      {
        if(snapshot.hasData)
        {
          return HomeScreen(userId: snapshot.data.uid);
        }
        else{
          return Login();
        }
      }
    
    );
   
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        brightness: Brightness.dark,
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: _getScreenId(),
      routes: {
        Login.id: (context)=>Login(),
        Signup.id: (context)=>Signup(),
        HomeScreen.id:(context)=>HomeScreen()
      },
    );
  }
}

