import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RealEstateView/controllers/RealEstateViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustRealEstateView extends StatefulWidget {
  const CustRealEstateView({super.key});

  @override
  State<CustRealEstateView> createState() => _CustRealEstateViewState();

  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custRealEstateListRoute;
    return MezRouter.toPath(route);
  }
}

class _CustRealEstateViewState extends State<CustRealEstateView> {
  final CustRealEstateViewController viewController =
      CustRealEstateViewController();

  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Estate"),
      ),
      body: Center(
        child: Text("Real Estate"),
      ),
    );
  }
}
