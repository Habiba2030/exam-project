import 'package:flutter/material.dart';
import 'package:habibamohamed0522072/models/signup_model.dart';
import 'package:habibamohamed0522072/service/signup_service.dart';

class Signup_provider extends ChangeNotifier
{
  Signupandlogin_model? model;
    Future<bool>postalldata( name,phone,email,pass) async
    {
      try {
        await Signup_service.postdata(name, phone, email, pass);
        notifyListeners();
        return true;
      }
       catch(e){
        throw Exception("error$e");

       }
       return false;
    }
}