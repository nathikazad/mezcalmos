import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/OldOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/OngoingOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

import 'components/OngoingOrderCard.dart';
import 'components/TaxiOrderOngoingCard.dart';

final f = new DateFormat('MM.dd.yyyy');
final currency = new NumberFormat("#,##0.00", "en_US");

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  LanguageController _lang = Get.find<LanguageController>();
  OrderController controller = Get.put(OrderController());

  LanguageController lang = Get.find<LanguageController>();

  AuthController auth = Get.find<AuthController>();

  @override
  initState() {
    mezDbgPrint("ListOrdersScreen: onInit");

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        title: '${lang.strings["customer"]["orders"]["title"]}',
        autoBack: true,
      ),
      body: Obx(
        () => Get.find<AuthController>().user != null
            ? SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              '${lang.strings["customer"]["orders"]["onGoingOrders"]}',
                              style: txt.headline3,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => Column(
                              children: List.generate(
                                  controller.currentOrders().length,
                                  (index) => (controller
                                              .currentOrders()[index]
                                              .orderType ==
                                          OrderType.Restaurant)
                                      ? OngoingOrderCard(
                                          order:
                                              controller.currentOrders()[index])
                                      : TaxiOngoingOrderCard(
                                          order: controller
                                              .currentOrders()[index])),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'Past orders',
                                style: txt.headline3,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: List.generate(
                                  controller.pastOrders().length,
                                  (index) => OldOrderCard(
                                      order: controller.pastOrders()[index])),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
            : Container(
                child: Text("nothing"),
              ),
      ),
    );
  }
}
