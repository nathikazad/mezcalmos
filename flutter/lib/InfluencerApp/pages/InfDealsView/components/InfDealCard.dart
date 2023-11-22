import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/OfferHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';

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
            Divider(
              height: 15,
            ),
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: MezInkwell(
                        // width: double.infinity,
                        // height: 20,
                        width: double.infinity,
                        margin: EdgeInsets.zero,
                        label: isPromoted ? "Unpromote" : "Promote",
                        backgroundColor: isPromoted ? Colors.white : null,
                        borderColor: isPromoted ? redAccentColor : null,
                        textColor: isPromoted ? redAccentColor : null,
                        borderRadius: 20,
                        onClick: onClick),
                  ),
                  VerticalDivider(),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                        color: offer.isActive
                            ? Colors.green.shade100
                            : offRedColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        offer.isActive ? "Active" : "Inactive",
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: offer.isActive ? Colors.green : redAccentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
