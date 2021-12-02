import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

import 'components/buildInProcessOrders.dart';
import 'components/buildPastOrders.dart';

final f = new DateFormat('MM.dd.yyyy');
final currency = new NumberFormat("#,##0.00", "en_US");

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();
  LanguageController _lang = Get.find<LanguageController>();
  OrderController controller = Get.find<OrderController>();
  AuthController auth = Get.find<AuthController>();


  @override
  void dispose() {
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "ListOrdersScreen: build the length of past orders is ${controller.pastOrders.value.length} and the length of inprosses is ${controller.currentOrders.value.length}");
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text("List Orders"),
        // ),
        appBar: customerAppBar(
          AppBarLeftButtonType.Back,
          _popUpController,
          empty: true,
        ),
        body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Obx(() => buildInProcessOrders(controller.currentOrders())),
                SizedBox(height: 20),
                Obx(() => buildPastOrders(controller.pastOrders()))
              ],
            )));
  }
}
