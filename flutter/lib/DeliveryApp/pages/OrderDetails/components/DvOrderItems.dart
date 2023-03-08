import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/controllers/DvOrderDetailsViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezExpandableCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["OrderDetailsScreen"];

class DvOrderItems extends StatelessWidget {
  const DvOrderItems({super.key, required this.viewController});
  final DvOrderDetailsViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (viewController.items.value != null)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${_i18n()['orderItems']}",
                  style: Get.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                    children: List.generate(
                        viewController.items.value!.length,
                        (int index) => MezExpandableCard(
                                title: _itemHeader(index, context),
                                imageUrl:
                                    viewController.items.value![index].image,
                                expandableWidget: [
                                  Text(
                                    "${_i18n()['estCost']}",
                                    style: Get.textTheme.bodyLarge,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      "${viewController.items.value![index].estCost?.toPriceString() ?? "_"}"),
                                  Divider(),
                                  if (viewController.items.value![index].notes
                                          ?.isNotEmpty ==
                                      true)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_i18n()['note']}",
                                          style: Get.textTheme.bodyLarge,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                            "${viewController.items.value![index].notes}"),
                                        Divider(),
                                      ],
                                    ),
                                  MezButton(
                                    label: (viewController
                                            .items.value![index].unavailable)
                                        ? "${_i18n()['markAv']}"
                                        : "${_i18n()['markUnav']}",
                                    backgroundColor: (!viewController
                                            .items.value![index].unavailable)
                                        ? offRedColor
                                        : secondaryLightBlueColor,
                                    textColor: (!viewController
                                            .items.value![index].unavailable)
                                        ? Colors.red
                                        : primaryBlueColor,
                                    onClick: () async {
                                      await viewController.markItemAvailable(
                                          itemId: viewController
                                              .items.value![index].id,
                                          isAvailable: !viewController
                                              .items.value![index].unavailable);
                                    },
                                  ),
                                ]))),
              ],
            )
          : SizedBox(),
    );
  }

  Flexible _itemHeader(int index, BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            viewController.items.value![index].name,
            style: Get.textTheme.bodyLarge?.copyWith(
                color: viewController.items.value![index].unavailable
                    ? Colors.grey
                    : null,
                decoration: viewController.items.value![index].unavailable
                    ? TextDecoration.lineThrough
                    : null),
          ),
          (viewController.items.value![index].actualCost == null &&
                  !viewController.items.value![index].unavailable)
              ? MezButton(
                  label: "${_i18n()['addCost']}",
                  height: 30,
                  width: 90,
                  borderRadius: 5,
                  onClick: () async {
                    await _showCostSheet(context, index);
                  },
                )
              : Container(
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        "${viewController.items.value![index].actualCost!.toPriceString(rounded: false)}",
                        style: Get.textTheme.bodyLarge?.copyWith(
                            color:
                                viewController.items.value![index].unavailable
                                    ? Colors.grey
                                    : null,
                            decoration:
                                viewController.items.value![index].unavailable
                                    ? TextDecoration.lineThrough
                                    : null),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (!viewController.items.value![index].unavailable)
                        MezIconButton(
                            iconSize: 18,
                            padding: EdgeInsets.all(3),
                            onTap: () async {
                              viewController.costText.text = viewController
                                  .items.value![index].actualCost
                                  .toString();
                              await _showCostSheet(context, index);
                            },
                            icon: Icons.edit)
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Future<dynamic> _showCostSheet(BuildContext context, int index) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        viewController.items.value![index].name,
                        style: Get.textTheme.bodyLarge,
                      ),
                    ),
                    Divider(
                      height: 15,
                    ),
                    Text(
                      "${_i18n()['actualCost']}",
                      style: Get.textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: viewController.costText,
                      style: Get.textTheme.bodyLarge,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.attach_money_rounded),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: MezButton(
                            height: 45,
                            label: "${_i18n()['cancel']}",
                            backgroundColor: offRedColor,
                            textColor: Colors.red,
                            onClick: () async {
                              MezRouter.popDialog();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: MezButton(
                            height: 45,
                            label: "${_i18n()['save']}",
                            onClick: () async {
                              await viewController.saveCost(
                                  itemId: viewController.items.value![index].id,
                                  index: index);
                              MezRouter.popDialog();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )),
          );
        });
  }
}
