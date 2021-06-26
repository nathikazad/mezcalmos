import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';


class MezcalmosSideMenu extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) {

    final sw    = MediaQuery.of(context).size.width;
    final sh    = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Drawer(
        child: Flex(
          direction: Axis.vertical,
          // padding: EdgeInsets.zero,
          children: <Widget>[
            //DrawerHeader(
            // child: Text(
            //   'mezcalmos',
            // ),
            //   decoration: BoxDecoration(
            //       color: Colors.green,
            //       image: DecorationImage(
            //           fit: BoxFit.fill,
            //           image: AssetImage('assets/images/header.png'))),
            //),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.black,
              height: getSizeRelativeToScreen(25, sw, sh),
              // width: 1,
            ),
            Container(
              margin: EdgeInsets.only(top: getSizeRelativeToScreen(200, sw, sh), bottom: getSizeRelativeToScreen(20, sw, sh)),
              height: getSizeRelativeToScreen(300, sw, sh),
              width: double.infinity,
              child : CircleAvatar(
                child: ClipOval(
                  child: controller.user?.photoURL == null ? Image.asset(aDefaultAvatar) :  Image.network(controller.user!.photoURL!),
                ),
                backgroundColor: Colors.grey.shade100, //Color.fromARGB(255, 222, 222, 222),
                radius: 1,
              )
            ),

            Flexible(
              child: Text(
                controller.user?.displayName ?? tDefaultUserName,
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontWeight: FontWeight.bold,
                  fontSize: getSizeRelativeToScreen(55, sw, sh)
                ),
              ),
            ),
            
            SizedBox(height: getSizeRelativeToScreen(80, sw, sh)),
            Container(
              height: 222,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  
                  Padding(
                    padding: EdgeInsets.all(getSizeRelativeToScreen(25.0, sw, sh)),
                    child: GestureDetector(
                      onTap: () async => await controller.signOut(),
                      child: Row(
                        mainAxisAlignment : MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.power_settings_new_rounded),
                          SizedBox(width: getSizeRelativeToScreen(20.0, sw, sh)),
                          Center(child: Text(tDisconnect)),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(getSizeRelativeToScreen(25.0, sw, sh)),
                    child: GestureDetector(
                      onTap: () => print("Clicked To Spanish!!"),
                      child: Row(
                        mainAxisAlignment : MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.language),
                          SizedBox(width: getSizeRelativeToScreen(20.0, sw, sh)),
                          Center(child: Text("To Spanish")),
                        ],
                      ),
                    ),
                  )

                ],

              ),
            ),
            
          ],
        ),
      ),
    );
  }
}