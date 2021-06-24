import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/sharedWidgets.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';


class SignIn extends GetWidget<AuthController> {

  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final sw    = MediaQuery.of(context).size.width;
    final sh    = MediaQuery.of(context).size.height;
    double getSizeRelativeToScreen(double v) => (sh / sw) * v;

    return Scaffold(

        body: SafeArea(
          child: Center(
            child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: MezcalmosSharedWidgets.logo,
                  ),
                  SizedBox(height:getSizeRelativeToScreen(25)),
                  MezcalmosSharedWidgets.mezcalmos(textSize: getSizeRelativeToScreen(25)),
                  SizedBox(height: getSizeRelativeToScreen(20),),
                  Flexible(

                    child: Text(
                      tConnectMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getSizeRelativeToScreen(18),
                      ),
                      
                    ),
                  ),
                  SizedBox(height: getSizeRelativeToScreen(20),),
                  Flexible(
                    fit: FlexFit.loose,
                    child: TextButton(
                    onPressed: () => controller.signIn(tEmailTestValue , tEmailTestPassword),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon( Icons.facebook),
                        Text(tFacebookSigning)
                      ],
                    ),

                    style: ButtonStyle(
                      // padding:  MaterialStateProperty.<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 10)),
                      textStyle: MaterialStateProperty.all<TextStyle>(new TextStyle(
                        fontSize: getSizeRelativeToScreen(10),
                        fontWeight: FontWeight.bold
                      )),
                      fixedSize: MaterialStateProperty.all<Size>(new Size(getSizeRelativeToScreen(150), getSizeRelativeToScreen(25))),
                      elevation: MaterialStateProperty.all<double>(2),
                      backgroundColor:  MaterialStateProperty.all<Color>(Color.fromARGB(255, 58, 85, 159)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  )),
                  SizedBox(height: getSizeRelativeToScreen(5),),
                  Flexible(
                    fit: FlexFit.loose,
                    child: TextButton(
                    onPressed: () => Get.toNamed(kOtpRoute), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon( Icons.email_outlined),
                        Text(tSmsSigning)
                      ],
                    ),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(new TextStyle(
                        fontSize: getSizeRelativeToScreen(10),
                        fontWeight: FontWeight.bold
                      )),
                      fixedSize: MaterialStateProperty.all<Size>(new Size(getSizeRelativeToScreen(150), getSizeRelativeToScreen(25))),
                      elevation: MaterialStateProperty.all<double>(2),
                      backgroundColor:  MaterialStateProperty.all<Color>(Color.fromARGB(255, 92, 127, 255)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  )),
                  
               
                ],

              ),
            ),
          )
        ),

        // appBar: AppBar(
        //   title: Text('Sign In') ,
        // ),

        // body: Center(
        //   child: Padding(padding: const EdgeInsets.all(20.0),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[

        //         TextFormField(
        //           decoration: InputDecoration(hintText: "Email"),
        //           controller: emailController,
        //         ),

        //         SizedBox(height:40),

        //         TextFormField(
        //           decoration: InputDecoration(hintText: "Password"),
        //           obscureText: true,
        //           controller: passwordController,
        //         ),

        //         TextButton(onPressed: () => controller.signIn(emailController.text, passwordController.text), child: Text("SignIn"), style: TextButton.styleFrom(primary: Colors.teal.shade500),),
        //         TextButton(onPressed: () => Get.toNamed(kSignUpRoute), child: Text("SignUp")),
        //       ],
        //     ),
        //   ),
        // ),
    );
  }
}