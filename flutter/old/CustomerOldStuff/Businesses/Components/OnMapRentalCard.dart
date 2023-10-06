import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

import '../../../../../CustomerOldStuff/Businesses/Offerings/CustHomeRentalView/CustHomeRentalView.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['OnMapRentalCard'];

class OnMapRentalCard extends StatelessWidget {
  final HomeCard rental;
  final EdgeInsetsGeometry margin;
  const OnMapRentalCard(
      {super.key,
      required this.rental,
      this.margin = const EdgeInsets.only(bottom: 75, left: 20, right: 20)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 1, color: Colors.grey.shade400)
          ]),
      child: InkWell(
        onTap: () => CustHomeRentalView.navigate(
          rentalId: rental.details.id.toInt(),
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              child: CachedNetworkImage(
                  width: 60.mezSp,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: rental.details.firstImage!),
            ),
            SizedBox(width: 5),
            Container(
              width: 65.mezW,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    rental.details.name.getTranslation(userLanguage)!.inCaps,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: context.textTheme.displaySmall?.copyWith(
                        fontSize: 13.5.mezSp, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.price_check),
                          Text(
                            '${rental.details.cost.values.first.toPriceString()}/${'${_i18n()[rental.details.cost.keys.first.toStringDuration().toLowerCase()]}'}',
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyLarge?.copyWith(
                                fontSize: 12.5.mezSp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      if (rental.bedrooms != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.single_bed_outlined, size: 15.mezSp),
                            Text(' ${rental.bedrooms} ${_i18n()['bedrooms']}',
                                style: context.textTheme.bodyLarge?.copyWith(
                                    fontSize: 12.5.mezSp,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      if (rental.details.additionalParameters?['area'] != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.house_siding, size: 15.mezSp),
                            Text(
                                ' ${rental.details.additionalParameters?['area']}m²',
                                style: context.textTheme.bodyLarge?.copyWith(
                                    fontSize: 12.5.mezSp,
                                    fontWeight: FontWeight.w500)),
                          ],
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
