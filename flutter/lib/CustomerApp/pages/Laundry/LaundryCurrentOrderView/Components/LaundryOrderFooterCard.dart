import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/old/customerApp/laundry/LaundryController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class LaundryOrderFooterCard extends StatefulWidget {
  const LaundryOrderFooterCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  State<LaundryOrderFooterCard> createState() => _LaundryOrderFooterCardState();
}

class _LaundryOrderFooterCardState extends State<LaundryOrderFooterCard> {
  LaundryController laundryController = Get.find<LaundryController>();

  dynamic _i18n() =>
      Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
          ['LaundryCurrentOrderView']['Components']['LaundryOrderFooterCard'];
  RxBool _clickedCancel = false.obs;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
        height: 65,
        margin: const EdgeInsets.only(bottom: 8),
        child: (widget.order.inProcess())
            ? Container(
                margin: EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () async {
                    await showConfirmationDialog(context, onYesClick: () async {
                      final ServerResponse resp =
                          await laundryController.cancelOrder(
                        widget.order.orderId,
                      );

                      if (resp.success) {
                        MezRouter.untill(
                          (Route<dynamic> route) =>
                              route.settings.name == kHomeRoute,
                        );
                        MezSnackbar(
                          _i18n()["titleSuccess"],
                          _i18n()["orderCancelSuccess"],
                          position: SnackPosition.TOP,
                        );
                      } else {
                        MezSnackbar(
                          _i18n()["titleFailed"],
                          _i18n()["orderCancelFailed"],
                          position: SnackPosition.TOP,
                        );
                      }
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFF9D8D6), primary: Colors.red),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('${_i18n()["cancelOrder"]}'),
                  ),
                ),
              )
            : null);
  }
}
