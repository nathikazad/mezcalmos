import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryOrderFromToComponent extends StatefulWidget {
  /// shows order from info (service provider name image and adress) and destination info  (customer name image and adress)
  /// inside the delivery driver order(laundry order) screen bottom card
  const LaundryOrderFromToComponent({
    Key? key,
    required this.order,
  }) : super(key: key);
  final LaundryOrder order;

  @override
  State<LaundryOrderFromToComponent> createState() =>
      _LaundryOrderFromToComponentState();
}

class _LaundryOrderFromToComponentState
    extends State<LaundryOrderFromToComponent> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();

  Laundry? laundry;

  @override
  void initState() {
    getLaundry();
    super.initState();
  }

  void getLaundry() async {
    if (widget.order.laundry != null) {
      await laundryInfoController
          .getLaundry(widget.order.laundry!.id)
          .then((Laundry value) {
        setState(() {
          laundry = value;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<Widget> fromToWidgets = [
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage:
                CachedNetworkImageProvider(widget.order.laundry?.image ?? ''),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.order.laundry?.name ?? 'Laundry Agency',
                  style: textTheme.bodyText1,
                ),
                Text(
                  laundry?.info.location?.address ?? '',
                  style: textTheme.subtitle1,
                ),
              ],
            ),
          )
        ],
      ),
      Container(
        height: 30,
        width: 3,
        margin: EdgeInsets.only(left: 16),
        color: Colors.grey.shade500,
      ),
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage:
                CachedNetworkImageProvider(widget.order.customer.image),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.order.customer.name,
                  style: textTheme.bodyText1,
                ),
                Text(
                  widget.order.to.address,
                  style: textTheme.subtitle1,
                ),
              ],
            ),
          )
        ],
      ),
    ];
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (widget.order.getCurrentPhase() == LaundryOrderPhase.Dropoff)
            ? fromToWidgets
            : fromToWidgets.reversed.toList());
  }
}
