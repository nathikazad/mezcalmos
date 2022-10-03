import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:sizer/sizer.dart';

class RestaurantBankInfoCard extends StatefulWidget {
  const RestaurantBankInfoCard({super.key, required this.restaurantId});
  final String restaurantId;

  @override
  State<RestaurantBankInfoCard> createState() => _RestaurantBankInfoCardState();
}

class _RestaurantBankInfoCardState extends State<RestaurantBankInfoCard> {
  Rxn<Restaurant> restaurant = Rxn();
  @override
  void initState() {
    _getRest();
    super.initState();
  }

  Future<void> _getRest() async {
    restaurant.value = await Get.find<RestaurantsInfoController>()
        .getRestaurant(widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (restaurant.value != null &&
          restaurant.value!.paymentInfo.bankInfo != null) {
        return Card(
          margin: const EdgeInsets.only(top: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  alignment: Alignment.center,
                  child: Text(
                    'Restaurant bank account',
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Bank name",
                                    style: Get.textTheme.bodyText1?.copyWith(
                                      fontSize: 10.sp,
                                    )),
                                Text(restaurant.value!.paymentInfo.bankInfo
                                        ?.bankName ??
                                    "Error"),
                              ],
                            ),
                          ),
                          MezIconButton(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                        text: restaurant.value!.paymentInfo
                                            .bankInfo?.bankName
                                            .toString()))
                                    .then((_) => _copiedSnackBar());
                              },
                              iconSize: 20,
                              icon: Icons.copy_rounded),
                        ],
                      ),

                      Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Account number",
                                  style: Get.textTheme.bodyText1
                                      ?.copyWith(fontSize: 10.sp),
                                ),
                                Text(restaurant.value!.paymentInfo.bankInfo
                                        ?.accountNumber
                                        .toString() ??
                                    "Error"),
                              ],
                            ),
                          ),
                          MezIconButton(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                        text: restaurant.value!.paymentInfo
                                            .bankInfo?.accountNumber
                                            .toString()))
                                    .then((_) => _copiedSnackBar());
                              },
                              iconSize: 20,
                              icon: Icons.copy_rounded),
                        ],
                      ),

                      // Row(
                      //   children: [
                      //     Flexible(
                      //       fit: FlexFit.tight,
                      //       child: Text(restaurant
                      //               .value!.paymentInfo.bankInfo?.accountNumber
                      //               .toString() ??
                      //           "Error"),
                      //     ),
                      //     MezIconButton(
                      //         onTap: () {
                      //           Clipboard.setData(ClipboardData(
                      //                   text: restaurant.value!.paymentInfo
                      //                       .bankInfo?.accountNumber
                      //                       .toString()))
                      //               .then((_) => _copiedSnackBar());
                      //         },
                      //         backgroundColor: Colors.transparent,
                      //         icon: Icons.copy_rounded)
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else
        return SizedBox();
    });
  }

  SnackbarController _copiedSnackBar() {
    return Get.snackbar("", "",
        snackStyle: SnackStyle.FLOATING,
        titleText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle),
            const SizedBox(width: 5),
            Text(
              "Copied",
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
        snackPosition: SnackPosition.BOTTOM,
        shouldIconPulse: false,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.only(top: 25),
        maxWidth: 50.w);
  }
}
