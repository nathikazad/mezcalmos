import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewOrderScreen"]["components"]
    ["RestaurantBankInfoCard"];

class RestaurantBankInfoCard extends StatefulWidget {
  const RestaurantBankInfoCard({super.key, required this.restaurantId});

  final int restaurantId;

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
    return Obx(() {
      if (restaurant.value != null &&
          restaurant.value!.paymentInfo?.bankInfo != null) {
        return Card(
          margin: const EdgeInsets.only(top: 15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  alignment: Alignment.center,
                  child: Text(
                    '${_i18n()["title"]}',
                    style: context.txt.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 4,
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
                                    style: context.txt.bodyLarge?.copyWith(
                                      fontSize: 10.sp,
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
                                  '${_i18n()["accountNumber"]}',
                                  style: context.txt.bodyLarge
                                      ?.copyWith(fontSize: 10.sp),
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
                                    .then((_) => _copiedSnackBar());
                              },
                              iconSize: 20,
                              icon: Icons.copy_rounded),
                        ],
                      ),
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

  void _copiedSnackBar() {
    return customSnackBar(title: "Copied");
  }
}
