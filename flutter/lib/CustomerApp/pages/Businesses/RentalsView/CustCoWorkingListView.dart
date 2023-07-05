import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustCoWorkingListView extends StatefulWidget {
  const CustCoWorkingListView({super.key});

  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custCoWorkingListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustCoWorkingListView> createState() => _CustCoWorkingListViewState();
}

class _CustCoWorkingListViewState extends State<CustCoWorkingListView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
