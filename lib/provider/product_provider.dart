import 'package:flutter/cupertino.dart';
import 'package:habibamohamed0522072/models/product_model.dart';
import 'package:habibamohamed0522072/service/product_service.dart';

class Product_provider extends ChangeNotifier
{
  Productmodel?model;
   Future<void> getall () async
  {
    model=await ProductService.getdata();
    notifyListeners();
  }

}