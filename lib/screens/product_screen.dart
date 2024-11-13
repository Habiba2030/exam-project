
import 'package:flutter/material.dart';
import 'package:habibamohamed0522072/provider/product_provider.dart';
import 'package:habibamohamed0522072/widget/details.dart';
import 'package:habibamohamed0522072/widget/product_widget.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Consumer<Product_provider>(builder: (context, value, child) {
        if(value.model==null)
        {
          value.getall();
          return CircularProgressIndicator();
        }

        else {
          return GridView.builder(itemCount: value.model?.data?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 60,
                mainAxisSpacing: 200,
                childAspectRatio: 3 / 2),

            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Details(image: value.model?.data?[index]['image'], name: value.model?.data?[index]['name'], descreption: value.model?.data?[index]['description']) ,));
                },
                child: ProductWidget(name: value.model?.data?[index]['name'], image: value.model?.data?[index]['image'], price: value.model?.data?[index]['price']),
              );
            },);
        }},),
    );
  }
}
