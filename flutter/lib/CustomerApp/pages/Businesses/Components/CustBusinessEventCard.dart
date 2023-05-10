import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['CustBusinessEventCard'];

class CustBusinessEventCard extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsetsGeometry contentPadding;
  final Event event;
  final double? elevation;

  const CustBusinessEventCard(
      {super.key,
      this.margin = const EdgeInsets.only(top: 5),
      this.contentPadding = const EdgeInsets.all(8),
      required this.event,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return MezCard(
      margin: margin,
      elevation: elevation,
      onClick: () {
        CustEventView.navigate(
          eventId: event.details.id.toInt(),
        );
      },
      firstAvatarBgImage:
          (event.details.image != null && event.details.image!.isNotEmpty)
              ? CachedNetworkImageProvider(event.details.image![0])
              : null,
      content: Text(
        event.details.name.getTranslation(userLanguage),
        style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
        overflow: TextOverflow.ellipsis,
      ),
      action: Text(
        '${event.details.cost.values.first.toPriceString()}/${_i18n()[event.details.cost.keys.first.toStringDuration().toLowerCase()]}',
        style:
            context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
