import 'package:cloud_firestore/cloud_firestore.dart';
class dbRef
{
static final _firestore = Firestore.instance;
static final _userRef = _firestore.collection('users');
}