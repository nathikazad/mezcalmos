import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['Components']['BsEventCard'];

class BsEventCard extends StatelessWidget {
  final EventCard event;
  final Function()? onClick;
  const BsEventCard({super.key, required this.event, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return MezCard(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.only(top: 10),
        onClick: onClick,
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 17.5.mezSp,
                  backgroundImage: CachedNetworkImageProvider(
                    event.details.firstImage ?? customImageUrl,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Text(
                    event.details.name.getTranslation(userLanguage),
                    style: context.textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    '${event.details.cost.values.first.toPriceString()}/${_i18n()[event.details.cost.keys.first.toStringDuration().toLowerCase()]}',
                    style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 12.mezSp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
                Switch(
                  activeColor: primaryBlueColor,
                  onChanged: (_) {},
                  value: true,
                )
              ],
            ),
            if (event.schedule != null)
              Column(
                children: [
                  Divider(),
                  CustBusinessScheduleBuilder(
                    schedule: event.schedule,
                    scheduleType: event.scheduleType,
                    showIcons: false,
                    showTitle: false,
                  )
                ],
              )
          ],
        ));
  }
}
