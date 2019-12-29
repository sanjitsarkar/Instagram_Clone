import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/services/user_service.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller;
  Future<QuerySnapshot> _users;
  _userTile(User user)
  {
return ListTile(
  onTap:()=>Navigator.of(context).push(MaterialPageRoute(
   builder: (context)=>ProfileScreen(userId: user.id ,)
 )) ,
  leading: CircleAvatar(
radius: 20.0,
backgroundImage: user.profileImgURL.isEmpty?AssetImage('assets/images/profile.png')
:CachedNetworkImageProvider(user.profileImgURL),
  ),
  title: Text(user.fname+' '+user.lname),
);
  }
  _clearText()
  {
    WidgetsBinding.instance.addPostFrameCallback((_)=>_controller.clear());
    setState(() {
      _users =null;
    });
  }
  @override
  void initState() { 
    super.initState();
    _controller = TextEditingController();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
appBar: AppBar(
  centerTitle: true,
  
  // backgroundColor: Colors.white,
  title: 
    // width:double.infinity,
    // height: 100.0,

  TextField(
  controller: _controller,
  textAlign: TextAlign.left,
  
  textAlignVertical: TextAlignVertical.center,
  
  decoration: InputDecoration(
    // contentPadding: EdgeInsets.only(bottom: 20.0),
    border: InputBorder.none,
    hintText:'Search...',
   
    // alignLabelWithHint: true,
    hintStyle: TextStyle(
      color: Colors.grey,
      
      
    ),
    filled: true,
    fillColor: Colors.white.withOpacity(.2),
  prefixIcon: Icon(Icons.search),
    suffix: IconButton(onPressed: _clearText, icon: Icon(Icons.clear,color: Colors.white,),),
  


  ),
  onSubmitted: (input)
  {
  if(input.isNotEmpty)
  {
    setState(() {
      _users=UserService.searchUser(input);
      print(input);

    });
  }
  }
    )

   
),
 

       body:_users==null?
        Center(child: Text('Search Something'),)
       :FutureBuilder(
         future: _users,
         builder: (context,snapshot)
         {
           if(!snapshot.hasData)
           {
return Center(
  child: CircularProgressIndicator(),
);
           }
           if(snapshot.data.documents.length ==0)
           {
             return Center(
               child: Text('No Users found.\nPlease try again.'),
             );
           }
           return ListView.builder(
             itemCount: snapshot.data.documents.length,
             itemBuilder: (BuildContext context, int index)
             {
User user = User.fromDoc(snapshot.data.documents[index]);
return _userTile(user);
             }
           );
         }
       )
       
    );
}
}