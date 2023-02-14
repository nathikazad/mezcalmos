import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/components/CustomerInprocessOrdersList.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/components/CustomerPastOrdersList.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/controllers/CustomerOrdersListViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class CustomerOrdersListView extends StatefulWidget {
  const CustomerOrdersListView({Key? key}) : super(key: key);

  @override
  _CustomerOrdersListView createState() => _CustomerOrdersListView();
}

class _CustomerOrdersListView extends State<CustomerOrdersListView> {
  CustomerOrdersListViewController viewController =
      CustomerOrdersListViewController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        title: '${_i18n()["title"]}',
        showPastOrders: false,
        autoBack: true,
      ),
      body: Obx(
        () => viewController.hasOrders
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (viewController.currentOrders.isNotEmpty)
                      CustomerInprocessOrdersList(
                          txt: txt, viewController: viewController),
                    if (viewController.pastOrders.isNotEmpty)
                      CustomerPastOrdersList(
                          txt: txt, viewController: viewController),
                  ],
                ),
              )
            : _noOrdersWidget(),
      ),
    );
  }

  Widget _noOrdersWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.center,
          height: 40.h,
          width: double.infinity,
          child: Image.asset(
            "assets/images/customer/customerNoOrders.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "${_i18n()["orders"]["noOrders"]}",
          style: Get.textTheme.displaySmall,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "${_i18n()["orders"]["noOrdersBody"]}",
            style: Get.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
