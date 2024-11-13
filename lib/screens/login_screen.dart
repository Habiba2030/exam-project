
import 'package:flutter/material.dart';
import 'package:habibamohamed0522072/provider/signin_provider.dart';
import 'package:habibamohamed0522072/provider/signup_provider.dart';
import 'package:habibamohamed0522072/screens/Signup_screen.dart';
import 'package:habibamohamed0522072/screens/login_screen.dart';
import 'package:habibamohamed0522072/screens/product_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final formkey=GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();


  LoginScreen({super.key});
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true,title: Text("Login",style: TextStyle(fontSize: 20,),),leading: Icon(Icons.menu),actions: [
        Icon(Icons.settings),
      ],),
      body:
      Consumer<Signin_provider>(builder: (context, value, child) {
        return  Form(key: formkey,child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 95,
              backgroundColor: Colors.pink,
              child: CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage("https://www.google.com/imgres?q=profile%20image&imgurl=https%3A%2F%2Fimg.freepik.com%2Fpremium-vector%2Fvector-flat-illustration-grayscale-avatar-user-profile-person-icon-profile-picture-business-profile-woman-suitable-social-media-profiles-icons-screensavers-as-templatex9xa_719432-1317.jpg%3Fsemt%3Dais_hybrid&imgrefurl=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fblank-profile&docid=N27wOLTIyDC6rM&tbnid=0lz5XINhMqKbwM&vet=12ahUKEwjOl9rBqtaJAxUadqQEHcMhAtMQM3oECBoQAA..i&w=626&h=626&hcb=2&ved=2ahUKEwjOl9rBqtaJAxUadqQEHcMhAtMQM3oECBoQAA"),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: email,
              decoration: InputDecoration(labelText: "Email:",suffixIcon: Icon(Icons.email)),
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
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password:",suffixIcon: Icon(Icons.password)),
              validator: (value)
              {
                if(value==null||value.isEmpty)
                {
                  return 'please enter your pass';
                }
                else if (value.length<8)
                  {

                      return ' your pass must be 8 num';

                  }

              },
            ),
            SizedBox(height: 20,),

            ElevatedButton(

                onPressed:() async
                {
                  if(formkey.currentState!.validate())
                  {
                    bool login=await value.postalldata(email.text, pass.text);
                    if(login)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("invalid")));
                    }
                  }
                },

                child: Text("Login")),
            SizedBox(height: 20,),

            Row(
              children: [
                Text("Alredy have an account"),
                TextButton(onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                }, child:Text("Register") )
              ],
            )
          ],
        ));
      },)
      ,
    );
  }
}
