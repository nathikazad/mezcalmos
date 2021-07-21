import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/mezcalmos_icons.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class UnauthorizedScreen extends StatefulWidget {
  UnauthorizedScreen({Key? key}) : super(key: key);

  @override
  _UnauthorizedScreenState createState() => _UnauthorizedScreenState();
}

class _UnauthorizedScreenState extends State<UnauthorizedScreen>
    with TickerProviderStateMixin {
  late AnimationController _animeCtrl;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animeCtrl = new AnimationController(
        duration: const Duration(seconds: 2), vsync: this)
      ..repeat();
    animation = Tween<double>(begin: 0, end: 2).animate(_animeCtrl);

    animation.addListener(() {
      setState(() {});
      //set animation listiner and set state to update UI on every animation value change
    });
  }

  @override
  void dispose() {
    _animeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// Color.fromARGB(255, 97, 127, 255),
// Color.fromARGB(255, 198, 90, 252),

    return Center(
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
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(255, 97, 127, 255),
                    blurRadius: animation.value,
                    spreadRadius: animation.value)
              ]),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Anauthorized',
          style:
              TextStyle(color: Colors.black38, fontSize: 20, fontFamily: 'psr'),
        ),
        SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () async {
            if (!await launch('https://meztaxi.com'))
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
    ));
  }
}
