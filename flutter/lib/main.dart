import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:mezcalmos/Shared/bindings/authBinding.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/helpers/databaseHelper.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// TODO :  singing in, view orders, accept orders 


Future<void> main() async {
  
  const startPoint  = bool.hasEnvironment('APP_SP') ? String.fromEnvironment('APP_SP') : null;
  const _host        = bool.hasEnvironment('HOST') ? String.fromEnvironment('HOST') : localhost;

  print('SP -> ${startPoint.toString()}');
  print('host  -> $_host');

  try 
  {
    if ((Platform.isAndroid || Platform.isIOS) && _host == localhost)
    {
      throw new Exception("[!] Error > When building for Android/IOS , Please make sure to pass Your Firebase host Machine's IP !");
    } 
  } 
  catch (e)
  {
    print(e);
  }

  WidgetsFlutterBinding.ensureInitialized();

  FirebaseApp _app              = await Firebase.initializeApp();
  FirebaseDatabase firebaseDb   = FirebaseDatabase(app: _app , databaseURL: _host+dbRoot);
  await FirebaseAuth.instance.useEmulator(_host+authPort);
  FirebaseFunctions.instance.useFunctionsEmulator(origin: _host+functionPort);
  
  if (await GetStorage.init()) 
  {
    print("[ GET STORAGE ] INITIALIZED !");
    // Loading map asset !
    await rootBundle.loadString(map_style_asset).then((jsonString) => GetStorage().write('map_style', jsonString));
  }
  else print("[ GET STORAGE ] FAILED TO INITIALIZE !");
   
  Get.put(DatabaseHelper(firebaseDb , _app , _host+dbRoot )); // we can specify after if we have many Databases ..

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
      theme: ThemeData(primaryColor: Colors.white , visualDensity: VisualDensity.adaptivePlatformDensity),
      color: Colors.white,
      getPages: XRouter.mainRoutes,
      enableLog: true,
      logWriterCallback:  mezcalmosLogger,
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