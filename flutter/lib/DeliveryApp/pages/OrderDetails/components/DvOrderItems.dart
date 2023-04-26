import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/controllers/DvOrderDetailsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezExpandableCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';

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
                  style: context.txt.bodyLarge,
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                    children: List.generate(
                        viewController.items.value!.length,
                        (int index) => MezExpandableCard(
                                onTapHeaderImage: () async {
                                  unawaited(showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.zero,
                                          content: Container(
                                            width: 70.w,
                                            height: 60.h,
                                            child: PhotoView(
                                              imageProvider:
                                                  CachedNetworkImageProvider(
                                                viewController
                                                    .items.value![index].image!,
                                                //  style: context.txt.titleSmall,
                                              ),
                                            ),
                                          ),
                                        );
                                      }));
                                },
                                title: _itemHeader(index, context),
                                imageUrl:
                                    viewController.items.value![index].image,
                                expandableWidget: [
                                  Text(
                                    "${_i18n()['estCost']}",
                                    style: context.txt.bodyLarge,
                                  ),
                                  Text(
                                      "${viewController.items.value![index].estCost?.toPriceString() ?? "_"}"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  if (viewController.items.value![index].notes
                                          ?.isNotEmpty ==
                                      true)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(),
                                        Text(
                                          "${_i18n()['note']}",
                                          style: context.txt.bodyLarge,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                            "${viewController.items.value![index].notes}"),
                                        Divider(),
                                      ],
                                    ),
                                  if (viewController
                                              .order.value?.isDriverAssigned ==
                                          true &&
                                      viewController.order.value?.inProcess() ==
                                          true)
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
                                            isAvailable: !viewController.items
                                                .value![index].unavailable);
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
            style: context.txt.bodyLarge?.copyWith(
                color: viewController.items.value![index].unavailable
                    ? Colors.grey
                    : null,
                decoration: viewController.items.value![index].unavailable
                    ? TextDecoration.lineThrough
                    : null),
          ),
          (viewController.items.value![index].actualCost == null &&
                  !viewController.items.value![index].unavailable &&
                  viewController.order.value?.isDriverAssigned == true)
              ? InkWell(
                  onTap: () async => _showCostSheet(context, index),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.sp),
                    child: Text(
                      '${_i18n()['addCost']}',
                      style: context.txt.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                  ))
              : Container(
                  margin: const EdgeInsets.only(right: 5, bottom: 5, top: 5),
                  child: Row(
                    children: [
                      Text(
                        "${viewController.items.value![index].actualCost?.toPriceString(rounded: false) ?? ""}",
                        style: context.txt.bodyLarge?.copyWith(
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
                      if (!viewController.items.value![index].unavailable &&
                          viewController.order.value?.isDriverAssigned ==
                              true &&
                          viewController.order.value?.inProcess() == true)
                        MezIconButton(
                            elevation: 0,
                            backgroundColor: backgroundShadeColor,
                            iconColor: offShadeGreyColor,
                            iconSize: 18,
                            padding: EdgeInsets.all(3),
                            onTap: () async {
                              viewController.costText.text = viewController
                                  .items.value![index].actualCost
                                  .toString();
                              await _showCostSheet(context, index);
                            },
                            icon: Icons.edit_outlined)
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Future<dynamic> _showCostSheet(BuildContext context, int index) {
    viewController.costText.text = '';
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
                        style: context.txt.bodyLarge,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${_i18n()['actualCost']}",
                      style: context.txt.bodyLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: viewController.costText,
                      style: context.txt.bodyLarge,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.attach_money_rounded,
                          color: Colors.black,
                        ),
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
                              await MezRouter.back();
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
                              await MezRouter.back();
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
