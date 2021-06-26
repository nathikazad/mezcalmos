import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentOrderScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Current Order'),
        ),
        body: Text('Current Order Details'));
  }
}
