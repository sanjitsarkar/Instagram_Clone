import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login.dart';
import 'package:instagram_clone/services/auth_services.dart';
class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);
  static final String id = 'signup_screen';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
 String _email,_passw,_lname,_fname,_user;
            void _submit() {
              if(_formKey.currentState.validate())
              {
                _formKey.currentState.save();
                print(_formKey);
                print(_fname);
                print(_lname);
                print(_email);
                print(_passw);
                _user = (_fname+'_'+_lname).trim().toLowerCase();
                _user.replaceAll(' ', '');
                AuthService.signUpUser(context, _fname, _lname, _email, _user, _passw);
               
              }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            margin: EdgeInsetsDirectional.only(top:MediaQuery.of(context).size.height/5.5),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
        
              children: <Widget>[
Padding(
  padding: const EdgeInsets.only(top:0.0,bottom: 10.0),
  
  child:   Center(child: Text("Instagram",style: TextStyle(fontFamily:'Billabong',fontSize: 60.0),)),
) ,
Form(
  key: _formKey,
  child: Column(

    children: <Widget>[
         Container(

        width:MediaQuery.of(context).size.width/1,
        // alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsetsDirectional.only(start:20.0),
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
     controller: null,
    validator: (input)=> input.trim().isEmpty
        ?'Please enter First Name'
    :null,
     onSaved: (input)=>_fname=input,
     decoration: new InputDecoration(
         filled: true,
         errorStyle: TextStyle(
          
          color: Colors.white,
          
        ),
          hintText: "First Name",
         hintStyle:TextStyle(color: Colors.grey),
          
        //  fillcolor: Colors.white.withOpacity(.05),
         border:InputBorder.none,
         focusColor:Colors.white, 
         
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
          
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
     controller: null,

             
              validator: (input)=>input.trim().isEmpty
    ?'Please enter Last Name'
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
        // alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsetsDirectional.only(start:20.0),
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
     controller: null,
    validator: (input)=> !input.contains('@')
    ?'Please enter a valid email!'
    :null,
     onSaved: (input)=>_email=input,
     decoration: new InputDecoration(
         filled: true,
         errorStyle: TextStyle(
          color: Colors.white,
          
        ),
          hintText: "Email address",
         hintStyle:TextStyle(color: Colors.grey),
          
        //  fillcolor: Colors.white.withOpacity(.05),
         border:InputBorder.none,
         focusColor:Colors.white, 
         
     ),
        ),
      ),
      Container(

        width:MediaQuery.of(context).size.width/1,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        padding: EdgeInsets.only(left:10.0),
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
     controller: null,

             obscureText: true,
              validator: (input)=> input.length<6
    ?'Password length must be greater than 6!'
    :null,
    onSaved: (input)=>_passw=input,
     decoration: new InputDecoration(
        errorStyle: TextStyle(
          color: Colors.white,
          
        ),
        
          hintText: "Password",
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
     
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child:FlatButton(
          textColor: Colors.white,
          // color: Colors.blue,
        // splashColor: Colors.blue,
       padding: EdgeInsets.symmetric(horizontal: 100.0),
          onPressed: _submit,
                    child: Text("Signup",style: TextStyle(color: Colors.white),),
                  )
                ),
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
                  // splashColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                 
                   onPressed: ()=>Navigator.pushNamed(context, Login.id),
                    child: Text("Back to Login",style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
                  )
                ),
                
              ],
          
            ),
          ),
          
                        ],
                      )
                      
                    )
                  ],
                ),
              );
            }
          
 
}