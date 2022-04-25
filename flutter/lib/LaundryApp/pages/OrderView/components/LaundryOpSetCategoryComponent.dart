import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOrderWeightSelector.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpSetCategoryComponent'];

class LaundyOpSetCategoryComponent extends StatelessWidget {
  LaundyOpSetCategoryComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  OrderController orderController = Get.find<OrderController>();
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  Rxn<LaundryCostLineItem?> newCategory = Rxn();
  RxList<LaundryCostLineItem> laundryCategories = RxList.empty();
  TextEditingController itemsWeightController = TextEditingController();
  RxBool isClicked = RxBool(false);
  // RxBool deleteBtnClicked = RxBool(false);
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
            backgroundColor: !order.isAtLaundry() ? Colors.grey : keyAppColor),
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
                              .copyWith(color: keyAppColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text("${laundryOrderCostLineItem.weight} KG",
                            style: Theme.of(context).textTheme.subtitle1),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isDismissible: false,
                              useRootNavigator: false,
                              isScrollControlled: true,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                              context: context,
                              builder: (BuildContext context) {
                                return _setItemWeightBottomSheet(
                                    context: context,
                                    editMode: true,
                                    laundryOrderCostLineItem:
                                        laundryOrderCostLineItem);
                              });
                        },
                        icon: Icon(Icons.edit),
                        iconSize: 20,
                        splashRadius: 25,
                        padding: EdgeInsets.all(5),
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () {
                          deleteItem(laundryOrderCostLineItem);
                        },
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

// List of widgets inside the bottom sheet when clicking the add new items
  Widget _setItemWeightBottomSheet(
      {required BuildContext context,
      bool editMode = false,
      LaundryOrderCostLineItem? laundryOrderCostLineItem}) {
    if (editMode && laundryOrderCostLineItem != null) {
      newCategory.value = laundryOrderCostLineItem;
      itemsWeightController.text = laundryOrderCostLineItem.weight.toString();
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8),
              child: Text(
                (editMode && laundryOrderCostLineItem != null)
                    ? laundryOrderCostLineItem.name[userLanguage]!
                    : "${_i18n()["newItemsWeight"]}",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Divider(),
          Text("${_i18n()["itemsCategory"]}"),
          //    Category selector
          LaundryOrderWeightSelector(
            newCategory: newCategory,
          ),

          SizedBox(
            height: 15,
          ),
          Text("${_i18n()["itemsWeight"]}"),
          TextFormField(
            controller: itemsWeightController,
            style: Theme.of(context).textTheme.bodyText1,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
            ],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? v) {
              if (num.tryParse(v!) == null) {
                return "${_i18n()["itemsWeightErrorText"]}";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                suffixText: "KG",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                alignLabelWithHint: false,
                fillColor: Colors.white,
                filled: true),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => TextButton(
                onPressed: isClicked.value
                    ? null
                    : () {
                        (editMode && laundryOrderCostLineItem != null)
                            ? editItemsWeight(oldItem: laundryOrderCostLineItem)
                            : saveItemsWeight();
                      },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: (isClicked.value)
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text((editMode)
                          ? "Edit items "
                          : "${_i18n()["saveItemsWeight"]}"),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Get.back();
                disposeBottomSheet();
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Text("${_i18n()["cancel"]}"),
              )),
        ],
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
            return _setItemWeightBottomSheet(
                context: context, editMode: editMode);
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

// edit items

  void editItemsWeight({
    required LaundryOrderCostLineItem oldItem,
  }) {
    isClicked.value = true;

    final LanguageType primaryLangauge =
        laundryInfoController.laundry.value!.primaryLanguage;
    if (newCategory.value == null) {
      Get.snackbar(
        "${_i18n()["error"]}",
        "${_i18n()["categoryError"]}",
        padding: EdgeInsets.all(16),
        backgroundColor: Colors.grey.shade800,
        colorText: Colors.white,
      );
      isClicked.value = false;
    } else if (num.tryParse(itemsWeightController.text) == null) {
      Get.snackbar(
        "${_i18n()["error"]}",
        "${_i18n()["itemsWeightError"]}",
        padding: EdgeInsets.all(16),
        backgroundColor: Colors.grey.shade800,
        colorText: Colors.white,
      );
      isClicked.value = false;
    } else {
      final LaundryOrderCostLineItem newCostLineItem = LaundryOrderCostLineItem(
          weight: num.parse(itemsWeightController.text),
          name: newCategory.value!.name,
          cost: newCategory.value!.cost);
      LaundryOrderCosts? oldCosts = order.costsByType;
      if (oldCosts != null) {
        oldCosts.lineItems.removeWhere((LaundryOrderCostLineItem element) =>
            element.name[primaryLangauge] == oldItem.name[primaryLangauge]);
        oldCosts.lineItems.add(newCostLineItem);
      } else {
        oldCosts = LaundryOrderCosts();
        oldCosts.lineItems.add(newCostLineItem);
      }

      orderController
          .setOrderWeight(order.orderId, oldCosts)
          .then((ServerResponse value) {
        mezDbgPrint("Done");
        Get.back();
        disposeBottomSheet();
      }).whenComplete(() {
        return isClicked.value = false;
      });
    }
  }

// when click save button

  void saveItemsWeight() {
    isClicked.value = true;
    final LanguageType primaryLangauge =
        laundryInfoController.laundry.value!.primaryLanguage;
    if (newCategory.value == null) {
      Get.snackbar(
        "${_i18n()["error"]}",
        "${_i18n()["categoryError"]}",
        padding: EdgeInsets.all(16),
        backgroundColor: Colors.grey.shade800,
        colorText: Colors.white,
      );
      isClicked.value = false;
    } else if (num.tryParse(itemsWeightController.text) == null) {
      Get.snackbar(
        "${_i18n()["error"]}",
        "${_i18n()["itemsWeightError"]}",
        padding: EdgeInsets.all(16),
        backgroundColor: Colors.grey.shade800,
        colorText: Colors.white,
      );
      isClicked.value = false;
    } else {
      // final LaundryOrderCosts laundryCosts = LaundryOrderCosts();
      final LaundryOrderCostLineItem newCostLineItem = LaundryOrderCostLineItem(
          weight: num.parse(itemsWeightController.text),
          name: newCategory.value!.name,
          cost: newCategory.value!.cost);

      final LaundryOrderCostLineItem? _tempCatgeory = order
          .costsByType?.lineItems
          .firstWhereOrNull((LaundryOrderCostLineItem element) =>
              element.name[primaryLangauge] ==
              newCostLineItem.name[primaryLangauge]);
      if (_tempCatgeory != null) {
        isClicked.value = false;
        Get.snackbar(
          "${_i18n()["error"]}",
          "${_i18n()["categoryExistError"]}",
          padding: EdgeInsets.all(16),
          backgroundColor: Colors.grey.shade800,
          colorText: Colors.white,
        );
      } else {
        LaundryOrderCosts? oldCosts = order.costsByType;
        if (oldCosts != null) {
          oldCosts.lineItems.add(newCostLineItem);
        } else {
          oldCosts = LaundryOrderCosts();
          oldCosts.lineItems.add(newCostLineItem);
        }

        orderController
            .setOrderWeight(order.orderId, oldCosts)
            .then((ServerResponse value) {
          mezDbgPrint("Done");

          Get.back();
          disposeBottomSheet();
        }).whenComplete(() => isClicked.value = false);
      }
      //   laundryCategories.add(newCategory.value!);

    }
  }

// dispose values of items category and items weight after closing bottom sheet
  void disposeBottomSheet() {
    newCategory.value = null;
    itemsWeightController.clear();
  }
}
