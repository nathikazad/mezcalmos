import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOrderWeightSelector.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpSetCategoryComponent'];

class LaundyOpSetCategoryComponent extends StatelessWidget {
  LaundyOpSetCategoryComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  Rxn<LaundryCostLineItem?> newCategory = Rxn();
  RxList<LaundryCostLineItem> laundryCategories = RxList.empty();
  TextEditingController itemsWeightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        setItemsWeightButton(context),
        SizedBox(
          height: 15,
        ),
        Obx(
          () => Column(
            children: List.generate(
                laundryCategories.length,
                (int index) => _itemsWeightCard(
                    laundryCostLineItem: laundryCategories[index],
                    context: context)),
          ),
        )
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
      {required LaundryCostLineItem laundryCostLineItem,
      required BuildContext context}) {
    return Card(
        child: Container(
      margin: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            laundryCostLineItem.name[userLanguage] ?? "",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "\$${laundryCostLineItem.cost}",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: keyAppColor),
          ),
        ],
      ),
    ));
  }

// List of widgets inside the bottom sheet when clicking the add new items
  Widget _setItemWeightBottomSheet(BuildContext context) {
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
                "${_i18n()["newItemsWeight"]}",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Divider(),
          Text("${_i18n()["itemsCategory"]}"),
          // Category selector
          LaundryOrderWeightSelector(
            newCategory: newCategory,
          ),
          //
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
          TextButton(
              onPressed: () {
                saveItemsWeight();
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Text("${_i18n()["saveItemsWeight"]}"),
              )),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                disposeBottomSheet();
                Get.back();
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
    if (!order.isAtLaundry()) {
      return assignNewCategory(context);
    } else {}
    return null;
  }

// assign new items waight function
  Function()? assignNewCategory(context) {
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
            return _setItemWeightBottomSheet(context);
          });
    };
  }

// when click save button
  void saveItemsWeight() {
    if (newCategory.value == null) {
      Get.snackbar("${_i18n()["error"]}", "${_i18n()["categoryError"]}");
    } else if (num.tryParse(itemsWeightController.text) == null) {
      Get.snackbar("${_i18n()["error"]}", "${_i18n()["itemsWeightError"]}");
    } else {
      laundryCategories.add(newCategory.value!);
      Get.back();
      disposeBottomSheet();
    }
  }

// dispose values of items category and items weight after closing bottom sheet
  void disposeBottomSheet() {
    newCategory.value = null;
    itemsWeightController.clear();
  }
}
