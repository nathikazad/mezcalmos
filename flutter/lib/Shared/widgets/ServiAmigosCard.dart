import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["ViewRestaurantOrderScreen"];

class ServiceAmigosCard extends StatelessWidget {
  const ServiceAmigosCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MezCard(
        label: "${_i18n()['dvService']}",
        labelStyle: context.textTheme.bodyLarge,
        firstAvatarBgImage: CachedNetworkImageProvider(
            "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/services%2FCourier%2FWhatsApp%20Image%202023-04-24%20at%209.52.26%20AM.jpeg?alt=media&token=67651bd0-f1d6-4a99-aa00-3ae8bed30e9b"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Servi Amigos",
              style: context.textTheme.bodyLarge,
            ),
            Row(
              children: <Widget>[
                Text("\$10/KM"),
                hSmallSepartor,
                Text("62 ${_i18n()["drivers"]}"),
                hSmallSepartor,
                Text.rich(TextSpan(children: <InlineSpan>[
                  WidgetSpan(
                    child: Icon(
                      Icons.star_rate_rounded,
                      color: primaryBlueColor,
                      size: 14.mezSp,
                    ),
                  ),
                  TextSpan(
                      text: "4.9",
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: primaryBlueColor)),
                  TextSpan(text: " (23)")
                ]))
              ],
            )
          ],
        ));
  }
}
