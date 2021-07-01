import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:mezcalmos/CustomerApp/main.dart';
import 'package:mezcalmos/DeliveryApp/main.dart';
import 'package:mezcalmos/Shared/bindings/authBinding.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/helpers/databaseHelper.dart';
import 'package:mezcalmos/TaxiApp/main.dart';
import 'package:mezcalmos/TaxiApp/pages/SplashScreen.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// TODO :  singing in, view orders, accept orders 



Future<bool> setup(String _host , String _db) async 
{

  FirebaseApp _app              = await Firebase.initializeApp();
  FirebaseDatabase firebaseDb   = FirebaseDatabase(app: _app , databaseURL: _host+dbRoot );

  await FirebaseAuth.instance.useEmulator(_host+authPort);
  FirebaseFunctions.instance.useFunctionsEmulator(origin: _host+functionPort);
  
  // Global Injections !
  Get.put(DatabaseHelper(_host+dbRoot, _db , firebaseDatabase:  firebaseDb ,fapp:  _app)); // we can specify after if we have many Databases ..

  
  // GetStorage
  if (await GetStorage.init())
  {

    print("[ GET STORAGE ] INITIALIZED !");
    // Loading map asset !
    await rootBundle.loadString(map_style_asset).then((jsonString) => GetStorage().write('map_style', jsonString));
    return true; 
  }
  else print("[ GET STORAGE ] FAILED TO INITIALIZE !");
  return false;
}



Future<void> main() async {
  
  const startPoint  = bool.hasEnvironment('APP_SP') ? String.fromEnvironment('APP_SP') : null;
  const _host       = bool.hasEnvironment('HOST') ? String.fromEnvironment('HOST') : localhost;
  const _db         = bool.hasEnvironment('DB') ? String.fromEnvironment('DB') : 'production';

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

  // WidgetsFlutterBinding.ensureInitialized();

  
  switch (startPoint) 
  {
    case 'delivery':
      return runApp(StartPoint(DeliveryApp() , _host, _db));

    case 'customer':
      return runApp(StartPoint(CustomerApp() , _host, _db));
    
    default: return runApp(StartPoint(TaxiApp() , _host, _db));
  }

}


class StartPoint extends StatelessWidget
{
  final Widget _app;
  final String _host;
  final String _db;

  StartPoint(this._app , this._host, this._db);

  @override
  Widget build(BuildContext context) 
  {
    // StartPoint Injections
    SettingsController _settingsCtrl = Get.put<SettingsController>(SettingsController() , permanent: true);

    return FutureBuilder(
      future: setup(_host, _db),
      builder: (ctx , snapshot)
      {
        switch (snapshot.connectionState) 
        {
         case ConnectionState.waiting: return MaterialApp(
           debugShowCheckedModeBanner: false,
           home: Scaffold(
             body: Center(child: CircularProgressIndicator()),
           ),
         );
         default:
          if (snapshot.hasError)
          {
            mezcalmosSnackBar("Error", "Server connection failed !");
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Icon(Icons.signal_wifi_bad , color: Colors.red.shade200, size: getSizeRelativeToScreen(50, Get.height, Get.width)),
                ),
              ),
            );
          }
          else
          {
            _settingsCtrl.isAppInitialized = true;
            return _app;
          }
        }
      },
    );
  }
}
