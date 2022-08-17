import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/SetWeightBottomSheet.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpSetCategoryComponent'];

class LaundyOpSetCategoryComponent extends StatefulWidget {
  const LaundyOpSetCategoryComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  State<LaundyOpSetCategoryComponent> createState() =>
      _LaundyOpSetCategoryComponentState();
}

class _LaundyOpSetCategoryComponentState
    extends State<LaundyOpSetCategoryComponent> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  late OpLaundryInfoController laundryInfoController;

  OrderController orderController = Get.find<OrderController>();
  @override
  void initState() {
    Get.put(OpLaundryInfoController(), permanent: false);
    laundryInfoController = Get.find<OpLaundryInfoController>();

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<OpLaundryInfoController>(force: true);
    super.dispose();
  }

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
              //  padding: const EdgeInsets.all(5),
              child: Text(
                "${_i18n()["itemsWeight"]}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (widget.order.costsByType?.lineItems.isNotEmpty ?? false)
              Column(
                children: [
                  Column(
                    children: List.generate(
                        widget.order.costsByType?.lineItems.length ?? 0,
                        (int index) {
                      return _itemRowCard(
                          item: widget.order.costsByType!.lineItems[index]);
                    }),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_i18n()["total"]}',
                          style: Get.textTheme.bodyText1,
                        ),
                        Text(
                          widget.order.costsByType!.weighedCost.toPriceString(),
                          style: Get.textTheme.bodyText1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            if (widget.order.isAtLaundry()) setItemsWeightButton(context),
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
  Function()? handleClick({required BuildContext context}) {
    if (widget.order.isAtLaundry()) {
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
          useRootNavigator: true,
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
              order: widget.order,
              editMode: editMode,
              oldItem: laundryOrderCostLineItem,
            );
          });
    };
  }

  // delete item
  void deleteItem(LaundryOrderCostLineItem item) {
    final LaundryOrderCosts? oldCosts = widget.order.costsByType;
    if (oldCosts != null) {
      if (oldCosts.lineItems.length > 1) {
        oldCosts.lineItems.removeWhere(
            (LaundryOrderCostLineItem element) => element.name == item.name);
        orderController.setOrderWeight(widget.order.orderId, oldCosts);
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

  Widget _itemRowCard({required LaundryOrderCostLineItem item}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              item.name[userLanguage] ?? "",
              maxLines: 1,
              style: Get.textTheme.bodyText2,
            ),
          ),
          Text(
            "\$${item.cost.round()} x ${item.weight}KG = \$${item.weighedCost.round()}",
          ),
          if (widget.order.isAtLaundry())
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                onTap: assignNewCategory(
                    context: context,
                    laundryOrderCostLineItem: item,
                    editMode: true),
                customBorder: CircleBorder(),
                child: Ink(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300, shape: BoxShape.circle),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.grey.shade600,
                    )),
              ),
            ),
        ],
      ),
    );
  }
}
