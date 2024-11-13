import 'package:flutter/cupertino.dart';
import 'package:habibamohamed0522072/models/signup_model.dart';
import 'package:habibamohamed0522072/service/login_service.dart';

class Signin_provider extends ChangeNotifier
{
  Signupandlogin_model? model;
  Future<bool>postalldata(email,pass) async
  {
    try {
      await Login_Service.postdata( email, pass);
      notifyListeners();
      return true;
    }
    catch(e){
      throw Exception("error$e");

    }
    return false;
  }
}