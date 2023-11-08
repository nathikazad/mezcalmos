import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/OfferHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

class InfOfferEarningCard extends StatelessWidget {
  const InfOfferEarningCard({
    super.key,
    required this.earning,
    this.forServiceProvider = false,
  });

  final InfEarning earning;
  final bool forServiceProvider;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 15),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: CachedNetworkImageProvider(
                          earning.customerInfo?.image ?? defaultUserImgUrl),
                    ),
                    hSmallSepartor,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            earning.customerInfo?.name ?? "Local customer",
                            style: context.textTheme.bodyLarge
                                ?.copyWith(fontSize: 11.mezSp),
                          ),
                          forServiceProvider
                              ? Text("Customer")
                              : Text.rich(TextSpan(children: <InlineSpan>[
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.food_bank,
                                      size: 17,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  WidgetSpan(child: hTinySepartor),
                                  TextSpan(
                                      text: earning.serviceInfo?.name ?? ""),
                                ])),
                        ],
                      ),
                    ),
                    if (forServiceProvider) ...<Widget>[
                      VerticalDivider(),
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: CachedNetworkImageProvider(
                            earning.influencerInfo.image!),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              earning.influencerInfo.name!,
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(fontSize: 11.mezSp),
                            ),
                            forServiceProvider
                                ? Text("Influencer")
                                : Text.rich(TextSpan(children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.food_bank,
                                        size: 17,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    WidgetSpan(child: hTinySepartor),
                                    TextSpan(
                                        text: earning.serviceInfo?.name ?? ""),
                                  ])),
                          ],
                        ),
                      ),
                    ],
                    if (!forServiceProvider)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "+${earning.comission.toPriceString()}",
                          style: context.textTheme.displayMedium
                              ?.copyWith(color: primaryBlueColor),
                        ),
                      ),
                  ],
                ),
              ),
              Divider(),
              Text.rich(TextSpan(children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.sell,
                    size: 17,
                    color: Colors.grey.shade500,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(
                    text: "Discount : ${earning.discount.toPriceString()}"),
              ])),
              Text.rich(TextSpan(children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.attach_money,
                    size: 17,
                    color: Colors.grey.shade500,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(
                    text:
                        "Order Total : ${earning.totalBeforeDiscount.toPriceString()} - ${(earning.discount).toPriceString()} = ${earning.orderTotal.toPriceString()}"),
              ])),
              Text.rich(TextSpan(children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.redeem,
                    size: 17,
                    color: Colors.grey.shade500,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(
                    text: earning.influencerOfferDetails.toReadableString +
                        "= ${earning.comission.toPriceString()}"),
              ])),
            ],
          ),
        ));
  }
}
