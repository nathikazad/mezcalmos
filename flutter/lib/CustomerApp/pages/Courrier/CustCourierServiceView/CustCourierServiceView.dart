import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustCourierServiceView/controllers/CustCourierViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustRequestCourrierView/CustRequestCourierView.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSliverAppbar.dart';

class CustCourierServiceView extends StatefulWidget {
  const CustCourierServiceView({super.key});
  static Future<void> navigate({required int companyId}) {
    return MezRouter.toPath(CourierRoutes.kCourierServiceRoute
        .replaceFirst(":companyId", "$companyId"));
  }

  @override
  State<CustCourierServiceView> createState() => _CustCourierServiceViewState();
}

class _CustCourierServiceViewState extends State<CustCourierServiceView> {
  CustCourierServiceViewController _viewController =
      CustCourierServiceViewController();
  int? companyId;
  @override
  void initState() {
    companyId = int.parse(MezRouter.urlArguments['companyId'].toString());
    if (companyId != null) {
      _viewController.init(companyId: companyId!);
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MezButton(
        label: "Order now",
        height: 80,
        onClick: () async {
          unawaited(CustRequestCourierView.navigate(companyId!));
        },
        borderRadius: 0,
      ),
      body: Obx(() {
        if (_viewController.hasData) {
          // view
          return CustomScrollView(
            slivers: [
              MezSliverAppBar(
                image: _viewController.company.info.image,
                title: _viewController.company.info.name,
                ordersRoute: CustomerRoutes.customerOrdersRoute,
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Flexible(
                      child: MezButton(
                        label: "Chat with us",
                        height: 50,
                        backgroundColor: Colors.white,
                        textColor: primaryBlueColor,
                        onClick: () async {},
                        icon: Icons.message,
                        borderRadius: 20,
                        border: Border.all(width: 1, color: primaryBlueColor),
                      ),
                    ),
                    Flexible(
                      child: MezButton(
                        label: "Contact us",
                        height: 50,
                        onClick: () async {},
                        backgroundColor: Colors.white,
                        textColor: primaryBlueColor,
                        icon: Icons.phone,
                        borderRadius: 20,
                        border: Border.all(width: 1, color: primaryBlueColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
