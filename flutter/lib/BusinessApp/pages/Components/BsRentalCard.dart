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
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsToggleButton.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['Components']['BsRentalCard'];

class BsRentalCard extends StatelessWidget {
  final RentalCard rental;
  final BsServicesListViewController viewController;
  final Function()? onClick;
  const BsRentalCard(
      {super.key,
      required this.rental,
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
                rental.details.firstImage ?? customImageUrl,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                rental.details.name
                    .getTranslation(viewController.primaryLang)!
                    .inCaps,
                style: context.textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                '${rental.details.cost.values.first.toPriceString()}/${_i18n()[rental.details.cost.keys.first.toStringDuration().toLowerCase()]}',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontSize: 12.mezSp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                maxLines: 2,
              ),
            ),
            BsItemToggleButton(
              details: rental.details,
              viewController: viewController,
            ),
          ],
        ));
  }
}
