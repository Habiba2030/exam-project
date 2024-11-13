import 'package:flutter/material.dart';
class Loginsignup extends StatelessWidget {
  Loginsignup({
    required this.controller,
    required this.icon,
    required this.lable,
    this.obscure=true,
    required this.validator,
     super.key});
 final TextEditingController controller;
 String lable;
 bool obscure;
 final IconData icon;
 final validator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [

          TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: lable,icon: Icon(icon)),
            validator: (value)
            {
              if(value==null||value.isEmpty)
                {
                  return 'error';
                }
              else if (value.length<8)
              {
                return 'error';
              }
            },

          )
        ],
      ),
    );
  }
}
