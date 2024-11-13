import 'package:dio/dio.dart';
import 'package:habibamohamed0522072/models/product_model.dart';

class ProductService
{
  static Dio dio=Dio();
  static Future<Productmodel> getdata() async
  {
    final responce=await dio.get("https://student.valuxapps.com/api/home");
    if(responce.statusCode==200)
    {
      return Productmodel.fromjson(responce.data);
    }
    else
    {
      throw Exception('error server');
    }
  }
}