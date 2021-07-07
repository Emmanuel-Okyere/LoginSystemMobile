import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_exception.dart';

import 'package:provider/provider.dart';
class Authentication with ChangeNotifier{
  //SignUp Authentication
Future <void> signUp(String email, String password) async
{
  const url='https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDn8Y2BX1gm31huO1uB-YeI4LXAm6sTaJs';
  try{
    final response= await http.post (Uri.parse(url), body: json.encode(
        {
          'email' :email,
          'password' : password,
          'returnSecureToken': true,
        }
    ));
    final responseData=json.decode(response.body);
    if(responseData['error'] !=null) {
      throw HttpException(responseData['error']['message']);
      // print(responseData);
    }
  }catch(error){
    throw error;

  }


}
//Login Authentication
Future <void> logIn(String email, String password) async
{
  const url='https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDn8Y2BX1gm31huO1uB-YeI4LXAm6sTaJs';

  try{
    final response= await http.post (Uri.parse(url), body: json.encode(
        {
          'email' :email,
          'password' : password,
          'returnSecureToken': true,
        }
    ));
    final responseData=json.decode(response.body);
    //print(responseData);
    // ignore: unnecessary_null_comparison
    if(responseData['error'] !=null){
      throw HttpException(responseData['error']['message']);
    }
  } catch(error)
  {
    throw error;
  }


}
}