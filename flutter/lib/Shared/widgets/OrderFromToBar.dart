import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/OrderTimeBar.dart';
import 'package:intl/intl.dart';

class OrderPositionedFromToTopBar {
  static dynamic i18n() => Get.find<LanguageController>().strings["TaxiApp"]
      ["pages"]["Orders"]["CurrentOrderScreen"]["CPositionedFromToBar"];

  static Widget _getMezCalmosCircleIcon() {
    return Positioned(
      right: 20,
      top: 25,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          VerticalDivider(
            color: Color.fromARGB(255, 236, 236, 236),
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(
                getSizeRelativeToScreen(2.5, Get.height, Get.width)),
            height: getSizeRelativeToScreen(17, Get.height, Get.width),
            width: getSizeRelativeToScreen(17, Get.height, Get.width),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(255, 216, 225, 249),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 7)),
              ],
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 97, 127, 255),
                Color.fromARGB(255, 198, 90, 252),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Center(
              child: Image.asset('assets/images/shared/logoWhite.png'),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _topOrderTimeBar(TaxiOrder order) {
    return Positioned(
      top: 90, //isSmallDevice(context) ? 90 : 65,
      left: 10,
      right: 10,
      child: OrderTimeTopBar(
        barText: DateFormat('EEEE dd / MM / y').format(
              order.scheduledTime ?? order.orderTime,
            ) +
            ' at ' +
            DateFormat('hh:mm a').format(
              order.scheduledTime ?? order.orderTime,
            ),
      ),
    );
  }

  static List<Widget> build({
    required BuildContext context,
    required TaxiOrder order,
  }) {
    return [
      Positioned(
        top: 5,
        child: Column(
          children: [
            Container(
              width: Get.width / 1.05,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color.fromARGB(255, 216, 225, 249),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Flex(
                // clipBehavior: Clip.hardEdge,
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Obx(
                              () => Container(
                                // width: 50,
                                child: Text(
                                  i18n()["from"] + ':',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            child: GestureDetector(
                              onTap: () => MezSnackbar(
                                  i18n()["from"], order.from.address),
                              child: Text(
                                order.from.address,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Get.width / 1.05,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color.fromARGB(255, 216, 225, 249),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Flex(
                clipBehavior: Clip.hardEdge,
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Obx(
                              () => Container(
                                // width: 50,
                                child: Text(
                                  i18n()["to"] + ':',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            child: GestureDetector(
                              onTap: () =>
                                  MezSnackbar(i18n()["to"], order.to.address),
                              child: Text(
                                order.to.address,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      _getMezCalmosCircleIcon()
    ];
  }

  static List<Widget> buildWithOrderTimeBar({
    required BuildContext context,
    required TaxiOrder order,
  }) {
    return [...build(context: context, order: order), _topOrderTimeBar(order)];
  }
}
