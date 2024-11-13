
import 'package:flutter/material.dart';
import 'package:habibamohamed0522072/provider/signup_provider.dart';
import 'package:habibamohamed0522072/screens/login_screen.dart';
import 'package:habibamohamed0522072/widget/loginsignup.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final formkey=GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  SignupScreen({super.key});
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true,title: Text("Signup",style: TextStyle(fontSize: 20,),),leading: Icon(Icons.menu),actions: [
        Icon(Icons.settings),
      ],),
      body:
     Consumer<Signup_provider>(builder: (context, value, child) {
       return  Form(key: formkey,child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextFormField(
             controller: name,
             decoration: InputDecoration(labelText: "Name :",suffixIcon: Icon(Icons.person)),
             validator: (value)
             {
               if(value==null||value.isEmpty)
               {
                 return 'please enter your name';
               }
             },

           ),
           SizedBox(height: 20,),
           TextFormField(
             controller: email,
             decoration: InputDecoration(labelText: "Email :",suffixIcon: Icon(Icons.email)),
             validator: (value)
             {
               if(value==null||value.isEmpty)
               {
                 return 'please enter your email';
               }
             },

           ),
           SizedBox(height: 20,),

           TextFormField(
             controller: phone,
             decoration: InputDecoration(labelText: "Phone:",suffixIcon: Icon(Icons.phone)),
             validator: (value)
             {
               if(value==null||value.isEmpty)
               {
                 return 'please enter your phone num';
               }
               else if(value.length<11)
                 {
                   return ' your phone num must be 11 num';
                 }
             },

           ),
           SizedBox(height: 20,),

           TextFormField(
             controller: pass,
             obscureText: true,
             decoration: InputDecoration(labelText: "Password:",suffixIcon: Icon(Icons.password,color: Colors.orange,)),
             validator: (value)
             {
               if(value==null||value.isEmpty)
               {
                 //you must enter your pass
                 return 'please enter your pass';
               }
               else if(value.length<8)
               {
                 return 'your pass should be at least 8 char';
               }
             },
           ),
           SizedBox(height: 20,),

           ElevatedButton(

               onPressed:() async
               {
                 if(formkey.currentState!.validate())
                 {
                   bool signup=await value.postalldata(name.text, phone.text, email.text, pass.text);

                   if(signup)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                      }
                   else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("invalid")));
                    }
                 }
               },

               child: Text("Signup")),
           SizedBox(height: 20,),

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Alredy have an account"),
               TextButton(onPressed: ()
                   {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                   }, child:Text("Login") )
             ],
           )
         ],
       ));
     },)
      ,
    );
  }
}
