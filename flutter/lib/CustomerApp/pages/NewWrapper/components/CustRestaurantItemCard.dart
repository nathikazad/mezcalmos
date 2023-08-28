import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustItemView/CustItemView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:shimmer/shimmer.dart';

class CustRestaurantItemCard extends StatelessWidget {
  final Item? item;

  const CustRestaurantItemCard({super.key, required this.item});
  const CustRestaurantItemCard.shimmer() : item = null;

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return _shimmerCard();
    }
    return MezCard(
      elevation: 0.2,
      margin: const EdgeInsets.only(bottom: 10),
      onClick: () {
        CustItemView.navigateToRestaurantItem(
          restaurantId: item!.restaurantId!,
          itemId: item!.id!,
          fromMealPage: true,
        );
      },
      radius: 30,
      firstAvatarBgImage:
          item!.image != null ? CachedNetworkImageProvider(item!.image!) : null,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item!.name.getTranslation(userLanguage) ?? "",
                style: context.textTheme.bodyLarge,
              ),
              Text(
                item!.cost.toPriceString(),
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: primaryBlueColor),
              ),
            ],
          ),
          if (item!.description?.getTranslation(userLanguage) != null) ...[
            meduimSeperator,
            Text(item!.description?.getTranslation(userLanguage) ?? ""),
          ],
          meduimSeperator,
          Text.rich(TextSpan(children: [
            WidgetSpan(
              child: Icon(
                Icons.food_bank_rounded,
                color: Colors.grey,
                size: 15.mezSp,
              ),
            ),
            WidgetSpan(child: hTinySepartor),
            TextSpan(text: item!.restaurantName),
          ]))
        ],
      ),
    );
  }

  Widget _shimmerCard() {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 20.mezW,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
              ),
              SizedBox(width: 8.0),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 12,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Container(
                            width: 30,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ],
                      ),
                      Container(
                        width: 150,
                        height: 12,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
