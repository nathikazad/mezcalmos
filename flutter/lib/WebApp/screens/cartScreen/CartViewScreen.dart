import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartViewScreen extends StatefulWidget {
  CartViewScreen({Key? key}) : super(key: key);

  @override
  State<CartViewScreen> createState() => _CartViewScreenState();
}

class _CartViewScreenState extends State<CartViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("this is a cart view screen ")),
    );
  }
}
