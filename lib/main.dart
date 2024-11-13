import 'package:flutter/material.dart';
import 'package:habibamohamed0522072/provider/product_provider.dart';
import 'package:habibamohamed0522072/provider/signin_provider.dart';
import 'package:habibamohamed0522072/provider/signup_provider.dart';
import 'package:habibamohamed0522072/screens/Signup_screen.dart';
import 'package:habibamohamed0522072/screens/product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<Signup_provider>(create: (context) => Signup_provider(),),
      ChangeNotifierProvider<Signin_provider>(create: (context) => Signin_provider(),),
      ChangeNotifierProvider<Product_provider>(create: (context) => Product_provider(),)


    ],
    child: MaterialApp(
      home: SignupScreen(),
      debugShowCheckedModeBanner: false,
    ),);

  }
}
