import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Dashboard/controllers/AdminDashboardController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["AdminDashboardView"];

//
class ShippingPriceSheet extends StatelessWidget {
  const ShippingPriceSheet({
    Key? key,
    required this.viewController,
    required this.ctx,
  }) : super(key: key);

  final AdminDashboardController viewController;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                '${_i18n()["shippingPrice"]}',
                style: Get.textTheme.headline3,
              ),
            ),
            Divider(),
            const SizedBox(
              height: 15,
            ),
            Text(
              '${_i18n()["newShippingPrice"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: viewController.priceController,
                style: Get.textTheme.bodyText1,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.attach_money_rounded)),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                ]),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Flexible(
                    child: MezButton(
                  label: '${_i18n()["cancel"]}',
                  height: 50,
                  onClick: () async {
                    Get.back();
                  },
                  backgroundColor: offRedColor,
                  textColor: Colors.red,
                )),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                    child: MezButton(
                  label: '${_i18n()["confirm"]}',
                  height: 50,
                  withGradient: true,
                  onClick: () async {
                    if (num.tryParse(viewController.priceController.text) !=
                        null) {
                      await viewController
                          .changePrice(
                              num.parse(viewController.priceController.text))
                          .onError((Object? error, StackTrace stackTrace) =>
                              Get.snackbar(
                                  '${_i18n()["error"]}', '${_i18n()["error"]}',
                                  backgroundColor: Colors.black,
                                  colorText: Colors.white));
                    } else {
                      Get.snackbar(
                          '${_i18n()["error"]}', '${_i18n()["errorText"]}',
                          backgroundColor: Colors.black,
                          colorText: Colors.white);
                    }
                  },
                )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
