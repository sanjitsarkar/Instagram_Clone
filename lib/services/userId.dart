import 'package:shared_preferences/shared_preferences.dart';

class UserId
{
    static setUserId(String userid)
  async{
      SharedPreferences prefs =  await SharedPreferences.getInstance();
          prefs.setString('userId',userid);
  }
  static String userid;
   static getUserId()
  async{
      SharedPreferences prefs =  await SharedPreferences.getInstance();
          userid = prefs.getString('userId');
  }
   
}