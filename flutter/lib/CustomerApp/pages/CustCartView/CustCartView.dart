import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/RentalCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustCartView extends StatefulWidget {
  const CustCartView({super.key});

  @override
  State<CustCartView> createState() => _CustCartViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(CustBusinessRoutes.custCartRoute);
  }
}

class _CustCartViewState extends State<CustCartView> {
  final CustCartViewController viewController = CustCartViewController();
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
        title: "My Cart",
      ),
      bottomNavigationBar: MezButton(
        label: "Request",
        withGradient: true,
        borderRadius: 0,
        onClick: () async {},
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: (custBusinessCartController.cart.value == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (custBusinessCartController
                          .cart.value!.items.isNotEmpty)
                        ...custBusinessCartController.cart.value!.items
                            .asMap()
                            .entries
                            .map(
                          (data) {
                            final int index = data.key;
                            final BusinessCartItem item = data.value;
                            switch (item.offeringType) {
                              case OfferingType.Rental:
                                return RentalCartItemCard(
                                  index: index,
                                  item: item,
                                );
                              case OfferingType.Event:
                                return RentalCartItemCard(
                                  index: index,
                                  item: item,
                                );
                              case OfferingType.Service:
                                return RentalCartItemCard(
                                  index: index,
                                  item: item,
                                );
                              case OfferingType.Product:
                                return RentalCartItemCard(
                                  index: index,
                                  item: item,
                                );
                            }
                          },
                        ).toList(),
                      bigSeperator,
                      Text(
                        "Notes",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      TextFormField(
                        maxLines: 5,
                        minLines: 3,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "Write your notes here.",
                        ),
                      ),
                      bigSeperator,
                      MezCard(
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Summary",
                              style: context.textTheme.bodyLarge,
                            ),
                            smallSepartor,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order cost",
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  "\$${custBusinessCartController.cart.value?.cost.toDouble().toStringAsFixed(0)}",
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
}
