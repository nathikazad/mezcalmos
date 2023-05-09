import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustProductView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';

class CustBusinessProductCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry contentPadding;
  final Product product;
  final double? elevation;

  const CustBusinessProductCard(
      {super.key,
      this.margin = const EdgeInsets.only(top: 5),
      this.contentPadding = const EdgeInsets.all(8),
      required this.product,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return MezCard(
      onClick: () {
        CustProductView.navigate(
          productId: product.details.id.toInt(),
        );
      },
      firstAvatarBgImage:
          (product.details.image != null && product.details.image!.isNotEmpty)
              ? CachedNetworkImageProvider(product.details.image![0])
              : null,
      content: Text(
        product.details.name.getTranslation(userLanguage),
        style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
        overflow: TextOverflow.ellipsis,
      ),
      action: Text(
        '${product.details.cost.values.first.toPriceString()}/${product.details.cost.keys.first.toStringDuration()}',
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
            backgroundImage: (product.details.image != null &&
                    product.details.image!.isNotEmpty)
                ? CachedNetworkImageProvider(product.details.image![0])
                : null,
            backgroundColor: backgroundShadeColor,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 7,
            child: Text(
              product.details.name.getTranslation(userLanguage) ?? "",
              style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text(
            '\$${product.details.cost.values.first.toString()}/${product.details.cost.keys.first.toStringDuration()}',
            style: context.textTheme.bodyLarge,
          )
        ]),
      ),
    );*/
  }
}
