import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsToggleButton.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/EventHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
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
  final BsServicesListViewController viewController;
  final Function()? onClick;
  const BsEventCard(
      {super.key,
      required this.event,
      required this.onClick,
      required this.viewController});

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
                    event.details.name
                        .getTranslation(viewController.primaryLang)!
                        .inCaps,
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
                    event.details.cost.values.first == 0
                        ? '${_i18n()['free']}'
                        : '${event.details.cost.values.first.toPriceString()}/${_i18n()[event.details.cost.keys.first.toStringDuration().toLowerCase()]}',
                    style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 12.mezSp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
                BsItemToggleButton(
                  details: event.details,
                  viewController: viewController,
                ),
              ],
            ),
            // these conditions are a bit confusing please try to extracted them to getters with meaningful names
            if (event.schedule != null &&
                !(event.isClass && event.scheduleType == ScheduleType.OnDemand))
              Column(
                children: [
                  Divider(),
                  CustBusinessScheduleBuilder(
                    period: event.period,
                    schedule: event.schedule,
                    scheduleType: event.scheduleType,
                    showIcons: false,
                    showTitle: false,
                  )
                ],
              ),
            if (event.scheduleType == ScheduleType.OneTime &&
                event.period != null &&
                event.startsAt != null &&
                event.endsAt != null)
              Column(
                children: [
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${event.period?.start.toDayName().inCaps} ${event.period?.start.day} ${event.period != null ? DateFormat.MMMM().format(event.period!.start) : ""}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${formatTime(DateTime.parse(event.startsAt!).toLocal())} - ${formatTime(DateTime.parse(event.endsAt!).toLocal())}",
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ));
  }

  String formatTime(DateTime date) {
    return DateFormat("hh:mm a").format(date);
  }
}
