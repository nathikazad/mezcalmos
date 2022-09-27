import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Dashboard/components/AdminSettingCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Dashboard/components/ShippingPriceSheet.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Dashboard/controllers/AdminDashboardController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["AdminDashboardView"];

//
class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({Key? key}) : super(key: key);

  @override
  _AdminDashboardViewState createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
  AdminDashboardController viewController = AdminDashboardController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: Get.back,
        title: '${_i18n()["dashboard"]}',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  _shippingPriceCard(),
            Obx(
              () => AdminSettingCard(
                  icon: Icons.edit_rounded,
                  mainText: '${_i18n()["shippingPrice"]}',
                  secondaryText: (viewController.shippingPrice.value != null)
                      ? viewController.shippingPrice.value!.toPriceString() +
                          "/KM"
                      : null,
                  onClick: () {
                    _priceSheet(ShippingPriceType.Base);
                  }),
            ),

            Obx(
              () => AdminSettingCard(
                  icon: Icons.edit_rounded,
                  mainText: '${_i18n()["minPrice"]}',
                  secondaryText: (viewController.minPrice.value != null)
                      ? viewController.minPrice.value!.toPriceString()
                      : null,
                  onClick: () {
                    _priceSheet(ShippingPriceType.Min);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _priceSheet(ShippingPriceType type) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        context: context,
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: true,
        builder: (BuildContext ctx) {
          return ShippingPriceSheet(
            viewController: viewController,
            type: type,
            ctx: ctx,
          );
        });
  }
}
