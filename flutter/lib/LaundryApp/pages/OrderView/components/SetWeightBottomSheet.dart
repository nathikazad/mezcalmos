import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOrderWeightSelector.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/controllers/LaundryOpOrderViewController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpSetCategoryComponent'];

class SetOrderWeightBottomSheet extends StatefulWidget {
  const SetOrderWeightBottomSheet({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final LaundryOpOrderViewController viewController;

  @override
  State<SetOrderWeightBottomSheet> createState() =>
      _SetOrderWeightBottomSheetState();
}

class _SetOrderWeightBottomSheetState extends State<SetOrderWeightBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                  (widget.viewController.isEditingCategory)
                      ? widget.viewController.editableCategory.value!
                          .name[userLanguage]!
                      : "${_i18n()["newItemsWeight"]}",
                  style: Theme.of(context).textTheme.displaySmall,
                  maxLines: 2,
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${_i18n()["itemsCategory"]}",
                  style: Get.textTheme.bodyLarge,
                ),
                Spacer(),
                if (widget.viewController.isEditingCategory)
                  InkWell(
                    onTap: () {
                      showConfirmationDialog(context,
                          primaryButtonText: "${_i18n()["deleteTitle"]}",
                          helperText: "${_i18n()["deleteBody"]}",
                          title: "${_i18n()["deleteItem"]}",
                          onYesClick: () async {
                        mezDbgPrint("tapped");

                        await widget.viewController
                            .deleteCategory()
                            .then((int? value) {
                          if (value != null) {
                            MezRouter.untill((Route route) =>
                                route.settings.name ==
                                LaundryAppRoutes.getLaundryOpOrderRoute(
                                    widget.viewController.order.orderId));
                          }
                        });
                      });
                    },
                    child: Ink(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                          ),
                          Text(
                            "${_i18n()["deleteItem"]}",
                            style: Get.textTheme.bodyMedium?.copyWith(
                                color: Colors.red, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            LaundryOrderWeightSelector(
              viewController: widget.viewController,
            ),
            SizedBox(
              height: 25,
            ),
            Text("${_i18n()["itemsWeight"]}", style: Get.textTheme.bodyLarge),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: widget.viewController.itemsWeightController,
              style: Theme.of(context).textTheme.bodyLarge,
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
                  isDense: true,
                  suffix: Container(
                      padding: const EdgeInsets.all(1), child: Text("KG")),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  alignLabelWithHint: false,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)),
                  fillColor: Colors.grey.shade200,
                  filled: true),
            ),
            SizedBox(
              height: 25,
            ),
            MezButton(
              label: (widget.viewController.isEditingCategory)
                  ? "${_i18n()["editItemsWeight"]} "
                  : "${_i18n()["saveItemsWeight"]}",
              onClick: () async {
                await widget.viewController.saveItemsWeight();
              },
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  MezRouter.back();
                },
                child: Ink(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFFF9D8D6),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(5),
                  child: Center(
                      child: Text(
                    "${_i18n()["cancel"]}",
                    style: Get.textTheme.bodyLarge?.copyWith(color: Colors.red),
                  )),
                )),
          ],
        ),
      );
    });
  }

  Future<void> deleteItem(LaundryOrderCostLineItem item) async {}
}
