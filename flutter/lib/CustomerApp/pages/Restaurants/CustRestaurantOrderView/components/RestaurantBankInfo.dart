import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewOrderScreen"]["components"]
    ["RestaurantBankInfoCard"];
//

class RestaurantBankInfoCard extends StatefulWidget {
  RestaurantBankInfoCard(
      {super.key, required this.restaurantId, this.isWebVersion});
  final int restaurantId;
  bool? isWebVersion = false;

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
    restaurant.value = await get_restaurant_by_id(id: widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Obx(() {
      if (restaurant.value != null &&
          restaurant.value!.paymentInfo?.bankInfo != null) {
        return Card(
          margin: const EdgeInsets.only(top: 20),
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  alignment: Alignment.center,
                  child: Text(
                    '${_i18n()["title"]}',
                    style: txt.bodyText1?.copyWith(
                        fontSize: widget.isWebVersion == true ? 16 : null),
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
                                Text('${_i18n()["bankName"]}',
                                    style: txt.bodyText1?.copyWith(
                                      fontSize: widget.isWebVersion == true
                                          ? 16
                                          : 10.sp,
                                    )),
                                Text(restaurant.value!.paymentInfo?.bankInfo
                                        ?.bankName ??
                                    "Error"),
                              ],
                            ),
                          ),
                          MezIconButton(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                        text: restaurant.value!.paymentInfo
                                            ?.bankInfo?.bankName
                                            .toString()))
                                    .then((_) => _copiedSnackBar(txt));
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
                                  '${_i18n()["accountNumber"]}',
                                  style: txt.bodyText1?.copyWith(
                                      fontSize: widget.isWebVersion == true
                                          ? 16
                                          : 10.sp),
                                ),
                                Text(restaurant.value!.paymentInfo?.bankInfo
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
                                            ?.bankInfo?.accountNumber
                                            .toString()))
                                    .then((_) => _copiedSnackBar(txt));
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

  SnackbarController _copiedSnackBar(TextTheme txt) {
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
              style: txt.bodyText1,
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
