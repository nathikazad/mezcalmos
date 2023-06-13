import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustIconButton.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/CartItemImage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class ProductCartItemCard extends StatelessWidget {
  const ProductCartItemCard({
    super.key,
    required this.index,
    required this.item,
    required this.controller,
    this.isEditable = true,
  });

  final int index;
  final BusinessCartItem item;
  final CustBusinessCartController controller;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Item ${index + 1}",
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            isEditable
                ? InkWell(
                    onTap: () async {
                      await controller.deleteCartItem(item.id!.toInt());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Text(
                          "Remove",
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        Stack(
          children: [
            MezCard(
              contentPadding: const EdgeInsets.only(top: 6, bottom: 6),
              content: Row(
                children: [
                  CartItemImage(
                    image: item.product!.details.image?.first,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${item.product!.details.name.getTranslation(userLanguage)!.inCaps}",
                            style: context.textTheme.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          if (isEditable)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  child: Builder(builder: (context) {
                                    int durationCount =
                                        item.parameters.numberOfUnits!.toInt();
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                      return Row(children: [
                                        CustIconButton(
                                          onPressed: () {
                                            setState(() {
                                              durationCount--;
                                            });
                                            controller.updateProductItemCount(
                                              item: item,
                                              count: durationCount,
                                            );
                                          },
                                          isEnabled: durationCount > 1,
                                          icon: Icons.remove,
                                        ),
                                        Text(
                                          "$durationCount",
                                          style: context.textTheme.bodyMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        CustIconButton(
                                          onPressed: () {
                                            setState(() {
                                              durationCount++;
                                            });
                                            controller.updateProductItemCount(
                                              item: item,
                                              count: durationCount,
                                            );
                                          },
                                          isEnabled: true,
                                          icon: Icons.add,
                                        ),
                                      ]);
                                    });
                                  }),
                                ),
                              ],
                            ),
                          if (!isEditable)
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Icon(
                                    Icons.local_offer,
                                  ),
                                ),
                                Text(
                                  "${item.parameters.numberOfUnits} item",
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                costBuilder(context),
                              ],
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            isEditable
                ? Positioned(
                    bottom: 16,
                    right: 5,
                    child: Text(
                      "\$${item.cost}",
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.end,
                    ),
                  )
                : SizedBox.shrink(),
            isEditable
                ? Positioned(
                    top: 4,
                    right: 4,
                    child: InkWell(
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: secondaryLightBlueColor,
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 14,
                          color: primaryBlueColor,
                        ),
                      ),
                      onTap: () {},
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ],
    );
  }

  Widget costBuilder(BuildContext context) {
    if (item.parameters.previousCost != null) {
      return Row(
        children: [
          Image.asset(aPriceCheck),
          Text(
            "\$${item.parameters.previousCost!.toDouble().toStringAsFixed(0)}",
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationThickness: 2.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(Icons.arrow_forward),
          ),
          Text(
            "\$${item.cost.toDouble().toStringAsFixed(0)}",
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        Image.asset(aPriceCheck),
        Text(
          "\$${item.cost.toDouble().toStringAsFixed(0)}",
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}