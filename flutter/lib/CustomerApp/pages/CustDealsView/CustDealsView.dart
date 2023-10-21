import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDealsView/components/CustPromoCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDealsView/controllers/CustDealsViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

class CustDealsView extends StatefulWidget {
  const CustDealsView({super.key});

  @override
  State<CustDealsView> createState() => _CustDealsViewState();
}

class _CustDealsViewState extends State<CustDealsView> {
  CustDealsViewController _viewController = CustDealsViewController();

  @override
  void initState() {
    _viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    _viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu, title: "Deals"),
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (_viewController.isInitalized.isFalse)
                  ? Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator())
                  : Expanded(
                      child: _viewController.offers.isEmpty &&
                              !_viewController.isFetching
                          ? Container(
                              margin: const EdgeInsets.all(15),
                              child: Text("Sorry no promotions found..."))
                          : ListView.builder(
                              controller: _viewController.promoScrollController,
                              itemCount: _viewController.offers.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  CustPromoCard(
                                promotion: _viewController.offers[index],
                              ),
                            ),
                    )
            ],
          )),
    );
  }
}
