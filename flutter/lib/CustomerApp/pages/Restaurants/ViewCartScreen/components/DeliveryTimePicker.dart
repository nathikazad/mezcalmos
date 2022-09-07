import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/Controllers/ViewCartController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryType.dart';
import 'package:mezcalmos/Shared/widgets/MezDateTimePicker/Controllers/MezDateTimePickerController.dart';
import 'package:mezcalmos/Shared/widgets/MezDateTimePicker/MezDateTimePicker.dart';
import 'package:sizer/sizer.dart';

class DeliveryTimePicker extends StatefulWidget {
  const DeliveryTimePicker({Key? key, required this.viewCartController})
      : super(key: key);
  final ViewCartController viewCartController;

  @override
  State<DeliveryTimePicker> createState() => _DeliveryTimePickerState();
}

class _DeliveryTimePickerState extends State<DeliveryTimePicker> {
  RestaurantController controller = Get.find<RestaurantController>();

  @override
  void initState() {
    if (controller.cart.value.cartPeriod != null) {
      controller.cart.value.deliveryTime =
          controller.cart.value.cartPeriod!.start;
      mezDbgPrint("Delivery time =================");
      mezDbgPrint(controller.cart.value.cartPeriod!.start);
      controller.saveCart();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery time",
            style: Get.textTheme.bodyText1,
          ),
          if (controller.associatedRestaurant?.isOpen() == false)
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 14.sp,
                    color: Color(0xFF494949),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Flexible(
                    child: Text(
                      "Restaurant is closed now",
                      style: Get.textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 8,
          ),
          Card(
            child: InkWell(
              onTap: (controller.cart.value.deliveryTime != null)
                  ? null
                  : () async {
                      await _pickDeliveryTime(context);
                    },
              borderRadius: BorderRadius.circular(10),
              child: Obx(
                () => Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: (controller.cart.value.deliveryTime != null)
                            ? primaryBlueColor
                            : Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      (controller.cart.value.deliveryTime == null)
                          ? Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                  (controller.associatedRestaurant?.isOpen() ==
                                          false)
                                      ? "Pick your time"
                                      : "Now"))
                          : Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                "${DateFormat.MMMEd(userLangCode).format(controller.cart.value.deliveryTime!.toLocal()).replaceAll(".", "")}, ${DateFormat("hh:mm a").format(controller.cart.value.deliveryTime!.toLocal())}",
                                style: Get.textTheme.bodyText1,
                              ),
                            ),
                      if (controller.cart.value.deliveryTime == null)
                        Icon(Icons.chevron_right),
                      if (controller.cart.value.deliveryTime != null)
                        InkWell(
                          onTap: () {
                            _pickDeliveryTime(context);
                          },
                          customBorder: CircleBorder(),
                          child: Ink(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: secondaryLightBlueColor,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: primaryBlueColor,
                            ),
                          ),
                        ),
                      if (controller.cart.value.deliveryTime != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: InkWell(
                            customBorder: CircleBorder(),
                            onTap: () {
                              controller.cart.value.deliveryTime = null;
                              controller.cart.value.deliveryType =
                                  DeliveryType.Now;
                              controller.saveCart();
                            },
                            child: Ink(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: offRedColor, shape: BoxShape.circle),
                              child: Icon(
                                Icons.close,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDeliveryTime(BuildContext context) async {
    mezDbgPrint(controller.cart.value.isSpecial);
    mezDbgPrint(controller.cart.value.cartPeriod.toString());
    await showModalBottomSheet<DateTime>(
        context: context,
        isDismissible: true,
        builder: (BuildContext ctx) {
          return MezDateTimePicker(
            startDate: controller.cart.value.deliveryTime?.toLocal(),
            pickerMode: MezTimePickerMode.PickDeliveryTime,
            periodOfTime: controller.cart.value.cartPeriod,
            numberOfDaysInterval: controller.cart.value.isSpecial ? 1 : 7,
            serviceSchedule: controller.cart.value.restaurant!.schedule!,
          );
        }).then((DateTime? value) {
      if (value != null) {
        controller.cart.value.deliveryTime = value;
        controller.saveCart();
      }
    });
  }
}
