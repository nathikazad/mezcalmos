import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDealsView/components/CustPromoCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDealsView/controllers/CustDealsViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["CustDealsView"];

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
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu,
          title: "${_i18n()['deals']}"),
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
                              margin: const EdgeInsets.all(25),
                              alignment: Alignment.center,
                              child: Text(
                                "${_i18n()['noDeals']}",
                                textAlign: TextAlign.center,
                              ))
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
