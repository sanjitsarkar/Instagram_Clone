import 'package:cloud_firestore/cloud_firestore.dart';

class User
{
  final String id;
  final String fname;
  final String lname;
  final String username;
  final String profileImgURL;
  final String email;
  final String bio;
  User({
this.id,this.fname,this.lname,this.username,this.profileImgURL,this.email,this.bio
  });
factory User.fromDoc(DocumentSnapshot doc)
{
  return User(
    id:doc.documentID,
    fname: doc['fname'],
    lname: doc['lname'],
    username: doc['username'],
    profileImgURL: doc['profileImgURL']??'assets/images/profile.png',
    email: doc['email'],
    bio:doc['bio'] ?? ''

  );
}

}