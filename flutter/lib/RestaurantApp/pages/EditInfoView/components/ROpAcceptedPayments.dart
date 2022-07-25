import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class ROpAcceptedPayments extends StatelessWidget {
  const ROpAcceptedPayments({Key? key, required this.viewController})
      : super(key: key);
  final ROpEditInfoController viewController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Accepted payments",
          style: Get.textTheme.bodyText1,
        ),
        SizedBox(
          height: 10,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: true,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (bool? v) {},
          activeColor: primaryBlueColor,
          checkboxShape: CircleBorder(),
          title: Text(
            "Cash",
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: viewController.restaurant.value!.paymentInfo.acceptCard,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (bool? v) {
            if (!viewController.restaurant.value!.paymentInfo.acceptCard) {
              onboardServiceProvider(viewController.restaurant.value!.info.id,
                      OrderType.Restaurant)
                  .then((ServerResponse value) {
                if (value.status == ResponseStatus.Success) {
                  mezDbgPrint(
                      "print url ===========>>>>>>    ${value.data["url"]}");
                  viewController.showPaymentSetup(url: value.data["url"]);
                }
              });
            }
          },
          title: Text(
            "Card",
          ),
          activeColor: primaryBlueColor,
          checkboxShape: CircleBorder(),
        ),
      ],
    );
  }
}
