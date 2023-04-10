import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/orderRoute.dart';

class OrderViewPage extends StatefulWidget {
  const OrderViewPage({super.key});

  @override
  State<OrderViewPage> createState() => _OrderViewPageState();

  static Future<void> navigate() {
    return MezRouter.toPath(OrderRoutes.orderViewRoute);
  }
}

class _OrderViewPageState extends State<OrderViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
