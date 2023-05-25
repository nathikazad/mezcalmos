import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView.dart';
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
import 'package:intl/intl.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['CustBusinessEventCard'];

class CustBusinessEventCard extends StatelessWidget {
  final EventCard event;
  final bool needBussinessName;

  const CustBusinessEventCard({
    super.key,
    required this.event,
    required this.needBussinessName,
  });

  @override
  Widget build(BuildContext context) {
    return MezCard(
        onClick: () {
          CustEventView.navigate(
            eventId: event.details.id.toInt(),
          );
        },
        elevation: 0,
        margin: EdgeInsets.only(bottom: 12.5),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  imageUrl: event.details.firstImage ?? defaultUserImgUrl,
                  imageBuilder: (BuildContext context,
                          ImageProvider<Object> imageProvider) =>
                      CircleAvatar(
                    radius: 16.mezSp,
                    backgroundImage: imageProvider,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    '${event.details.name.getTranslation(userLanguage)!.inCaps}',
                    style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 12.5.mezSp,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text(
                  event.details.cost.values.first == 0
                      ? '${_i18n()['free']}'
                      : '${event.details.cost.values.first.toPriceString()}/${'${_i18n()[event.details.cost.keys.first.toStringDuration().toLowerCase()]}'}',
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 12.5.mezSp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
            if (event.schedule != null &&
                event.scheduleType != ScheduleType.OneTime &&
                !(event.scheduleType == ScheduleType.OnDemand && event.isClass))
              Column(
                children: [
                  Divider(),
                  CustBusinessScheduleBuilder(
                      showTitle: false,
                      showIcons: false,
                      schedule: event.schedule,
                      scheduleType: event.scheduleType)
                ],
              ),
            if (event.period != null &&
                event.scheduleType == ScheduleType.OneTime)
              oneTimeBuilder(event),
            if (needBussinessName)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Text(event.businessName),
                ],
              )
          ],
        ));
  }

  Widget oneTimeBuilder(EventCard eventData) {
    return eventData.period != null
        ? Column(
            children: [
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${eventData.period?.start.toDayName()} ${eventData.period?.start.day} ${DateFormat.MMMM().format(eventData.period!.start)}",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                      "${eventData.period!.formatTime(eventData.period!.start)} - ${eventData.period!.formatTime(eventData.period!.end)}"),
                ],
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
