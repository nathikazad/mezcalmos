import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CustomerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _initializeConfig() async {
      // We will use this to Initialize anything at MaterialApp root init of app
      print("[+] InitializedConfig -- the Customer App !");
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onInit: () async => await _initializeConfig(),
      title: 'Fiction2Mission',
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      color: Colors.white,
      home: Scaffold(
        body: Center(
          child: Text("Customer App"),
        ),
      ),
    );
  }
}
