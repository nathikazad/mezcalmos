import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownRoutePage extends StatefulWidget {
  UnknownRoutePage({Key? key}) : super(key: key);

  @override
  State<UnknownRoutePage> createState() => _UnknownRoutePageState();
}

class _UnknownRoutePageState extends State<UnknownRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("unfound 404"),
      ),
    );
  }
}
