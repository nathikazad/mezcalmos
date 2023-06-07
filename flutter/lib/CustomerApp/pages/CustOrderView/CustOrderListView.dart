import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderView/CustOrderView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustOrderListView extends StatefulWidget {
  const CustOrderListView({super.key});

  @override
  State<CustOrderListView> createState() => _CustOrderListViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(CustBusinessRoutes.custOrderListRoute);
  }
}

class _CustOrderListViewState extends State<CustOrderListView> {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "Previous Order",
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: (custBusinessCartController.previousOrders.value == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (custBusinessCartController
                          .previousOrders.value!.isNotEmpty)
                        ...custBusinessCartController.previousOrders.value!
                            .asMap()
                            .entries
                            .map(
                          (data) {
                            final int index = data.key;
                            final CustBusinessCart item = data.value;
                            return MezCard(
                              onClick: () async {
                                await CustOrderView.navigate(
                                  orderId: item.id!,
                                );
                              },
                              content: Text(
                                "Order ${index + 1} Id: ${item.id}",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            );
                          },
                        ).toList(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
