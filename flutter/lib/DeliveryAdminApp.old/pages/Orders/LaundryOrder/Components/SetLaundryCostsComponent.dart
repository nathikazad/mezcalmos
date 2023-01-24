import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/LaundryOrder/Components/OderCategoryBottomModal.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpSetCategoryComponent'];

class SetLaundryOrderCostComponent extends StatelessWidget {
  SetLaundryOrderCostComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  LaundryOrderController orderController = Get.find<LaundryOrderController>();

  // identifier for orderitemswrightCard to place the loading animatin on specefic items weight card when deleting
  RxnInt itemId = RxnInt();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        setItemsWeightButton(context),
        SizedBox(
          height: 15,
        ),
        Column(
          children: List.generate(
              order.costsByType?.lineItems.length ?? 0,
              (int index) => _itemsWeightCard(
                  laundryOrderCostLineItem: order.costsByType!.lineItems[index],
                  context: context)),
        ),
      ],
    );
  }

// Set new items button
  Widget setItemsWeightButton(BuildContext context) {
    return TextButton(
        onPressed: handleClick(context: context),
        style: TextButton.styleFrom(
            backgroundColor:
                !order.isAtLaundry() ? Colors.grey : primaryBlueColor),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text("${_i18n()["setNewItemsWeight"]}"),
        ));
  }

// cards to show item weight after being added
  Widget _itemsWeightCard(
      {required LaundryOrderCostLineItem laundryOrderCostLineItem,
      required BuildContext context}) {
    return Obx(
      () => Card(
        child: Container(
            margin: EdgeInsets.all((5)),
            alignment: Alignment.center,
            child: (itemId.value == laundryOrderCostLineItem.hashCode)
                ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          laundryOrderCostLineItem.name[userLanguage] ?? "",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "\$${laundryOrderCostLineItem.cost}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: primaryBlueColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text("${laundryOrderCostLineItem.weight} KG",
                            style: Theme.of(context).textTheme.subtitle1),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: (order.isAtLaundry())
                            ? () {
                                showModalBottomSheet(
                                    isDismissible: false,
                                    useRootNavigator: false,
                                    isScrollControlled: true,
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    )),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return OrderCategoryBottomModal(
                                        editMode: true,
                                        oldItem: laundryOrderCostLineItem,
                                        order: order,
                                      );
                                    });
                              }
                            : null,
                        icon: Icon(Icons.edit),
                        iconSize: 20,
                        splashRadius: 25,
                        padding: EdgeInsets.all(5),
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: (order.isAtLaundry())
                            ? () {
                                deleteItem(laundryOrderCostLineItem);
                              }
                            : null,
                        icon: Icon(Ionicons.trash),
                        iconSize: 20,
                        splashRadius: 25,
                        color: Colors.red,
                        splashColor: Colors.red.withOpacity(0.3),
                      ),
                    ],
                  )),
      ),
    );
  }

//----------------------------------// ------>>>> FUNCTIONS <<<<----------//--------------------------------//
// button click functions
  Function()? handleClick({required BuildContext context}) {
    if (order.isAtLaundry()) {
      return assignNewCategory(context: context);
    } else {}
    return null;
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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
          context: context,
          builder: (BuildContext context) {
            return OrderCategoryBottomModal(
              order: order,
            );
          });
    };
  }

  // delete item
  void deleteItem(LaundryOrderCostLineItem item) {
    final LaundryOrderCosts? oldCosts = order.costsByType;
    if (oldCosts != null) {
      if (oldCosts.lineItems.length > 1) {
        itemId.value = item.hashCode;
        oldCosts.lineItems.removeWhere(
            (LaundryOrderCostLineItem element) => element.name == item.name);
        orderController
            .setOrderWeight(order.orderId, oldCosts)
            .whenComplete(() => itemId.value = null);
      } else {
        Get.snackbar(
          "${_i18n()["error"]}",
          "Every laundry order must have at least one oder items weight",
          padding: EdgeInsets.all(16),
          backgroundColor: Colors.grey.shade800,
          colorText: Colors.white,
        );
      }
    }
  }
}
