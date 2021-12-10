import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class OrderFooterCard extends StatefulWidget {
  const OrderFooterCard({Key? key, required this.order}) : super(key: key);

  final RestaurantOrder order;

  @override
  State<OrderFooterCard> createState() => _OrderFooterCardState();
}

class _OrderFooterCardState extends State<OrderFooterCard> {
  OrderController controller = Get.find<OrderController>();
  RestaurantController restaurantController = Get.find<RestaurantController>();
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
        child: (widget.order.inProcess() &&
                widget.order.status == RestaurantOrderStatus.OrderReceieved)
            ? Container(
                margin: EdgeInsets.all(8),
                child: TextButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              contentPadding: EdgeInsets.all(20),

                              title: Text(
                                'Cancel order',
                                textAlign: TextAlign.center,
                              ),

                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      'Are you sure you want to cancel the order ?'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        ServerResponse resp =
                                            await restaurantController
                                                .cancelOrder(
                                                    Get.parameters['orderId']!);
                                        mezDbgPrint(resp.data.toString());
                                        if (resp.success) {
                                          Get.until((route) =>
                                              route.settings.name ==
                                              kHomeRoute);
                                          mezcalmosSnackBar(
                                              lang.strings["shared"]
                                                  ["snackbars"]["titleSuccess"],
                                              lang.strings["shared"]
                                                      ["snackbars"]
                                                  ["orderCancelSuccess"],
                                              position: SnackPosition.TOP);
                                        } else {
                                          mezcalmosSnackBar(
                                              lang.strings["shared"]
                                                  ["snackbars"]["titleFailed"],
                                              lang.strings["shared"]
                                                      ["snackbars"]
                                                  ["orderCancelFailed"],
                                              position: SnackPosition.TOP);
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.redAccent,
                                          padding: EdgeInsets.all(12)),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text('Cancel my order'))),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          padding: EdgeInsets.all(12)),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text('Cancel'))),
                                ],
                              ),
                              // actions: [
                              //   TextButton(
                              //       onPressed: () {},
                              //       child: Text('Cancel order')),
                              //   TextButton(
                              //       onPressed: () {}, child: Text('Cancel')),
                              // ],
                            );
                          });
                      // await onTapButtonsShowLoading(() async {
                      //   bool yesNoRes = await cancelAlertDailog(
                      //       lang.strings['customer']
                      //               ['restaurant']['checkout']
                      //           ['cancelOrder'],
                      //       lang.strings['customer']
                      //               ['restaurant']['checkout']
                      //           ['cancelOrderConfirm'], () {
                      //     Get.back(result: true);
                      //   }, () {
                      //     Get.back(result: false);
                      //   });

                      //   if (yesNoRes) {
                      //     mezDbgPrint(
                      //         Get.parameters.toString());
                      //     ServerResponse resp =
                      //         await restaurantController
                      //             .cancelOrder(Get
                      //                 .parameters['orderId']!);
                      //     mezDbgPrint(resp.data.toString());
                      //     if (resp.success) {
                      //       Get.until((route) =>
                      //           route.settings.name ==
                      //           kHomeRoute);
                      //       mezcalmosSnackBar(
                      //           lang.strings["shared"]
                      //                   ["snackbars"]
                      //               ["titleSuccess"],
                      //           lang.strings["shared"]
                      //                   ["snackbars"]
                      //               ["orderCancelSuccess"],
                      //           position: SnackPosition.TOP);
                      //     } else {
                      //       mezcalmosSnackBar(
                      //           lang.strings["shared"]
                      //                   ["snackbars"]
                      //               ["titleFailed"],
                      //           lang.strings["shared"]
                      //                   ["snackbars"]
                      //               ["orderCancelFailed"],
                      //           position: SnackPosition.TOP);
                      //     }
                      //   }
                      //  });
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Cancel order'),
                    )),
              )
            : (widget.order.status == RestaurantOrderStatus.Delivered ||
                    widget.order.status == RestaurantOrderStatus.ReadyForPickup)
                ? Card(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Order Delivered',
                            style: txt.headline3,
                          )
                        ],
                      ),
                    ),
                  )
                : (widget.order.status ==
                            RestaurantOrderStatus.CancelledByCustomer ||
                        widget.order.status ==
                            RestaurantOrderStatus.CancelledByAdmin)
                    ? Card(
                        color: Colors.black,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cancel,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Order Canceled',
                                style: txt.headline3!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: null,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Cancel order'),
                        )));
  }
}
