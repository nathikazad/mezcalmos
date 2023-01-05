import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpPickDriverView/components/ROpDriverSelectCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpPickDriverView/controllers/ROpPickDriverViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPickDriverView'];

//

class ROpPickDriverView extends StatefulWidget {
  const ROpPickDriverView({super.key});

  @override
  State<ROpPickDriverView> createState() => _ROpPickDriverViewState();
}

class _ROpPickDriverViewState extends State<ROpPickDriverView> {
  ROpPickDriverController viewController = ROpPickDriverController();
  int? orderID;
  int? serviceProvderId;

  @override
  void initState() {
    mezDbgPrint("Inside kpickdriver routre :::::::::");
    if (Get.parameters["orderId"] != null &&
        Get.parameters["serviceProviderId"] != null) {
      orderID = int.tryParse(Get.parameters["orderId"]!);
      serviceProvderId = int.tryParse(Get.parameters["serviceProviderId"]!);
      if (orderID != null && serviceProvderId != null) {
        viewController.init(
            serviceProviderId: serviceProvderId!, orderId: orderID!);
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
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: MezRouter.back, title: '${_i18n()["pick"]}'),
        body: Obx(() {
          if (viewController.screenLoading.isFalse) {
            return SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // forward to mezcalmos //
                    MezButton(
                      label: "${_i18n()["fwdMezcalmos"]} (50\$)",
                      onClick: () async {
                        //   await viewController.forwardToMezcalmos(order.value!);
                      },
                    ),
                    // drivers map //
                    // ROpDriversMapComponent(
                    //     drivers: viewController.drivers, order: order.value!),
                    const SizedBox(
                      height: 25,
                    ),
                    // ROpSelfDeliveryCard(
                    //   restaurant: order.value!.restaurant,
                    //   assignCallBack: () async {
                    //     await viewController.assignSelfDelivery(
                    //         order: order.value!);
                    //   },
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    // drivers list //
                    Column(
                      children: List.generate(
                          viewController.drivers.length,
                          (int index) => ROpDriverSelectCard(
                                driver: viewController.drivers[index],
                                assingCallback: () async {
                                  final bool result = await _assignCallback(
                                      viewController.drivers[index]);
                                  if (result) {
                                    MezRouter.back();
                                    viewController.screenLoading.value = false;
                                  }
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
                      style: Get.textTheme.bodyText2
                          ?.copyWith(color: primaryBlueColor),
                    )
                  ],
                ));
          }
        }));
  }

  Future<bool> _assignCallback(DeliveryDriver driver) async {
    final ServerResponse result = await viewController.assignDriver(
      driver: driver,
    );
    return result.success;
    // return true;
  }
}
