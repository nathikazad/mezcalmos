import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiOrderView/controllers/TaxiOrderViewController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
    ['pages']['DvOrderView'];

class TaxiOrderView extends StatefulWidget {
  const TaxiOrderView({super.key});

  static void navigate({required int orderId, required int? driverId}) {
    MezRouter.toPath(
        TaxiAppRoutes.kOrderView.replaceFirst(":orderId", "$orderId"),
        arguments: <String, dynamic>{
          "driverId": driverId,
        });
  }

  @override
  State<TaxiOrderView> createState() => _TaxiOrderViewState();
}

class _TaxiOrderViewState extends State<TaxiOrderView> {
  TaxiOrderViewController viewController = TaxiOrderViewController();
  @override
  void initState() {
    final int? orderId =
        int.tryParse(MezRouter.urlArguments["orderId"].toString());
    final int? driverId =
        int.tryParse(MezRouter.bodyArguments?["driverId"]?.toString() ?? "");
    if (orderId != null) {
      viewController.init(orderId: orderId, driverId: driverId);
    } else
      showErrorSnackBar(errorText: "Order Not Found");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MezcalmosAppBar(
          AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
        ),
        bottomNavigationBar: Obx(() {
          if (viewController.showAccept) {
            return _aceptButton();
          } else if (viewController.showFinish)
            return _finishButton();
          else if (viewController.order != null) {
            return _orderStatusCard();
          } else
            return SizedBox();
        }),
        body: Obx(() {
          if (viewController.hasData)
            return _buidBody(context);
          else
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
        }));
  }

  Widget _buidBody(BuildContext context) {
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
          // here call OrderMapWidget

          meduimSeperator,
          MezCard(
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
                                      viewController
                                          .order!.routeInformation.distance
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
                                      viewController
                                          .order!.routeInformation.duration
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
          ),

          MezCard(
              label: "Pickup address",
              firstAvatarIcon: Icons.person_pin_circle,
              firstAvatarBgColor: secondaryLightBlueColor,
              firstAvatarIconColor: primaryBlueColor,
              radius: 15,
              content: Text(viewController.order!.pickupLocation.address,
                  style: context.textTheme.bodyLarge)),
          MezCard(
              label: "Dropoff address",
              firstAvatarIcon: Icons.pin_drop_rounded,
              firstAvatarBgColor: secondaryLightBlueColor,
              firstAvatarIconColor: primaryBlueColor,
              radius: 15,
              content: Text(viewController.order!.dropoffLocation.address,
                  style: context.textTheme.bodyLarge)),

          MezCard(
            label: "${_i18n()['customer']}",
            margin: const EdgeInsets.only(top: 15),
            radius: 22,
            firstAvatarBgImage: CachedNetworkImageProvider(
              viewController.order!.customer.image,
            ),
            content: Text(
              viewController.order!.customer.name,
              style: context.textTheme.bodyLarge,
            ),
            action: MezIconButton(
              icon: Ionicons.logo_whatsapp,
              iconColor: Colors.white,
              backgroundColor: Colors.green,
              onTap: () {
                viewController.openCustomerWhatsapp();
              },
            ),
          ),

          if (viewController.showFinish) ...<Widget>[
            bigSeperator,
            MezButton(
              label: "${_i18n()['cancelOrder']}",
              backgroundColor: offRedColor,
              textColor: redAccentColor,
              onClick: () async {
                await viewController.cancelOrder();
              },
            ),
          ],

          bigSeperator,
        ],
      ),
    );
  }

  Widget _aceptButton() {
    return MezButton(
      label: "${_i18n()['acceptOrder']}",
      borderRadius: 0,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      onClick: () async {
        await viewController.acceptOrder();
      },
    );
  }

  Widget _finishButton() {
    return MezButton(
      label: "${_i18n()['finishOrder']}",
      borderRadius: 0,
      onClick: () async {
        await viewController.finishOrder();
      },
    );
  }

  Widget _orderStatusCard() {
    return Container(
      height: 70,
      child: Card(
        margin: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Order is currently: "),
                    Text(
                      viewController.order!.status.name,
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              hSmallSepartor,
              CircleAvatar(
                radius: 15,
                backgroundColor: secondaryLightBlueColor,
                child: Icon(
                  viewController.order!.status.icon,
                  color: primaryBlueColor,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
