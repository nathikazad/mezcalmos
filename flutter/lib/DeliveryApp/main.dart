import 'package:flutter/material.dart';

class DeliveryApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fiction2Mission',
      theme: ThemeData(primaryColor: Colors.white , visualDensity: VisualDensity.adaptivePlatformDensity),
      color: Colors.white,
      home: Scaffold(

        body: Center(
          child: Text("Delivery App"),
        ),
      ),
    );
  }

}