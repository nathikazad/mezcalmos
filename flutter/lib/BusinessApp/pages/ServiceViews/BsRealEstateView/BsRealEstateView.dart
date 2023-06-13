import 'package:flutter/material.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRealEstateView/controllers/BsRealEstateViewController.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class BsRealEstateView extends StatefulWidget {
  const BsRealEstateView({super.key});

  @override
  State<BsRealEstateView> createState() => _BsRealEstateViewState();

  static Future<bool?> navigate(
      {required int? id,
      required int businessDetailsId,
      required int businessId}) async {
    String route = BusinessOpRoutes.kBsOpRealEstate;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(route, arguments: {
      "businessDetailsId": businessDetailsId,
      "businessId": businessId
    });
    return MezRouter.backResult;
  }
}

class _BsRealEstateViewState extends State<BsRealEstateView> {
  final BsRealEstateViewController viewController =
      BsRealEstateViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BsReal Estate"),
      ),
      body: Center(
        child: Text("BsReal Estate"),
      ),
    );
  }
}
