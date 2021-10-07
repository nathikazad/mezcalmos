import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/pages/Wrapper.dart';
import 'package:mezcalmos/CustomerApp/helpers/authHooks.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:get/get.dart';

class CustomerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _initializeConfig() async {
      // We will use this to Initialize anything at MaterialApp root init of app
      BitmapDescriptor desc = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), 'assets/images/purple_circle.png');

      await GetStorage().write('markerCircle', desc);
      print("[+] InitializedConfig -- the Customer App !");
    }

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onInit: () async => await _initializeConfig(),
        title: 'Customer App',
        theme: ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        color: Colors.white,
        home: Wrapper());
  }
}
