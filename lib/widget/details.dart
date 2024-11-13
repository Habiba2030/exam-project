import 'package:flutter/material.dart';
import 'package:habibamohamed0522072/screens/product_screen.dart';
class Details extends StatelessWidget {
  String image;
  String name;
  String descreption;
   Details({
  required this.image,
    required this.name,
   required this.descreption,
  super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true,title: Text("Product details"),leading: TextButton(onPressed: ()
          {
            Navigator.pop(context,MaterialPageRoute(builder: (context) => ProductScreen(),));
          }, child: Icon(Icons.arrow_back)),),
      body:
      ListView(children: [
        Column(
          children: [
            Image.network(image),
            Text(name),
            Text(descreption),
          ],
        )
      ],
      ),
    );
  }
}
