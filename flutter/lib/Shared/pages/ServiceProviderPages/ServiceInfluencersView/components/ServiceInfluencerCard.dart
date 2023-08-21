import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfluencersView/controllers/ServiceInfluencersViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';

class ServiceInfluencerCard extends StatelessWidget {
  final Influencer influencer;
  const ServiceInfluencerCard({super.key, required this.influencer});

  @override
  Widget build(BuildContext context) {
    return MezCard(
      firstAvatarBgImage: CachedNetworkImageProvider(influencer.image),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: influencer.name, style: context.textTheme.bodyLarge),
              WidgetSpan(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 3, right: 5, left: 5),
                child: Icon(
                  Icons.circle,
                  size: 12,
                ),
              )),
              TextSpan(
                  text: "@" + influencer.username,
                  style: context.textTheme.bodyLarge),
            ]),
          ),
          tinySepartor,
          Wrap(
            spacing: 5,
            children: List.generate(
                influencer.platforms.length,
                (int index) => Container(
                      decoration: BoxDecoration(
                          // color: secondaryLightBlueColor,
                          // borderRadius: BorderRadius.circular(20),
                          ),
                      child: Text.rich(
                        TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              influencer.platforms.keys.toList()[index].icon,
                              size: 20,
                            ),
                          ),
                          WidgetSpan(child: hTinySepartor),
                          TextSpan(
                              text: influencer.platforms.values
                                  .toList()[index]
                                  .toCount,
                              style: context.textTheme.bodyLarge),
                        ]),
                      ),
                    )),
          ),
        ],
      ),
      bottomWidget: Wrap(
        spacing: 2,
        runSpacing: 2,
        children: List.generate(
            (influencer.categories.length <= 3)
                ? influencer.categories.length
                : 3,
            (int index) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                  decoration: BoxDecoration(
                      color: secondaryLightBlueColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    influencer.categories[index].name,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: primaryBlueColor),
                  ),
                )),
      ),
    );
  }
}
