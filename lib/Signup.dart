import 'package:checkprovider/ViewPage.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("SignUp",style: TextStyle(fontSize: 25,color: Colors.black),),
        backgroundColor: Colors.black12,
        centerTitle: true,
      ),body:Center(
        child: Column(
        children: [
        helper.CustomTextField(emailController, "Email",Icons.mail , false),
          helper.CustomTextField(passwordController, "passowrd", Icons.password, true),
          helper.CustomTextField(passwordController, "passowrd", Icons.password, true),
          helper.CustomTextField(passwordController, "passowrd", Icons.password, true),

          ElevatedButton(onPressed: (){

          }, child: Text("SignUp",style: TextStyle(color: Colors.black,fontSize: 25),)),
        ],
            ),
      ) ,
    );
  }
}
