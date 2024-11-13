
import 'package:dio/dio.dart';
import 'package:habibamohamed0522072/models/signup_model.dart';

class Login_Service
{
  static Dio dio=Dio();
  static Future<Signupandlogin_model> postdata(String email,String pass) async
  {
    final responce=await dio.post("https://student.valuxapps.com/api/login",
        data:{

          "email":email,
          "pass":pass
        }
    );
    if(responce.statusCode!>=200&&responce.statusCode!<300)
    {
      return Signupandlogin_model.fromjson(responce.data);
    }
    else
    {
      throw Exception('error server');
    }
  }
}