
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
   ProductWidget({
     required this.name,
     required this.image,
   required this.price
     ,super.key});
   String image;
   String name;
   var price;

  @override
  Widget build(BuildContext context) {
    return Container (
      child:
      Column(
        children: [
          Image.network(image),
          Text(name),
          Text("$price"),
        ],
      ),
    );
  }
}
