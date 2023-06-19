import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool internetStatus = true;
  Timer? timer;
  @override
  void initState() {
    if (!kIsWeb) {
      timer = Timer(
          Duration(seconds: 7),
          () => setState(() {
                internetStatus = false;
              }));
    }

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  Language get _lang {
    if (kIsWeb) return Language.EN;
    return Platform.localeName.substring(0, 2) == 'es'
        ? Language.ES
        : Language.EN;
  }

  bool get _isEs => _lang == Language.ES;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(81, 132, 255, 1),
                Color.fromRGBO(206, 73, 252, 1)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150.mezSp,
                          width: 150.mezSp,
                          child: ClipOval(
                            child: Container(
                                color: Colors.white,
                                child: Transform.scale(
                                    scale: 1.5, child: MezLogoAnimation())),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                        Text(
                          "MEZKALA",
                          style: TextStyle(fontSize: 45, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isEs ? "Cargando" : "Loading",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 25,
                            margin: const EdgeInsets.only(top: 5),
                            child: ThreeDotsLoading(
                              dotsColor: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                if (!internetStatus)
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 15),
                    color: offRedColor,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        _isEs
                            ? "No se pudo conectar a Internet. Por favor, verifica tu conexión de red e intenta de nuevo. Si el problema persiste, por favor intenta reiniciar la aplicación."
                            : "Unable to connect to the internet. Please check your network connection and try again. If the problem persists, please try restarting the app.",
                        style: TextStyle(color: redAccentColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
