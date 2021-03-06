import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/services/storage_services.dart';
import 'package:instagram_clone/services/user_service.dart';

class EditProfile extends StatefulWidget {
  final User user;
  EditProfile({this.user});
  


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  
  //  TextEditingController _controller;
   final _formkey = GlobalKey<FormState>();

// @override
// void initState() { 
//   super.initState();
//   _controller = new TextEditingController();

// }
    String _fname="",_lname="",_bio="",_profileImgURL="";
  
    File _imgFile;

   _pickImageFile()
  async{
   File _pickedimgFile = await ImagePicker.pickImage(source:ImageSource.gallery);
    if(_pickedimgFile!=null)
    {
      setState(() {
        _imgFile = _pickedimgFile;
      });
    }
  }
   _profileImage()
{
  if(_imgFile==null)
  {
return widget.user.profileImgURL.isEmpty?AssetImage('assets/images/profile.png'):CachedNetworkImageProvider(widget.user.profileImgURL);
  }
  else{
    return FileImage(_imgFile);
  }
}
    _submit()
  async{
    if(_formkey.currentState.validate())
    {
      _formkey.currentState.save();
      // print(_fname);
      // print('$_lname $_bio ');
      if(_imgFile==null)
      {
         _profileImgURL=widget.user.profileImgURL;
        
      }
      else{

_profileImgURL = await StorageSevice.uploadProfileImg(widget.user.profileImgURL,_imgFile);



      }
    User user = new User(
id:widget.user.id,
fname: _fname,
lname: _lname,
bio: _bio,
profileImgURL: _profileImgURL
      
    );

    // print('{$user.fname} {$user.lname} {$user.bio} {$user.id} ');
    UserService.updateUser(user);
   
 Navigator.pop(context);

  }
  }



    @override
    void initState() { 
      super.initState();
      
        
      
     
      _fname = widget.user.fname;
      _lname = widget.user.lname;
      _bio = widget.user.bio;
    }
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
    debugShowCheckedModeBanner: false,
       home:Scaffold(
         appBar: AppBar(
           leading: IconButton(
             onPressed: ()=>
             {
              Navigator.of(context).pop()

             },
             icon: Icon(Icons.arrow_back),),
        title: Text("Instagram",style: TextStyle(fontFamily: 'Billabong',fontSize: 30.0),),
        centerTitle: true,
      ),
         body: ListView(
           children: <Widget>[
             InkWell(
               onTap: _pickImageFile,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Container(
                     width: 80.0,
                     height: 80.0,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50.0),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withOpacity(.1),
                           blurRadius: 10.0
                         )
                       ]
                     ),
                     child: CircleAvatar(
                      
                 radius:50.0,
                 backgroundColor: Colors.grey,
                 backgroundImage: _profileImage(),
                 
               ),
                   ),
               Text("Edit Profile Picture",style: TextStyle(color: Colors.blue,fontSize: 18.0),),
                 ],
               ),
             ),
             
             Form(
               key: _formkey,
               child:   Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(

        width:MediaQuery.of(context).size.width/1,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.only(left:20.0),
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
     controller: null,
initialValue: _fname,
            
              validator: (input)=> input.trim().isEmpty
    ?'Please Enter First Name!'
    :null,
    onSaved: (input)=>_fname=input,
     decoration: new InputDecoration(
         filled: true,
         errorStyle: TextStyle(
          
          color: Colors.white,
          
        ),
        
          hintText: "First Name",
         hintStyle:TextStyle(color: Colors.grey),
          // hoverColor: Colors.black,
        //  fillColor: Colors.white.withOpacity(1),
         border:InputBorder.none,
        //  focusColor:Colors.white, 
         
     ),
        ),
      ),
      Container(

        width:MediaQuery.of(context).size.width/1,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.only(left:20.0),
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
     controller: null,
initialValue: _lname,
            
              validator: (input)=> input.trim().isEmpty
    ?'Please Enter Last Name!'
    :null,
    onSaved: (input)=>_lname=input,
     decoration: new InputDecoration(
         filled: true,
         errorStyle: TextStyle(
          
          color: Colors.white,
          
        ),
        
          hintText: "Last Name",
         hintStyle:TextStyle(color: Colors.grey),
          // hoverColor: Colors.black,
        //  fillColor: Colors.white.withOpacity(1),
         border:InputBorder.none,
        //  focusColor:Colors.white, 
         
     ),
        ),
      ),
      Container(
        
        width:MediaQuery.of(context).size.width/1,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.only(left:20.0),
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: new TextFormField(
initialValue: _bio,

    maxLines: 3,
    maxLength: 45,
    keyboardType: TextInputType.multiline,
    controller: null,

              
    //             validator: (input)=> input.trim().isEmpty
    // ?'Please Enter Something About You!'
    // :null,
    onSaved: (input)=>_bio=input,
     decoration: new InputDecoration(
      //  contentPadding: EdgeInsets.all(60.0),
           filled: true,
           errorStyle: TextStyle(
            
            color: Colors.white,
            
          ),
          
            hintText: "Bio",
           hintStyle:TextStyle(color: Colors.grey),
           
            // hoverColor: Colors.black,
          //  fillColor: Colors.white.withOpacity(1),
           border:InputBorder.none,
          //  focusColor:Colors.white, 
           
     ),
),
      ) ,
      Container(
           width:MediaQuery.of(context).size.width/1,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
     
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child:FlatButton(
          textColor: Colors.white,
          // color: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 100.0),
        // splashColor: Colors.blue,
       
          onPressed: _submit,
                    child: Text("Update Profile",style: TextStyle(color: Colors.white,fontSize: 18.0),),
                  )
                ),
                  
                
              ],
          
            ),
             )
           ],
         ),

       ),
    );
  }
}