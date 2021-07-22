import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';


class SignUp extends GetWidget<AuthController> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Sign In') ,
        ),

        body: Center(

          child: Padding(padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                TextFormField(
                  decoration: InputDecoration(hintText: "Email"),
                  controller: emailController,
                ),

                SizedBox(height:40),

                TextFormField(
                  decoration: InputDecoration(hintText: "Password"),
                  obscureText: true,
                  controller: passwordController,
                ),

                TextButton(onPressed: (){
                  controller.signUp(emailController.text, passwordController.text);
                },
                child: Text("SignUp"), style: TextButton.styleFrom(primary: Colors.teal.shade500),)
              ],
            ),
          ),
        ),
    );
  }
}