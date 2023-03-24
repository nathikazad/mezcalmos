import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/components/AnimatedOrderInfoCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/components/DvOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/components/DvOrderStatusControllButtons.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/controllers/DvOrderViewController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:url_launcher/url_launcher_string.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["RestaurantOrderView"];
//

class DvOrderView extends StatefulWidget {
  const DvOrderView({Key? key}) : super(key: key);

  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath(DeliveryAppRoutes.kDvOrderView
        .replaceAll(":orderId", orderId.toString()));
  }

  @override
  _DvOrderViewState createState() => _DvOrderViewState();
}

class _DvOrderViewState extends State<DvOrderView> {
  DvOrderViewcontroller viewController = DvOrderViewcontroller();

//  OrderController controller = Get.find<OrderController>();

  @override
  void initState() {
    final String orderId = MezRouter.urlArguments['orderId'].toString();

    ///  controller.clearOrderNotifications(orderId);
    viewController.init(orderId: int.parse(orderId));

    super.initState();
  }

  @override
  void dispose() {
    mezDbgPrint("Calling view dispose 🥸");
    viewController.dispose();
    super.dispose();
  }

  double _recenterBtnBottomPadding = 315;
  EdgeInsets _mapPadding = EdgeInsets.only(top: 10, bottom: 220);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        showNotifications: true,
        title:
            '${_i18n()[viewController.order.orderType.toFirebaseFormatString()]} ${_i18n()["title"]}',
      ),
      bottomNavigationBar: Obx(
        () => (viewController.hasData)
            ? DvOrderStatusControllButtons(
                viewController: viewController,
              )
            : SizedBox(),
      ),
      body: Obx(
        () => viewController.hasData
            ? Stack(
                children: [
                  MGoogleMap(
                    recenterBtnBottomPadding: _recenterBtnBottomPadding,
                    mGoogleMapController: viewController.mapController,
                    padding: _mapPadding,
                  ),
                  Positioned(
                    bottom: _recenterBtnBottomPadding,
                    right: 12,
                    child: InkWell(
                      onTap: () async {
                        final LatLng _destination = LatLng(
                            viewController.order.dropoffLocation.latitude,
                            viewController.order.dropoffLocation.longitude);

                        final String url =
                            "https://www.google.com/maps/dir/?api=1&destination=${_destination.latitude},${_destination.longitude}";

                        try {
                          await launchUrlString(url);
                        } catch (e) {
                          await launchUrlString(url);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.5),
                                offset: Offset(-1, 0),
                                spreadRadius: 1,
                                blurRadius: 10)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.navigation_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: 5,
                    right: 4,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: DvOrderBottomCard(
                          viewcontroller: viewController,
                          onCardStateChange: (OrderInfoCardState state) {
                            setState(() {
                              if (state == OrderInfoCardState.Maximized) {
                                _recenterBtnBottomPadding = 315;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 220);
                              } else {
                                _recenterBtnBottomPadding = 180;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 120);
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              )
            : MezLogoAnimation(
                centered: true,
              ),
      ),
    );
  }
}
