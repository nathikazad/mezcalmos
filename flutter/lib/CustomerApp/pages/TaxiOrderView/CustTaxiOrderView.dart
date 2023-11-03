import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/pages/TaxiOrderView/controllers/CustTaxiOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';

class CustTaxiOrderView extends StatefulWidget {
  const CustTaxiOrderView({super.key});
  static Future<void> navigate({required int orderId}) async {
    final String route =
        XRouter.taxiOrderRoute.replaceFirst(":orderId", "$orderId");
    await MezRouter.toPath(route);
  }

  @override
  State<CustTaxiOrderView> createState() => _CustTaxiOrderViewState();
}

class _CustTaxiOrderViewState extends State<CustTaxiOrderView> {
  CustTaxiOrderViewController viewController = CustTaxiOrderViewController();

  @override
  void initState() {
    final int? orderId =
        int.tryParse(MezRouter.urlArguments["orderId"].toString());
    if (orderId != null) {
      viewController.init(orderId: orderId);
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: MezRouter.back),
      body: Obx(() {
        if (viewController.order != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                OrderMapWidget(
                    deliveryOrderId: viewController.order!.id,
                    height: 80.mezW,
                    fromIcon: aDefaultAvatar,
                    updateDriver: false,
                    polyline: viewController.order!.routeInformation.polyline,
                    from: viewController.order!.pickupLocation,
                    to: viewController.order!.dropoffLocation),
                _orderInfo(context),
                (viewController.hasDriver)
                    ? MezCard(
                        label: "Driver",
                        margin: const EdgeInsets.only(top: 15),
                        radius: 22,
                        firstAvatarBgImage: CachedNetworkImageProvider(
                          viewController.order!.driver!.image,
                        ),
                        content: Text(
                          viewController.order!.driver!.name,
                          style: context.textTheme.bodyLarge,
                        ),
                        action: MezIconButton(
                          icon: Ionicons.logo_whatsapp,
                          iconColor: Colors.white,
                          backgroundColor: Colors.green,
                          onTap: () {
                            viewController.openDriverWhatsapp();
                          },
                        ),
                      )
                    : MezCard(
                        margin: const EdgeInsets.only(top: 15),
                        radius: 22,
                        label: "Driver",
                        firstAvatarIcon: Icons.local_taxi_rounded,
                        content: Text(
                          "Looking for Driver...",
                          style: context.textTheme.bodyLarge,
                        )),
                MezCard(
                    label: "Pickup address",
                    margin: const EdgeInsets.only(top: 15),
                    firstAvatarIcon: Icons.person_pin_circle,
                    firstAvatarBgColor: secondaryLightBlueColor,
                    firstAvatarIconColor: primaryBlueColor,
                    radius: 15,
                    content: Text(viewController.order!.pickupLocation.address,
                        style: context.textTheme.bodyLarge)),
                MezCard(
                    label: "Dropoff address",
                    margin: const EdgeInsets.only(top: 15),
                    firstAvatarIcon: Icons.pin_drop_rounded,
                    firstAvatarBgColor: secondaryLightBlueColor,
                    firstAvatarIconColor: primaryBlueColor,
                    radius: 15,
                    content: Text(viewController.order!.dropoffLocation.address,
                        style: context.textTheme.bodyLarge)),
              ],
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  MezCard _orderInfo(BuildContext context) {
    return MezCard(
      margin: const EdgeInsets.only(top: 15),
      content: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.route,
                        size: 15.mezSp,
                      ),
                      hTinySepartor,
                      Flexible(
                        child: Text(
                            "Distance : " +
                                viewController.order!.routeInformation.distance
                                    .toKmText(),
                            style: context.textTheme.bodyMedium),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.watch_later_outlined,
                        size: 15.mezSp,
                      ),
                      hTinySepartor,
                      Flexible(
                        child: Text(
                            "Est duration : " +
                                viewController.order!.routeInformation.duration
                                    .inMinutesText(),
                            style: context.textTheme.bodyMedium),
                      )
                    ],
                  ),
                ],
              ),
            ),
            VerticalDivider(),
            Column(
              children: <Widget>[
                Icon(
                  viewController.order!.carType.icon,
                  color: Colors.black,
                ),
                Text(viewController.order!.carType.name,
                    style: context.textTheme.bodyMedium)
              ],
            ),
            VerticalDivider(),
            Column(
              children: <Widget>[
                Text("Ride Cost"),
                Text(
                  viewController.order!.rideCost.toPriceString(),
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: primaryBlueColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
