// BELONGS TO TAXI APP, please move

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class UnauthorizedScreen extends StatefulWidget {
  UnauthorizedScreen({Key? key}) : super(key: key);

  @override
  _UnauthorizedScreenState createState() => _UnauthorizedScreenState();
}

class _UnauthorizedScreenState extends State<UnauthorizedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _animeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// Color.fromARGB(255, 97, 127, 255),
// Color.fromARGB(255, 198, 90, 252),

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            key: Get.find<SideMenuDraweController>().getNewKey(),
            drawer: MezSideMenu(),
            backgroundColor: Colors.white,
            appBar: mezcalmosAppBar(
                "menu", Get.find<SideMenuDraweController>().openMenu),
            body: SafeArea(
                child: Center(
                    child: Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: Axis.vertical,
              children: [
                Container(
                  child: Icon(
                    MezcalmosIcons.ban,
                    color: Color.fromARGB(150, 198, 90, 252),
                    size: getSizeRelativeToScreen(80, Get.height, Get.width),
                  ),
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(taxiAnauthorizedAsset),
                        fit: BoxFit.contain),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Anauthorized',
                  style: TextStyle(
                      color: Colors.black38, fontSize: 20, fontFamily: 'psr'),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () async {
                    if (!(await launch('https://meztaxi.com')))
                      mezcalmosSnackBar('Error',
                          "Failed launching https://meztaxi.com on browser , maybe try to browse to it manually ? ");
                  },
                  child: Text(
                    'Request permission at : mextaxi.com ?',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black26,
                        fontSize: 14,
                        fontFamily: 'psr'),
                  ),
                )
              ],
            )))));
  }
}
