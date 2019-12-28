import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';


import '../main.dart';

class UserService
{
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static final _userRef = _firestore.collection('users');
  static void updateUser(User user)
 {
_userRef.document(user.id).updateData(
  {
    'fname':user.fname,
    'lname':user.lname,
    'bio':user.bio

  } 
);
 }

      
 
}