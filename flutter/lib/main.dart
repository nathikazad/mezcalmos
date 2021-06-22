import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mezcalmos/Shared/bindings/authBinding.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// TODO :  singing in, view orders, accept orders 


Future<void> main() async {
  
  const startPoint = bool.hasEnvironment('APP_SP') ? String.fromEnvironment('APP_SP') : null;
  print('SP -> ${startPoint.toString()}');

  final String _host = Platform.isAndroid ? lanhost : localhost;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useEmulator(_host+authPort);
  FirebaseFunctions.instance.useFunctionsEmulator(origin: _host+functionPort);
  await GetStorage.init();

  switch (startPoint) 
  {
    case 'delivery':
      return runApp(DeliveryApp());

    case 'customer':
      return runApp(CustomerApp());
    
    default: return runApp(MainApp());
  }

}


// Main Start Point
class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fiction2Mission',
      theme: ThemeData(primaryColor: Colors.black , visualDensity: VisualDensity.adaptivePlatformDensity),
      
      getPages: XRouter.mainRoutes,

      initialRoute: kSplashRoute,
      initialBinding: AuthBinding() ,
    );
  }

}

// Delivery Start Point
class DeliveryApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: ThemeData(primaryColor: Colors.white , visualDensity: VisualDensity.adaptivePlatformDensity),
      
      getPages: XRouter.mainRoutes,


      initialRoute: kSplashRoute,
      initialBinding: AuthBinding(),
      
    );
  }

}

// Customer Start Point
class CustomerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer App !',
      theme: ThemeData(primaryColor: Colors.green , visualDensity: VisualDensity.adaptivePlatformDensity),

      getPages: XRouter.mainRoutes,


      initialRoute: kSplashRoute,
      initialBinding: AuthBinding(),
      
    );
  }


}