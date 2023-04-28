import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';

class CustBusinessServiceCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry contentPadding;
  final Service service;
  final double? elevation;

  const CustBusinessServiceCard(
      {super.key,
      this.margin = const EdgeInsets.only(top: 5),
      this.contentPadding = const EdgeInsets.all(8),
      required this.service,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return MezCard(
      onClick: () {
        CustServiceView.navigate(
          serviceId: service.details.id.toInt(),
        );
      },
      firstAvatarBgImage:
          (service.details.image != null && service.details.image!.isNotEmpty)
              ? CachedNetworkImageProvider(service.details.image![0])
              : null,
      content: Text(
        service.details.name[userLanguage] ?? "",
        style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
        overflow: TextOverflow.ellipsis,
      ),
      action: Text(
        '\$${service.details.cost.values.first.toString()}/${service.details.cost.keys.first.toStringDuration()}',
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
            backgroundImage: (service.details.image != null &&
                    service.details.image!.isNotEmpty)
                ? CachedNetworkImageProvider(service.details.image![0])
                : null,
            backgroundColor: backgroundShadeColor,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 7,
            child: Text(
              service.details.name[userLanguage] ?? "",
              style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text(
            '\$${service.details.cost.values.first.toString()}/${service.details.cost.keys.first.toStringDuration()}',
            style: context.textTheme.bodyLarge,
          )
        ]),
      ),
    );*/
  }
}
