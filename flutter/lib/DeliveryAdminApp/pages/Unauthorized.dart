import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';

class UnauthorizedDeliveryOperator extends StatelessWidget {
  const UnauthorizedDeliveryOperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("kNotAuthorized")),
    );
  }
}
