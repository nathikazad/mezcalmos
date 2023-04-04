import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/CustomAppBar.dart';

class AssetServiceView extends StatefulWidget {
  const AssetServiceView({super.key});

  @override
  State<AssetServiceView> createState() => _AssetServiceViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(RentalRoutes.assetServiceRoute);
  }
}

class _AssetServiceViewState extends State<AssetServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(),
          ];
        },
        body: Placeholder(
          child: Text("Asset Service View"),
        ),
      ),
    );
  }
}
