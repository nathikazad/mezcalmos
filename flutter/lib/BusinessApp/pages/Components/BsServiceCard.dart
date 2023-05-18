import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import 'package:mezcalmos/BusinessApp/pages/Components/BsToggleButton.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['Components']['BsServiceCard'];

class BsServiceCard extends StatelessWidget {
  final ServiceCard service;
  final Function()? onClick;
  final BsServicesListViewController viewController;

  const BsServiceCard(
      {super.key,
      required this.service,
      required this.onClick,
      required this.viewController});

  @override
  Widget build(BuildContext context) {
    return MezCard(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.only(top: 10),
        onClick: onClick,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 17.5.mezSp,
              backgroundImage: CachedNetworkImageProvider(
                service.details.firstImage ?? customImageUrl,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                service.details.name.getTranslation(userLanguage)!,
                style: context.textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                '${service.details.cost.values.first.toPriceString()}/${_i18n()[service.details.cost.keys.first.toStringDuration().toLowerCase()]}',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontSize: 12.mezSp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                maxLines: 2,
              ),
            ),
            BsItemToggleButton(
              details: service.details,
              viewController: viewController,
            ),
          ],
        ));
  }
}
