import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/components/AnimatedOrderInfoCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/components/DvOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/components/DvOrderStatusControllButtons.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/controllers/DvOrderViewController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';
import 'package:url_launcher/url_launcher_string.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["DvOrderView"];
//

class DvOrderView extends StatefulWidget {
  const DvOrderView({Key? key}) : super(key: key);

  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath(DeliveryAppRoutes.kDvOrderView
        .replaceAll(":orderId", orderId.toString()));
  }

  static String constructPath(int orderId) {
    return DeliveryAppRoutes.kDvOrderView
        .replaceFirst(":orderId", orderId.toString());
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

  double _recenterBtnBottomPadding = 300;
  EdgeInsets _mapPadding = EdgeInsets.only(top: 10, bottom: 220);
  double get getRecenterBtnBottomPadding {
    if (viewController.order.pickupLocation != null) {
      return _recenterBtnBottomPadding;
    } else if (viewController.order.scheduleTime != null) {
      return 270;
    } else
      return 230;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        showNotifications: true,
        titleWidget: Obx(() => Text(
              (viewController.hasData)
                  ? '${_i18n()[viewController.order.orderType.toFirebaseFormatString()]} ${_i18n()["title"].toString().toLowerCase()}'
                  : "",
              style: TextStyle(fontFamily: 'Montserrat'),
            )),
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
            ? Stack(children: [
                OrderMapWidget(
                    mapPadding: _mapPadding,
                    recenterBtnBottomPadding: getRecenterBtnBottomPadding,
                    height: double.infinity,
                    deliveryOrderId: viewController.order.orderId,
                    updateDriver: true,
                    polyline: viewController.order.routeInformation?.polyline,
                    from: viewController.order.pickupLocation,
                    to: viewController.order.dropOffLocation),
                Positioned(
                  bottom: 2,
                  left: 5,
                  right: 4,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () async {
                              final LatLng _destination = LatLng(
                                  viewController.order.dropOffLocation.latitude,
                                  viewController
                                      .order.dropOffLocation.longitude);

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
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: DvOrderBottomCard(
                            viewcontroller: viewController,
                            onCardStateChange: (OrderInfoCardState state) {
                              setState(() {
                                if (state == OrderInfoCardState.Maximized) {
                                  _recenterBtnBottomPadding = 300;
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
                      if (viewController.showSendOfferButton) ...[
                        smallSepartor,
                        MezButton(
                          label: "Counter Offer",
                          onClick: () async {
                            double? newPrice = await _showCostSheet(context);
                            if (newPrice != null) {
                              await viewController.sendCounterOffer(
                                  newPrice: newPrice);
                            }
                          },
                        ),
                        smallSepartor
                      ]
                    ],
                  ),
                ),
              ])
            : MezLogoAnimation(
                centered: true,
              ),
      ),
    );
  }
}

Future<double?> _showCostSheet(BuildContext context) {
  final TextEditingController _textEditingController = TextEditingController();
  return showModalBottomSheet<double?>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8),
                    child: Text(
                      "${_i18n()['counterOffer']}",
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                  meduimSeperator,
                  TextFormField(
                    controller: _textEditingController,
                    style: context.textTheme.bodyLarge,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.attach_money_rounded,
                        color: Colors.black,
                      ),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                  ),
                  meduimSeperator,
                  Row(
                    children: [
                      Flexible(
                        child: MezButton(
                          height: 45,
                          label: "${_i18n()['cancel']}",
                          backgroundColor: offRedColor,
                          textColor: Colors.red,
                          onClick: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: MezButton(
                          height: 45,
                          label: "${_i18n()['reqCounterOffer']}",
                          onClick: () async {
                            Navigator.pop(context,
                                double.tryParse(_textEditingController.text));
                          },
                        ),
                      ),
                    ],
                  ),
                  meduimSeperator
                ],
              )),
        );
      });
}
