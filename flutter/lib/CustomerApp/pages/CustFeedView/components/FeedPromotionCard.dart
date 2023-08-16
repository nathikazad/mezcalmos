import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierServiceView/CustCourierServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/SingleLaundry/SingleLaundryScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/CustomerRestaurantView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class FeedPromotionCard extends StatelessWidget {
  const FeedPromotionCard({
    super.key,
    required this.promotion,
  });

  final Offer promotion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: primaryBlueColor,
                    backgroundImage: promotion.serviceProviderImage != null
                        ? NetworkImage(promotion.serviceProviderImage!)
                        : NetworkImage(defaultUserImgUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge
                                ?.copyWith(fontSize: 15),
                            TextSpan(
                                text:
                                    '${promotion.name!.getTranslation(userLanguage)}',
                                children: [
                                  WidgetSpan(child: hSmallSepartor),
                                  TextSpan(
                                      text: '●',
                                      style: TextStyle(fontSize: 10)),
                                  WidgetSpan(child: hSmallSepartor),
                                  TextSpan(
                                      text:
                                          '${promotion.name!.getTranslation(userLanguage)}')
                                ])),
                        Text(
                          '${DateTime.parse(promotion.details.validityRangeStart ?? DateTime.now().toString()).getOrderTime()} - ${DateTime.parse(promotion.details.validityRangeEnd ?? DateTime.now().toString()).getOrderTime()}',
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade400, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      switch (promotion.serviceProviderType) {
                        case ServiceProviderType.Restaurant:
                          await CustRestaurantView.navigate(
                            restaurantId: promotion.serviceProviderId.toInt(),
                          );
                          return;
                        case ServiceProviderType.Laundry:
                          await SingleLaundryScreen.navigate(
                            laundryId: promotion.serviceProviderId.toInt(),
                          );
                          return;

                        case ServiceProviderType.Business:
                          await CustBusinessView.navigate(
                            businessId: promotion.serviceProviderId.toInt(),
                          );
                          return;

                        case ServiceProviderType.DeliveryCompany:
                          await CustCourierServiceView.navigate(
                            companyId: promotion.serviceProviderId.toInt(),
                          );
                          return;

                        case ServiceProviderType.Customer:
                          return;

                        case ServiceProviderType.DeliveryDriver:
                          return;
                      }
                    },
                    icon: Icon(
                      Icons.chevron_right_outlined,
                    ),
                  ),
                ],
              ),
              if (promotion.nameTranslations != null &&
                  promotion.nameTranslations!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(
                      'Promotional items',
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    smallSepartor,
                    Text(
                      '${promotion.nameTranslations!.map((e) {
                        return '${e.getTranslation(userLanguage) ?? ''}';
                      })}',
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              // if (promotion.nameTranslations != null &&
              //     promotion.nameTranslations!.isNotEmpty)
              //   Column(
              //     children: [
              //       Divider(),
              //       Text(
              //         'Discounted items',
              //         style: context.textTheme.bodyLarge
              //             ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
              //       ),
              //       smallSepartor,
              //       // Text(
              //       //   'Red Chili Water.',
              //       //   style: context.textTheme.bodyLarge
              //       //       ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
              //       // )
              //     ],
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
