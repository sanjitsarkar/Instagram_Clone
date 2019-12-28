import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed_screen.dart';

import 'package:instagram_clone/screens/home_screen.dart';

import '../main.dart';

class AuthService
{
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  static void logInUser(BuildContext context,String email,String password)
  async{
    try
    {
AuthResult authResult = await _auth.signInWithEmailAndPassword(
    email: email,
    password: password
  );
 FirebaseUser signedInUser = authResult.user;
 if(signedInUser!=null)
 {
 Navigator.of(context).push(MaterialPageRoute(
   builder: (context)=>MyApp()
 ));
 }
   
 }
    
    catch(e)
    {
      print(e);
    }

  }
  
  static void signUpUser(BuildContext context, String fname, String lname, String email, String user,String password)
  async{
    
try {
  AuthResult authResult = await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password
  );
 FirebaseUser signedInUser = authResult.user;
 if(signedInUser!=null) 
 {
   _firestore.collection('/users').document(signedInUser.uid).setData({
     
     'email':email,
     'fname':fname,
     'lname':lname,
     'profileImgURL':'',
     'username':user,
      'bio':'',
   });
   Navigator.pop(context);
 }
} catch (e) {
  print(e);
}

  }

  static void logout(BuildContext context)
  {
    _auth.signOut();
  }
  
}