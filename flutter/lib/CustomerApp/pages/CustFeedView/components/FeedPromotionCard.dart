import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezExpandableCard.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';

class FeedPromotionCard extends StatelessWidget {
  const FeedPromotionCard({
    super.key,
    required this.promotion,
  });

  final Offer promotion;

  @override
  Widget build(BuildContext context) {
    return MezExpandableCard(
      elevation: 0,
      marging: EdgeInsets.only(left: 16, right: 16, bottom: 10),
      imageUrl: promotion.serviceProviderImage,
      imageShape: BoxShape.circle,
      headerImageRadius: 40,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(fontSize: 15),
              TextSpan(
                  text: '${promotion.name!.getTranslation(userLanguage)}',
                  children: [
                    WidgetSpan(child: hSmallSepartor),
                    TextSpan(text: '●', style: TextStyle(fontSize: 10)),
                    WidgetSpan(child: hSmallSepartor),
                    TextSpan(
                        text: '${promotion.name!.getTranslation(userLanguage)}')
                  ])),
          Text(
            '${DateTime.parse(promotion.details.validityRangeStart ?? DateTime.now().toString()).getOrderTime()} - ${DateTime.parse(promotion.details.validityRangeEnd ?? DateTime.now().toString()).getOrderTime()}',
            style: context.textTheme.bodyMedium
                ?.copyWith(color: Colors.grey.shade400, fontSize: 13),
          )
        ],
      ),
      expandableWidget: [
        Text(
          'Promotional items',
          style: context.textTheme.bodyLarge
              ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        smallSepartor,
        Text(
          '${promotion.details.items} Tuna Sashimi, Mixed Salad, Fetuccini Dorado, Vegeterian pasta, Tuna and pineapple toast.',
          style: context.textTheme.bodyLarge
              ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Divider(),
        // Text(
        //   'Discounted items',
        //   style: context.textTheme.bodyLarge
        //       ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
        // ),
        // smallSepartor,
        // Text(
        //   'Red Chili Water.',
        //   style: context.textTheme.bodyLarge
        //       ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
        // )
      ],
    );
  }
}
