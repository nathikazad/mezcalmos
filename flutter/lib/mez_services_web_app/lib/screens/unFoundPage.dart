import 'package:flutter/material.dart';

class UnfoundPageScreen extends StatefulWidget {
  UnfoundPageScreen({Key? key}) : super(key: key);

  @override
  State<UnfoundPageScreen> createState() => _UnfoundPageScreenState();
}

class _UnfoundPageScreenState extends State<UnfoundPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
