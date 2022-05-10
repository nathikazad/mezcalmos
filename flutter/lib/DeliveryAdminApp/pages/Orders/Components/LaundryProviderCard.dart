import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["components"]["laundryProviderCard"];

class LaundryProviderCard extends StatefulWidget {
  final LaundryOrder order;

  const LaundryProviderCard({Key? key, required this.order}) : super(key: key);

  @override
  State<LaundryProviderCard> createState() => _LaundryProviderCardState();
}

class _LaundryProviderCardState extends State<LaundryProviderCard> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '${_i18n()["laundry"]}',
              style: textTheme.bodyText1,
            ),
          ),
          Card(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: (widget.order.laundry != null)
                  ? laundryInfoComponent(textTheme, context)
                  : noLaundryComponent(context, textTheme),
            ),
          ),
        ],
      ),
    );
  }

  // ------ LOCAL COMPONENTS ---------//

  // CARD CONTENT WHEN THERE IS NO LAUNDRY ASSIGNED, LAUNDRY INFO  (LAUNDRY == NULL)
  Widget noLaundryComponent(BuildContext context, TextTheme textTheme) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.local_laundry_service,
          color: Theme.of(context).primaryColorLight,
          size: 50,
        ),
        const SizedBox(width: 10),
        Text(
          'Error',
          style: textTheme.bodyText1,
        ),
      ],
    );
  }

// CARD CONTENT WHEN THERE IS LAUNDRY ASSIGNED, LAUNDRY INFO  (LAUNDRY != NULL)
  Widget laundryInfoComponent(TextTheme textTheme, BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 25,
          backgroundImage:
              CachedNetworkImageProvider(widget.order.laundry.image),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.order.laundry.name,
                style: textTheme.bodyText2,
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
