import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mezcalmos/WebApp/widgets/endWebSideBar.dart';

class CartViewScreen extends StatefulWidget {
  CartViewScreen({Key? key}) : super(key: key);

  @override
  State<CartViewScreen> createState() => _CartViewScreenState();
}

class _CartViewScreenState extends State<CartViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: EndWebSideBar(isMobileScreen: true)),
    );
  }
}
