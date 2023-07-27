import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/EventCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/HomeCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/ProductCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/RentalCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/ServiceCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/components/CartIsEmptyScreen.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["CustCartView"]["CustCartView"];

class CustCartView extends StatefulWidget {
  const CustCartView({super.key});

  @override
  State<CustCartView> createState() => _CustCartViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(CustBusinessRoutes.custCartRoute);
  }
}

class _CustCartViewState extends State<CustCartView> {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();

  @override
  void initState() {
    // viewController.init();
    custBusinessCartController.fetchCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: '${_i18n()['myCart']}',
      ),
      bottomNavigationBar: Obx(
        () {
          if (custBusinessCartController.cart.value == null)
            return SizedBox.shrink();
          if (custBusinessCartController.cart.value!.items.isEmpty)
            return SizedBox.shrink();
          return MezButton(
            label: '${_i18n()['request']}',
            withGradient: true,
            borderRadius: 0,
            onClick: () async {
              if (await custBusinessCartController.showDisclaimerPopup()) {
                await _alertTermsAndServices();
              }
              await custBusinessCartController.requestOrder();
            },
          );
        },
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: (custBusinessCartController.cart.value == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (custBusinessCartController.cart.value!.items.isEmpty)
                    ? CartIsEmptyScreen()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${_i18n()["myOrders"]}",
                                style: context.textTheme.bodyLarge,
                              ),
                              InkWell(
                                onTap: () async {
                                  await custBusinessCartController.clearCart();
                                  if (custBusinessCartController.cart.value ==
                                          null ||
                                      custBusinessCartController
                                          .cart.value!.items.isEmpty) {
                                    await MezRouter.back();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller:
                                custBusinessCartController.couponController,
                            decoration: InputDecoration(
                              labelText: '${_i18n()['coupon']}',
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  await custBusinessCartController
                                      .applyCoupon();
                                },
                                icon: Icon(Icons.check),
                              ),
                            ),
                          ),
                          if (custBusinessCartController
                              .cart.value!.items.isNotEmpty)
                            ...custBusinessCartController.cart.value!.items
                                .asMap()
                                .entries
                                .map(
                              (MapEntry<int, BusinessCartItem> data) {
                                final int index = data.key;
                                final BusinessCartItem item = data.value;
                                switch (item.offeringType) {
                                  case OfferingType.Home:
                                    return HomeCartItemCard(
                                      index: index,
                                      item: item,
                                      controller: custBusinessCartController,
                                    );
                                  case OfferingType.Rental:
                                    return RentalCartItemCard(
                                      index: index,
                                      item: item,
                                      controller: custBusinessCartController,
                                    );
                                  case OfferingType.Event:
                                    return EventCartItemCard(
                                      index: index,
                                      item: item,
                                      controller: custBusinessCartController,
                                    );
                                  case OfferingType.Service:
                                    return ServiceCartItemCard(
                                      index: index,
                                      item: item,
                                      controller: custBusinessCartController,
                                    );
                                  case OfferingType.Product:
                                    return ProductCartItemCard(
                                      index: index,
                                      item: item,
                                      controller: custBusinessCartController,
                                    );
                                }
                              },
                            ).toList(),
                          bigSeperator,
                          Text(
                            '${_i18n()['notes']}',
                            style: context.textTheme.bodyLarge,
                          ),
                          smallSepartor,
                          Material(
                            elevation: .5,
                            child: TextFormField(
                              maxLines: 5,
                              minLines: 3,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: '${_i18n()['writeNotesHere']}',
                              ),
                            ),
                          ),
                          bigSeperator,
                          MezCard(
                            elevation: .5,
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_i18n()['summary']}',
                                  style: context.textTheme.bodyLarge,
                                ),
                                smallSepartor,
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       '${_i18n()['orderCost']}',
                                //       style: context.textTheme.bodyMedium,
                                //     ),
                                //     Text(
                                //       "\$${custBusinessCartController.cart.value?.cost.toDouble().toStringAsFixed(0)}",
                                //       style: context.textTheme.bodyMedium,
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Discount',
                                      style: context.textTheme.bodyMedium,
                                    ),
                                    Text(
                                      "\$${custBusinessCartController.cart.value?.discountValue.toDouble().toStringAsFixed(0)}",
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${_i18n()['orderCost']}',
                                      style: context.textTheme.bodyMedium,
                                    ),
                                    Text(
                                      "\$${custBusinessCartController.cart.value!.cost.toDouble().toStringAsFixed(0)}",
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Final Cost',
                                      style: context.textTheme.bodyMedium,
                                    ),
                                    Text(
                                      "\$${custBusinessCartController.cart.value!.cost.toDouble() - custBusinessCartController.cart.value!.discountValue.toDouble()}",
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }

  Future<void> _alertTermsAndServices() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            actionsPadding: EdgeInsets.only(bottom: 20, left: 25, right: 25),
            insetPadding: EdgeInsets.all(15),
            title: Text(
              '${_i18n()['disclaimer']}',
              textAlign: TextAlign.center,
            ),
            content: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    text: '${_i18n()['disclaimerPartOneText']}',
                    style: TextStyle(fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                          text: '${_i18n()['disclaimerPartTwoText']}',
                          style: TextStyle(fontWeight: FontWeight.w400))
                    ])),
            actions: [
              MezButton(
                label: '${_i18n()['okay']}',
                backgroundColor: primaryBlueColor,
                onClick: () async => Navigator.pop(context),
              )
            ],
          );
        });
  }
}
