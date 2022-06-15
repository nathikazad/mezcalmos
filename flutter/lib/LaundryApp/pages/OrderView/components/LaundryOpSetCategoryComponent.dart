import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/SetWeightBottomSheet.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpSetCategoryComponent'];

class LaundyOpSetCategoryComponent extends StatelessWidget {
  LaundyOpSetCategoryComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();

  OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                "${_i18n()["itemsWeight"]}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _PricingTable(),
            if (order.isAtLaundry()) setItemsWeightButton(context),
          ],
        ),
      ),
    );
  }

// Set new items button
  Widget setItemsWeightButton(BuildContext context) {
    return InkWell(
        onTap: handleClick(context: context),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add_circle_outline,
                color: primaryBlueColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "${_i18n()["setNewItemsWeight"]}",
                style:
                    Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor),
              ),
            ],
          ),
        ));
  }

//----------------------------------// ------>>>> FUNCTIONS <<<<----------//--------------------------------//
// button click functions
  Function()? handleClick({required BuildContext context}) {
    if (order.isAtLaundry()) {
      return assignNewCategory(context: context);
    } else {
      return null;
    }
  }

// assign new items waight function
  Function()? assignNewCategory(
      {required BuildContext context,
      bool editMode = false,
      LaundryOrderCostLineItem? laundryOrderCostLineItem}) {
    return () {
      showModalBottomSheet(
          isDismissible: false,
          useRootNavigator: false,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
          context: context,
          builder: (BuildContext context) {
            return SetOrderWeightBottomSheet(
              order: order,
              editMode: editMode,
              oldItem: laundryOrderCostLineItem,
            );
          });
    };
  }

  // delete item
  void deleteItem(LaundryOrderCostLineItem item) {
    final LaundryOrderCosts? oldCosts = order.costsByType;
    if (oldCosts != null) {
      if (oldCosts.lineItems.length > 1) {
        oldCosts.lineItems.removeWhere(
            (LaundryOrderCostLineItem element) => element.name == item.name);
        orderController.setOrderWeight(order.orderId, oldCosts);
      } else {
        Get.snackbar(
          "${_i18n()["error"]}",
          "${_i18n()["deleteLast"]}",
          padding: EdgeInsets.all(16),
          backgroundColor: Colors.grey.shade800,
          colorText: Colors.white,
        );
      }
    }
  }

  Widget _PricingTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          dividerThickness: 0.01,
          horizontalMargin: 6,
          columnSpacing: 45.0,
          headingRowHeight: 30.0,
          showBottomBorder: false,
          columns: _PricingTableColumns(),
          rows: _PricingTableRows()),
    );
  }

  List<DataColumn> _PricingTableColumns() {
    return [
      DataColumn(
          label: Text(
        '${_i18n()["item"]}',
        textAlign: TextAlign.start,
      )),
      DataColumn(
          label: Center(
        child: Text(
          '${_i18n()["perKilo"]}',
          textAlign: TextAlign.center,
        ),
      )),
      DataColumn(
          label: Text(
        '${_i18n()["weight"]}',
        textAlign: TextAlign.start,
      )),
      DataColumn(
          label: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${_i18n()["cost"]}',
            ),
          ],
        ),
      ))
    ];
  }

  List<DataRow> _PricingTableRows() {
    return List.generate(
        order.costsByType?.lineItems.length ?? 0,
        (int index) => DataRow(cells: [
              DataCell(Container(
                width: 100,
                child: Text(
                  order.costsByType!.lineItems[index].getRightNameForUser(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataCell(Center(
                  child:
                      Text("\$${order.costsByType!.lineItems[index].cost}"))),
              DataCell(Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${order.costsByType!.lineItems[index].weight} "),
                  if (order.isAtLaundry())
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: (order.isAtLaundry())
                          ? assignNewCategory(
                              context: Get.context!,
                              editMode: true,
                              laundryOrderCostLineItem:
                                  order.costsByType?.lineItems[index])
                          : null,
                      child: Ink(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200),
                          child: Icon(
                            Icons.mode_edit_outline_outlined,
                            size: 18,
                            color: Colors.black,
                          )),
                    )
                ],
              )),
              DataCell(Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("\$${order.costsByType!.lineItems[index].weighedCost}"),
                ],
              )),
            ]));
  }
}
