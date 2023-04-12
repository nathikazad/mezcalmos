import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/controllers/DvCompanyOrderViewController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/DeliveryOrderHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/PickDriverView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderScheduledTime.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';
import 'package:mezcalmos/env.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["DvCompanyOrderView"];

class DvCompanyOrderView extends StatefulWidget {
  const DvCompanyOrderView({Key? key}) : super(key: key);

  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath(DeliveryAdminRoutes.kOrderViewRoute
        .replaceAll(":orderId", orderId.toString()));
  }

  static String constructPath(int orderId) {
    return DeliveryAdminRoutes.kOrderViewRoute
        .replaceFirst(":orderId", orderId.toString());
  }

  @override
  _DvCompanyOrderViewState createState() => _DvCompanyOrderViewState();
}

class _DvCompanyOrderViewState extends State<DvCompanyOrderView> {
  DvCompanyOrderViewController viewController = DvCompanyOrderViewController();

  @override
  void initState() {
    final String orderId = MezRouter.urlArguments['orderId'].toString();
    mezDbgPrint("Calling init dispose 🥸");
    viewController.init(orderId: int.parse(orderId));

    super.initState();
  }

  @override
  void dispose() {
    mezDbgPrint("Calling view dispose 🥸");
    viewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: "${_i18n()['order']}"),
      body: Obx(() {
        if (viewController.order.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Container(
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        viewController.order.value!.status.widget(
                            packageReady:
                                viewController.order.value!.packageReady),
                        Expanded(
                          child: Text(
                            viewController.order.value!.status.title,
                            style: Theme.of(context).textTheme.displaySmall,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _estTimes(),
                if (viewController.canSetDriver) _driverCard(),
                if (viewController.order.value!.orderWithDriver)
                  OrderMapWidget(
                      margin: const EdgeInsets.only(top: 20),
                      deliveryOrderId: viewController.order.value!.orderId,
                      updateDriver: viewController.order.value!.orderWithDriver,
                      polyline: viewController
                          .order.value!.routeInformation?.polyline,
                      from: viewController.order.value!.pickupLocation,
                      to: viewController.order.value!.dropOffLocation),
                if (MezEnv.appType == AppType.MezAdmin) _serviceCard(),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "${_i18n()['customer']}",
                    style: context.txt.bodyLarge,
                  ),
                ),
                MezCard(
                  margin: const EdgeInsets.only(top: 5),
                  contentPadding: const EdgeInsets.all(8),
                  firstAvatarBgImage: CachedNetworkImageProvider(
                      viewController.order.value!.customer.image),
                  content: Text(
                    viewController.order.value!.customer.name,
                    style: context.txt.bodyLarge,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "${_i18n()['deliveryDetails']}",
                    style: context.txt.bodyLarge,
                  ),
                ),
                if (viewController.order.value!.pickupLocation != null)
                  OrderDeliveryLocation(
                    title: "${_i18n()['pickupLoc']}",
                    address:
                        viewController.order.value!.pickupLocation!.address,
                    margin: const EdgeInsets.only(top: 10),
                  ),
                OrderDeliveryLocation(
                  address: viewController.order.value!.dropOffLocation.address,
                  margin: const EdgeInsets.only(top: 10),
                ),
                OrderPaymentMethod(
                  stripeOrderPaymentInfo:
                      viewController.order.value!.stripePaymentInfo,
                  paymentType: viewController.order.value!.paymentType,
                  margin: const EdgeInsets.only(top: 10),
                ),
                OrderScheduledTimeCard(
                    time: viewController.order.value!.scheduleTime,
                    margin: const EdgeInsets.only(top: 10)),
              ],
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: primaryBlueColor,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${_i18n()['loading']}",
                  style:
                      context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _estTimes() {
    if (viewController.order.value?.haveAtLeastOneEstTime == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "${_i18n()['estTimes']}",
              style: context.txt.bodyLarge,
            ),
          ),
          if (viewController.order.value!.estimatedPackageReadyTime != null)
            MezCard(
                contentPadding: const EdgeInsets.all(8),
                firstAvatarBgColor: secondaryLightBlueColor,
                secondAvatarBgColor: primaryBlueColor,
                firstAvatarIcon: Icons.watch_later,
                firstAvatarIconColor: primaryBlueColor,
                secondAvatarIcon: Icons.check_circle,
                secondAvatarIconColor: Colors.white,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_i18n()['packageReady']}",
                      style: context.txt.bodyLarge,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(viewController.order.value!.estimatedPackageReadyTime!
                        .getEstimatedTime()),
                  ],
                )),
          if (viewController.order.value!.estimatedArrivalAtPickup != null)
            MezCard(
                contentPadding: const EdgeInsets.all(8),
                firstAvatarBgColor: secondaryLightBlueColor,
                secondAvatarBgColor: primaryBlueColor,
                firstAvatarIcon: Icons.watch_later,
                firstAvatarIconColor: primaryBlueColor,
                secondAvatarIcon: Icons.delivery_dining,
                secondAvatarIconColor: Colors.white,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_i18n()['arrivalAtPickup']}",
                      style: context.txt.bodyLarge,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(viewController.order.value!.estimatedArrivalAtPickup!
                        .getEstimatedTime()),
                  ],
                )),
          if (viewController.order.value!.estimatedArrivalAtPickup != null)
            MezCard(
                contentPadding: const EdgeInsets.all(8),
                firstAvatarBgColor: secondaryLightBlueColor,
                secondAvatarBgColor: primaryBlueColor,
                firstAvatarIcon: Icons.watch_later,
                firstAvatarIconColor: primaryBlueColor,
                secondAvatarIcon: Icons.delivery_dining,
                secondAvatarIconColor: Colors.white,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_i18n()['arrivalAtDropoff']}",
                      style: context.txt.bodyLarge,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(viewController.order.value!.estimatedArrivalAtDropoff!
                        .getEstimatedTime()),
                  ],
                )),
        ],
      );
    } else
      return SizedBox();
  }

  MezCard _driverCard() {
    return MezCard(
      margin: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.all(8),
      secondAvatarIcon: Icons.delivery_dining,
      secondAvatarIconColor: Colors.white,
      secondAvatarBgColor: primaryBlueColor,
      firstAvatarBgColor: secondaryLightBlueColor,
      firstAvatarBgImage: (viewController.order.value!.driverInfo == null)
          ? null
          : CachedNetworkImageProvider(
              viewController.order.value!.driverInfo!.image),
      content: Text(
        viewController.order.value!.driverInfo?.name ??
            "${_i18n()['noDriver']}",
        style: context.txt.bodyLarge,
      ),
      action: Row(
        children: [
          MezIconButton(
            onTap: () {
              PickDriverView.navigate(
                  deliveryOrderId: viewController.order.value!.orderId,
                  showForwardButton: false);
            },
            icon: (viewController.order.value!.driverInfo != null)
                ? Icons.edit
                : Icons.add,
            iconSize: 22,
          ),
        ],
      ),
    );
  }

  MezCard _serviceCard() {
    return MezCard(
        margin: const EdgeInsets.only(top: 20),
        contentPadding: const EdgeInsets.all(8),
        firstAvatarBgImage: CachedNetworkImageProvider(
            viewController.order.value!.serviceProvider.image),
        action: MessageButton(
          chatId: 55,
          onTap: () {},
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              viewController.order.value!.serviceProvider.name,
              style: context.txt.bodyLarge,
            ),
          ],
        ));
  }
}
