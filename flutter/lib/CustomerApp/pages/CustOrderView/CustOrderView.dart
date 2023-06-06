import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/RentalCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustOrderView extends StatefulWidget {
  const CustOrderView({super.key});

  @override
  State<CustOrderView> createState() => _CustOrderViewState();

  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath(CustBusinessRoutes.custOrderViewRoute,
        arguments: {"orderId": orderId});
  }
}

class _CustOrderViewState extends State<CustOrderView> {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();

  late int orderId;

  @override
  void initState() {
    orderId = MezRouter.bodyArguments!["orderId"] as int;
    custBusinessCartController.setCurrentOrderInView(orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "Order",
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: (custBusinessCartController.currentOrderInView.value == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MezCard(
                        content: Text(
                          custBusinessCartController
                              .currentOrderInView.value!.status!.name,
                        ),
                      ),
                      if (custBusinessCartController
                          .currentOrderInView.value!.items.isNotEmpty)
                        ...custBusinessCartController
                            .currentOrderInView.value!.items
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
                                  controller: custBusinessCartController,
                                  isEditable: false,
                                );
                              case OfferingType.Event:
                                return RentalCartItemCard(
                                  index: index,
                                  item: item,
                                  controller: custBusinessCartController,
                                  isEditable: false,
                                );
                              case OfferingType.Service:
                                return RentalCartItemCard(
                                  index: index,
                                  item: item,
                                  controller: custBusinessCartController,
                                  isEditable: false,
                                );
                              case OfferingType.Product:
                                return RentalCartItemCard(
                                  index: index,
                                  item: item,
                                  controller: custBusinessCartController,
                                  isEditable: false,
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
                                  "\$${custBusinessCartController.currentOrderInView.value?.cost.toDouble().toStringAsFixed(0)}",
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
