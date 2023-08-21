import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsToggleButton.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['Components']['BsHomeRentalCard'];

class BsHomeRentalCard extends StatelessWidget {
  final HomeCard home;
  final Function()? onClick;
  final BsServicesListViewController viewController;
  final bool showUnit;

  const BsHomeRentalCard(
      {super.key,
      required this.home,
      required this.onClick,
      this.showUnit = true,
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
                home.details.firstImage ?? customImageUrl,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                home.details.name
                        .getTranslation(viewController.primaryLang)
                        ?.inCaps ??
                    "",
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
                '${home.details.cost.values.first.toPriceString()}${showUnit ? "/" + _i18n()[home.details.cost.keys.first.toStringDuration().toLowerCase()] : ""}',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontSize: 12.mezSp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
            BsItemToggleButton(
              details: home.details,
              viewController: viewController,
            ),
          ],
        ));
  }
}
