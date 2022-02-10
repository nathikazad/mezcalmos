import 'package:flutter/material.dart';

class CartIsEmptyScreen extends StatelessWidget {
  const CartIsEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("cart is empty"),
      ),
    );
  }
}
