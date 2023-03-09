import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/router/deliveryRoutes.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/components/DriverSelectCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/components/ROpDriversMapComponent.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/controllers/PickDriverViewController.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPickDriverView'];

//
/// params orderId
/// Arguments showForwardButton
/// Delivery order id
class PickDriverView extends StatefulWidget {
  const PickDriverView({super.key});

  static Future<void> navigate(
      {required int deliveryOrderId, required bool showForwardButton}) {
    return MezRouter.toPath(
        SharedServiceProviderRoutes.kPickDriverRoute
            .replaceAll(":orderId", deliveryOrderId.toString()),
        arguments: <String, dynamic>{"showForwardButton": showForwardButton});
  }

  @override
  State<PickDriverView> createState() => _PickDriverViewState();
}

class _PickDriverViewState extends State<PickDriverView> {
  PickDriverViewController viewController = PickDriverViewController();
  int? deliveryOrderId;
  bool showForward = false;

  @override
  void initState() {
    mezDbgPrint("Inside kpickdriver routre :::::::::");
    if (MezRouter.urlArguments["orderId"] != null) {
      showForward =
          MezRouter.bodyArguments?["showForwardButton"] as bool? ?? false;
      deliveryOrderId =
          int.tryParse(MezRouter.urlArguments["orderId"].toString());

      if (deliveryOrderId != null) {
        viewController.init(orderId: deliveryOrderId!);
      } else {
        MezRouter.back();
      }
    } else {
      MezRouter.back();
    }

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: MezRouter.back, title: '${_i18n()["pick"]}'),
        body: Obx(() {
          if (viewController.screenLoading.isFalse) {
            return SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // drivers map //
                    ROpDriversMapComponent(
                      viewController: viewController,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // drivers list //
                    Column(
                      children: List.generate(
                          viewController.drivers.length,
                          (int index) => DriverSelectCard(
                                driver: viewController.drivers[index],
                                assingCallback: () async {
                                  await viewController.assignDriver(
                                      driver: viewController.drivers[index]);
                                },
                              )),
                    )
                  ],
                ));
          } else {
            return Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${_i18n()["assigning"]}',
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(color: primaryBlueColor),
                    )
                  ],
                ));
          }
        }));
  }

// return true;
}
