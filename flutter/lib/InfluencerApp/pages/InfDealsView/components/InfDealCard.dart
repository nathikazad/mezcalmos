import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/OfferHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class InfDealCard extends StatelessWidget {
  final bool isPromoted;
  final Offer offer;
  final Future<void> Function()? onClick;
  const InfDealCard(
      {super.key,
      required this.isPromoted,
      required this.offer,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (offer.serviceProviderImage != null)
                  CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(offer.serviceProviderImage!),
                    radius: 22,
                  ),
                hMeduimSeperator,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text.rich(
                        TextSpan(children: <InlineSpan>[
                          TextSpan(text: offer.serviceProviderName),
                          WidgetSpan(child: hTinySepartor),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Icon(
                                Icons.circle_sharp,
                                size: 10,
                              ),
                            ),
                          ),
                          WidgetSpan(child: hTinySepartor),
                          TextSpan(
                              text: offer.name!.getTranslation(userLanguage)),
                        ]),
                        style: context.textTheme.bodyLarge,
                      ),
                      tinySepartor,
                      Text(
                        "Reward : ${offer.influencerDetails!.toReadableString}",
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(),
            MezButton(
                width: double.infinity,
                height: 45,
                label: isPromoted ? "Unpromote" : "Promote",
                backgroundColor: isPromoted ? Colors.white : null,
                borderColor: isPromoted ? redAccentColor : null,
                textColor: isPromoted ? redAccentColor : null,
                borderRadius: 20,
                onClick: onClick),
          ],
        ),
      ),
    );
  }
}
