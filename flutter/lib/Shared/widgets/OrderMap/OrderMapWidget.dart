import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/controllers/OrderMapWidgetController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderMapWidget"];

class OrderMapWidget extends StatefulWidget {
  const OrderMapWidget(
      {super.key,
      required this.deliveryOrderId,
      required this.updateDriver,
      required this.polyline,
      required this.from,
      this.height = 350,
      this.mapPadding = EdgeInsets.zero,
      this.recenterBtnBottomPadding = 20,
      this.margin,
      required this.to});
  final int deliveryOrderId;
  final bool updateDriver;
  final String? polyline;
  final MezLocation? from;
  final MezLocation to;
  final EdgeInsets? margin;
  final double? height;
  final EdgeInsets mapPadding;
  final double recenterBtnBottomPadding;

  @override
  State<OrderMapWidget> createState() => _OrderMapWidgetState();
}

class _OrderMapWidgetState extends State<OrderMapWidget> {
  OrderMapWidgetController viewController = OrderMapWidgetController();
  @override
  void initState() {
    viewController.initMap(
        deliveryOrderId: widget.deliveryOrderId,
        updateDriver: widget.updateDriver,
        polyline: widget.polyline,
        from: widget.from,
        to: widget.to);
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      height: kIsWeb ? null : widget.height,
      child: (kIsWeb)
          ? MezCard(
              contentPadding: const EdgeInsets.all(12),
              onClick: launchAppStoreLink,
              firstAvatarIcon: Icons.map_rounded,
              firstAvatarIconColor: primaryBlueColor,
              firstAvatarBgColor: secondaryLightBlueColor,
              action: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: primaryBlueColor,
              ),
              content: Text(
                "${_i18n()['mapWebText']}",
                style: context.txt.bodyMedium,
              ))
          : MGoogleMap(
              padding: widget.mapPadding,
              mGoogleMapController: viewController.mGoogleMapController,
              recenterBtnBottomPadding: widget.recenterBtnBottomPadding,
            ),
    );
  }
}
