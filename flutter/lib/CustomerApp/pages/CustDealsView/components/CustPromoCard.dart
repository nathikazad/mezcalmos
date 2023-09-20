import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/CustRestaurantView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/OfferHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class CustPromoCard extends StatelessWidget {
  const CustPromoCard({
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
                  Flexible(
                    fit: FlexFit.tight,
                    child: Padding(
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
                                            '${promotion.serviceProviderName}')
                                  ])),
                          Text(
                            '${DateTime.parse(promotion.details.validityRangeStart ?? DateTime.now().toString()).getOrderTime()} - ${DateTime.parse(promotion.details.validityRangeEnd ?? DateTime.now().toString()).getOrderTime()}',
                            style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey.shade600, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MezIconButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconColor: Colors.black,
                    onTap: () async {
                      switch (promotion.serviceProviderType) {
                        case ServiceProviderType.Restaurant:
                          await CustRestaurantView.navigate(
                            restaurantId: promotion.serviceProviderId.toInt(),
                          );
                          break;
                        //   return;
                        // case ServiceProviderType.Laundry:
                        //   await SingleLaundryScreen.navigate(
                        //     laundryId: promotion.serviceProviderId.toInt(),
                        //   );
                        //   return;

                        // case ServiceProviderType.Business:
                        //   await CustBusinessView.navigate(
                        //     businessId: promotion.serviceProviderId.toInt(),
                        //   );
                        //   return;

                        // case ServiceProviderType.DeliveryCompany:
                        //   await CustCourierServiceView.navigate(
                        //     companyId: promotion.serviceProviderId.toInt(),
                        //   );
                        //   return;

                        // case ServiceProviderType.Customer:
                        //   return;

                        // case ServiceProviderType.DeliveryDriver:
                        //   return;
                        default:
                          throw StateError(
                              "Unsupported  =====>${promotion.serviceProviderType}");
                      }
                    },
                    icon: Icons.chevron_right_outlined,
                  ),
                ],
              ),
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(promotion.details.discountTitle,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: primaryBlueColor)),
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
                      '${promotion.nameTranslations!.map((Map<Language, String> e) {
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
