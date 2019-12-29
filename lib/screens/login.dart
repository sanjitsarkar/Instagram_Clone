import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_services.dart';
import './sign_up.dart';
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  static final String id = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool show = false;
  _toggle()
  {
    setState(() {
      if(show==false)
      show=true;
      else
      show=false;
    });
  }
  final _formKey = GlobalKey<FormState>();
 String _email,_passw;
            void _submit() {
              if(_formKey.currentState.validate())
              {
                _formKey.currentState.save();
                print(_email);
                print(_passw);
                AuthService.logInUser(context, _email, _passw);
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
              // mainAxisSize: MainAxisSize.min,
        
              children: <Widget>[
Padding(
  padding: const EdgeInsets.only(top:0.0,bottom: 10.0),
  
  child:   Center(child: Text("Instagram",style: TextStyle(fontFamily:'Billabong',fontSize:60.0),)),
) ,
Form(
  key: _formKey,
  
  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 mainAxisSize: MainAxisSize.min,
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
    validator: (input)=> !input.contains('@')
    ?'Please enter a valid email!'
    :null,
     onSaved: (input)=>_email=input,
     decoration: new InputDecoration(
       
       filled: true,
          errorStyle: TextStyle(
          
          color: Colors.white,
          
        ),
          hintText: "Email address or username",
         hintStyle:TextStyle(color: Colors.grey),
          
         fillColor: Colors.white.withOpacity(.1),
         border:InputBorder.none,
         focusColor:Colors.white, 
         
     ),
        ),
      ),
      Container(

        width:MediaQuery.of(context).size.width/1,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        // padding: EdgeInsets.only(left:20.0),
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
     controller: null,

             obscureText: show?false:true,
              validator: (input)=> input.length<6
    ?'Password length must be greater than 6!'
    :null,
    onSaved: (input)=>_passw=input,
     decoration: new InputDecoration(
       
       suffix: 
        
         IconButton(onPressed:_toggle,
          icon:Icon(Icons.security),color: Colors.white,iconSize: 30.0,),
      
         filled: true,
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
          padding: EdgeInsets.symmetric(horizontal: 140.0),
        // splashColor: Colors.blue,
       
          onPressed: _submit,
                    child: Text("Login",style: TextStyle(color: Colors.white),),
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
                 
                    onPressed: ()=>Navigator.pushNamed(context, Signup.id),
                    padding: EdgeInsets.symmetric(horizontal: 100.0),
                    child: Text("Goto Signup",style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
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