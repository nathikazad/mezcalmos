import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustRentalView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';

class CustBusinessRentalCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry contentPadding;
  final Rental rental;
  final double? elevation;

  const CustBusinessRentalCard(
      {super.key,
      this.margin = const EdgeInsets.only(top: 5),
      this.contentPadding = const EdgeInsets.all(8),
      required this.rental,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return MezCard(
      onClick: () {
        if (rental.category1 == RentalCategory1.Home) {
          CustHomeRentalView.navigate(rentalId: rental.details.id.toInt());
        } else {
          CustRentalView.navigate(rentalId: rental.details.id.toInt());
        }
      },
      firstAvatarBgImage:
          (rental.details.image != null && rental.details.image!.isNotEmpty)
              ? CachedNetworkImageProvider(rental.details.image![0])
              : null,
      content: Text(
        rental.details.name.getTranslation(userLanguage),
        style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
        overflow: TextOverflow.ellipsis,
      ),
      action: Text(
        '\$${rental.details.cost.values.first.toString()}/${rental.details.cost.keys.first.toStringDuration()}',
        style: context.textTheme.bodyLarge,
      ),
    );
    /*return Card(
      elevation: elevation,
      margin: margin,
      child: Padding(
        padding: contentPadding,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CircleAvatar(
            radius: 17.5.sp,
            backgroundImage: (rental.details.image != null &&
                    rental.details.image!.isNotEmpty)
                ? CachedNetworkImageProvider(rental.details.image![0])
                : null,
            backgroundColor: backgroundShadeColor,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 7,
            child: Text(
              rental.details.name.getTranslation(userLanguage) ?? "",
              style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text(
            '\$${rental.details.cost.values.first.toString()}/${rental.details.cost.keys.first.toStringDuration()}',
            style: context.textTheme.bodyLarge,
          )
        ]),
      ),
    );*/
  }
}
