import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class UnauthorizedScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Unauthorized'),
        ),
        body: Text(
            'You are not authorized Taxi Driver, please contact admin for permission!'));
  }
}
