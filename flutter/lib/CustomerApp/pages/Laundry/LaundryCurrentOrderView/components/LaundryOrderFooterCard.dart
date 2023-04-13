import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/controllers/CustLaundryOrderViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
        ['LaundryCurrentOrderView']['Components']['LaundryOrderFooterCard'];

class LaundryOrderFooterCard extends StatefulWidget {
  const LaundryOrderFooterCard({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final CustLaundryOrderViewController viewController;

  @override
  State<LaundryOrderFooterCard> createState() => _LaundryOrderFooterCardState();
}

class _LaundryOrderFooterCardState extends State<LaundryOrderFooterCard> {
  RxBool _clickedCancel = false.obs;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
        height: 55,
        width: double.infinity,
        //   margin: const EdgeInsets.only(bottom: 8),
        child: (widget.viewController.order.value!.inProcess())
            ? Container(
                //margin: EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () async {
                    await showConfirmationDialog(context, onYesClick: () async {
                      final bool resp =
                          await widget.viewController.cancelOrder();

                      if (resp) {
                        MezRouter.popEverythingTillBeforeHome();
                        MezSnackbar(
                          _i18n()["titleSuccess"],
                          _i18n()["orderCancelSuccess"],
                          position: Alignment.topCenter,
                        );
                      }
                    });
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Color(0xFFE21132),
                      backgroundColor: Color(0xFFF9D8D6)),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('${_i18n()["cancelOrder"]}'),
                  ),
                ),
              )
            : null);
  }
}
