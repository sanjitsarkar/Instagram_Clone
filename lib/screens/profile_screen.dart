import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:instagram_clone/models/user_model.dart';

import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  // ProfileScreen({Key key}) : super(key: key);
  final String userId;
  ProfileScreen({this.userId});
  
  

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static final _firestore = Firestore.instance;
static final _userRef = _firestore.collection('users');
  @override
  Widget build(BuildContext context)
  {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
  return Scaffold(
    appBar: AppBar(
        title: Text("Instagram",style: TextStyle(fontFamily: 'Billabong',fontSize: 30.0),),
        centerTitle: true,
      ),
body:FutureBuilder(
  future: 
  _userRef.document(widget.userId).get(),
  builder:(BuildContext context, AsyncSnapshot snapshot)
  {
    if(!snapshot.hasData)
    {
      return Center
      (
child:CircularProgressIndicator()
      );
    }
    User user = User.fromDoc(snapshot.data);
  return ListView(
  
           children: <Widget>[
  
             Container(
  
               decoration: BoxDecoration(
  
                 color: Colors.black87,
  
                 boxShadow: [
  
                   BoxShadow(
  
                     color: Colors.white.withOpacity(.1),
  
                     spreadRadius: 10.0,
  
                     blurRadius: 10.0
  
                   )
  
                 ]
  
               ),
  
               padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
  
               width:screenWidth,
  
               height:screenHeight/4,
  
               child: 
  
               Row(
  
                 
  
                 children: <Widget>[
  
                   Column(
  
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     
  
                     children: <Widget>[
  
                       Stack(
  
                         children: <Widget>[
  
                           Container(
                             width:70.0,
                             height: 70.0,
                             child: CircleAvatar(
  
                       backgroundColor: Colors.grey,
                       backgroundImage: user.profileImgURL.isEmpty?AssetImage('assets/images/profile.png'):CachedNetworkImageProvider(user.profileImgURL),
  
                         ),
                           ) ,
  
                        //  Positioned(
  
                           
  
                        //    bottom: 5,
  
                        //    right: 5,
  
                        //    child: Container(
  
                        //      width: 20.0,
  
                        //    height: 20.0,
  
                       
  
                        //    alignment: Alignment.center,
  
                        //      decoration: BoxDecoration(
  
                        //        borderRadius: BorderRadius.circular(10.0),
  
                        //        color: Colors.blue
  
                        //      ),
  
                        //      child: IconButton(
  
                        //        padding: EdgeInsetsDirectional.only(bottom:25.0,start:0),
  
                        //        onPressed: null,
  
                        //        icon: Icon(Icons.add,size: 20.0,color: Colors.white,),
  
                        //      ),
  
                        //    ),
  
                        //  )
  
                         ],
  
                       ),
  
                    Container(
                      width:screenWidth/2.5,
                      
                                      child:  RichText(
  
                           textAlign: TextAlign.left,
  softWrap: true,
                             
  
        text: TextSpan(
  
          
  
          style: TextStyle(
  
            fontSize: 15.0,
            
  
          ),
  
          children: <TextSpan>[
  
            TextSpan(text: user.fname+" "+user.lname, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
  
        TextSpan(text: '\n'+user.bio,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
  
      ],
  
    ),
  
                      ),
                    )
  
                       
  
                     
  
                     ],
  
                   ),
  
                   Expanded(
  
                     
  
                    child: Column(
  
                      mainAxisAlignment: MainAxisAlignment.center,
  
                 crossAxisAlignment: CrossAxisAlignment.center,
  
  
  
                      children: <Widget>[
  
                        Row(
  
                          mainAxisAlignment: MainAxisAlignment.center,
  
                          children: <Widget>[
  
  
  
                            RichText(
  
                         textAlign: TextAlign.center,
  
                         
  
                           
  
        text: TextSpan(
  
          
  
          style: 
  
          
  
          TextStyle(
  
            fontSize: 15.0,
  
          ),
  
          children: <TextSpan>[
  
            TextSpan(text: "0", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
  
        TextSpan(text: '\nPosts',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
  
      ],
  
    ),
  
                    ),
  
                    SizedBox(width: 10.0,),
  
                       RichText(
  
                         textAlign: TextAlign.center,
  
                           
  
        text: TextSpan(
  
          
  
          style: TextStyle(
  
            fontSize: 15.0,
  
          ),
  
          children: <TextSpan>[
  
            TextSpan(text: "0", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
  
        TextSpan(text: '\nFollowers',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
  
      ],
  
    ),
  
                    ),
  
                    SizedBox(width: 10.0,),
  
                       RichText(
  
                         textAlign: TextAlign.center,
  
                           
  
        text: TextSpan(
  
          
  
          style: TextStyle(
  
            fontSize: 15.0,
  
          ),
  
          children: <TextSpan>[
  
            TextSpan(text: "0", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
  
        TextSpan(text: '\nFollowing',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
  
      ],
  
    ),
  
                    )
  
                          ],
  
                        ),
  
                        SizedBox(height: 20.0,),
  
                        Container(
  
                          width:150.0,
  
                          height: 30.0,
  
                          color: Colors.blue,
  
                          child: FlatButton(
  
                            onPressed: ()=>
                            {
                              
                              Navigator.of(context).push(MaterialPageRoute(
   builder: (context)=>EditProfile(user: user ,)
 ))
                            },
  
                            child: Text("EDIT PROFILE",style: TextStyle(color: Colors.white),),
  
                          ),
  
                        )
  
                      ],
  
                    ),
  
                   )
  
                 ],
  
               ),
  
             )
  
           ],
  
  );
  },
),
       
    );
}
}