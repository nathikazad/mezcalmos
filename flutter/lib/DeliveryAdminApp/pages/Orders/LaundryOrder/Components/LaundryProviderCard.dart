import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryProviderCard extends StatefulWidget {
  final Order order;
  String? laundryID;
  Function(Laundry?) callBack;

  LaundryProviderCard(
      {Key? key,
      required this.laundryID,
      required this.callBack,
      required this.order})
      : super(key: key);

  @override
  State<LaundryProviderCard> createState() => _LaundryProviderCardState();
}

class _LaundryProviderCardState extends State<LaundryProviderCard> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  LaundryOrderController controller = Get.find<LaundryOrderController>();
  Laundry? laundry;
  @override
  void initState() {
    // TODO: implement initState
    mezDbgPrint("Laundry Provider ============> ${widget.laundryID}");
    getLaundry();
    mezDbgPrint("Laundry Provider ============> ${laundry}");

    super.initState();
  }

  getLaundry() async {
    if (widget.laundryID != null) {
      laundry = await laundryInfoController.getLaundry(widget.laundryID!);
      mezDbgPrint("Init laundry =====> $laundry");
    } else {
      laundry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Laundry',
              style: textTheme.bodyText1,
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  width: 1.5,
                  color: (widget.laundryID != null)
                      ? Colors.green
                      : Colors.redAccent,
                )),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: (widget.laundryID == null)
                  ? () async {
                      await Get.toNamed(kLaundriesListRoute,
                              arguments: widget.order)!
                          .then((value) {
                        if (value != null) {
                          controller.assignLaundry(
                              widget.order.orderId, value.info.id);
                        }
                      });
                    }
                  : null,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: (widget.laundryID != null)
                    ? driverInfoComponent(textTheme, context)
                    : noDriverComponent(context, textTheme),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------ LOCAL COMPONENTS ---------//
  Widget noDriverComponent(BuildContext context, TextTheme textTheme) {
    return Row(
      children: [
        Icon(
          Icons.local_laundry_service,
          color: Theme.of(context).primaryColorLight,
          size: 50,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Pick a laundry agency',
          style: textTheme.bodyText1,
        ),
        Spacer(),
        Icon(Icons.arrow_forward)
      ],
    );
  }

// CARD CONTENT WHEN THERE IS LAUNDRY ASSIGNED, LAUNDRY INFO  (LAUNDRY != NULL)
  Widget driverInfoComponent(TextTheme textTheme, BuildContext context) {
    return FutureBuilder<Laundry>(
        future: laundryInfoController.getLaundry(widget.laundryID!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      CachedNetworkImageProvider(snapshot.data!.info.image),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.info.name,
                        style: textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
