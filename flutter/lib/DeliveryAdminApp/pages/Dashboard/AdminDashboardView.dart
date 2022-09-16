import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Dashboard/components/ShippingPriceSheet.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Dashboard/controllers/AdminDashboardController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

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
            _shippingPriceCard(),
          ],
        ),
      ),
    );
  }

  Widget _shippingPriceCard() {
    return Card(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  '${_i18n()["shippingPrice"]}',
                  style: Get.textTheme.bodyText1,
                ),
              ),
              Obx(
                () {
                  if (viewController.shippingPrice.value != null) {
                    return Text(
                      viewController.shippingPrice.value!.toPriceString(),
                      style: Get.textTheme.bodyText1,
                    );
                  } else
                    return SizedBox();
                },
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: MezIconButton(
                  onTap: () {
                    _priceSheet();
                  },
                  icon: Icons.edit,
                  iconSize: 20,
                ),
              )
            ],
          )),
    );
  }

  Future<void> _priceSheet() async {
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
            ctx: ctx,
          );
        });
  }
}
