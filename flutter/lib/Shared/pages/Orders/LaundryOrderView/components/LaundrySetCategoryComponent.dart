import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/Orders/LaundryOrderView/components/SetWeightBottomSheet.dart';
import 'package:mezcalmos/Shared/pages/Orders/LaundryOrderView/controllers/LaundryOrderViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpSetCategoryComponent'];

class LaundrySetCategoryComponent extends StatefulWidget {
  const LaundrySetCategoryComponent({Key? key, required this.viewController})
      : super(
          key: key,
        );
  final LaundryOrderViewController viewController;

  @override
  State<LaundrySetCategoryComponent> createState() =>
      _LaundrySetCategoryComponentState();
}

class _LaundrySetCategoryComponentState
    extends State<LaundrySetCategoryComponent> {
  final Language userLanguage = Get.find<LanguageController>().userLanguageKey;

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
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
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
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (widget.viewController.order.costsByType?.lineItems.isNotEmpty ??
                false)
              Column(
                children: [
                  Column(
                    children: List.generate(
                        widget.viewController.order.costsByType?.lineItems
                                .length ??
                            0, (int index) {
                      return _itemRowCard(
                          item: widget.viewController.order.costsByType!
                              .lineItems[index]);
                    }),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_i18n()["total"]}',
                          style: context.txt.bodyLarge,
                        ),
                        Text(
                          widget.viewController.order.costsByType!.weighedCost
                              .toPriceString(),
                          style: context.txt.bodyLarge,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            if (widget.viewController.order.isAtLaundry())
              setItemsWeightButton(context),
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
                style: context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
              ),
            ],
          ),
        ));
  }

//----------------------------------// ------>>>> FUNCTIONS <<<<----------//--------------------------------//
  Function()? handleClick({required BuildContext context}) {
    if (widget.viewController.order.isAtLaundry()) {
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
      if (editMode && laundryOrderCostLineItem != null) {
        widget.viewController
            .editCategory(categoryId: laundryOrderCostLineItem.id);
      }
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
              viewController: widget.viewController,
            );
          }).whenComplete(() {
        if (editMode) {
          widget.viewController.closeEditMode();
        }
      });
    };
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
              style: context.txt.bodyMedium,
            ),
          ),
          Text(
            "\$${item.cost} x ${item.weight}KG = \$${item.weighedCost.round()}",
          ),
          if (widget.viewController.order.isAtLaundry())
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
