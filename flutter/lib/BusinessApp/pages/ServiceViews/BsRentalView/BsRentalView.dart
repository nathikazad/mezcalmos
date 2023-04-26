import 'package:flutter/material.dart';

class BsRentalView extends StatefulWidget {
    BsRentalView({ Key? key }) : super(key: key);

  @override
  _BsRentalViewState createState() => _BsRentalViewState();
}

class _BsRentalViewState extends State<BsRentalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding : const EdgeInsets.all(16)
        ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),),
    );
  }
}
