import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["components"]["laundryProviderCard"];

class LaundryProviderCard extends StatefulWidget {
  final LaundryOrder order;
  String? laundryID;

  LaundryProviderCard({Key? key, required this.laundryID, required this.order})
      : super(key: key);

  @override
  State<LaundryProviderCard> createState() => _LaundryProviderCardState();
}

class _LaundryProviderCardState extends State<LaundryProviderCard> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  LaundryOrderController controller = Get.find<LaundryOrderController>();
  Laundry? laundry;
  bool btnClicked = false;
  @override
  void initState() {
    setState(() {
      btnClicked = false;
    });
    getLaundry();

    super.initState();
  }

  void getLaundry() async {
    if (widget.laundryID != null) {
      laundry = await laundryInfoController.getLaundry(widget.laundryID!);
      mezDbgPrint("Init laundry =====> $laundry");
    } else {
      laundry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '${_i18n()["laundry"]}',
              style: textTheme.bodyText1,
            ),
          ),
          Card(
            color: (btnClicked) ? Colors.grey.shade400 : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  width: 1.5,
                  color: (widget.order.laundry != null && !btnClicked)
                      ? Colors.green
                      : Colors.redAccent,
                )),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: (widget.order.laundry == null && !btnClicked)
                  ? () async {
                      setState(() {
                        btnClicked = true;
                      });
                      await Get.toNamed(kLaundriesListRoute,
                              arguments: widget.order)!
                          .then((value) {
                        if (value != null) {
                          controller
                              .assignLaundry(
                                  widget.order.orderId, value.info.id)
                              .whenComplete(() {
                            setState(() {
                              btnClicked = false;
                            });
                          });
                        } else {
                          setState(() {
                            btnClicked = false;
                          });
                        }
                      });
                    }
                  : null,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: (btnClicked)
                    ? Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      )
                    : (widget.order.laundry != null)
                        ? laundryInfoComponent(textTheme, context)
                        : noLaundryComponent(context, textTheme),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------ LOCAL COMPONENTS ---------//

  // CARD CONTENT WHEN THERE IS NO LAUNDRY ASSIGNED, LAUNDRY INFO  (LAUNDRY == NULL)
  Widget noLaundryComponent(BuildContext context, TextTheme textTheme) {
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
          '${_i18n()["noLaundry"]}',
          style: textTheme.bodyText1,
        ),
        Spacer(),
        Icon(Icons.arrow_forward)
      ],
    );
  }

// CARD CONTENT WHEN THERE IS LAUNDRY ASSIGNED, LAUNDRY INFO  (LAUNDRY != NULL)
  Widget laundryInfoComponent(TextTheme textTheme, BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage:
              CachedNetworkImageProvider(widget.order.laundry!.image),
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
                widget.order.laundry!.name,
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
  }
}
