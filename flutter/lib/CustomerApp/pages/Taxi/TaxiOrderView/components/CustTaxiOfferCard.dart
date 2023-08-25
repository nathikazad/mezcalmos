import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiOrderView/controllers/CustTaxiOrderViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezIconButton.dart';

class CustTaxiOfferCard extends StatefulWidget {
  final CustomerTaxiOffer taxiOffer;
  final Future<void> Function(int driverId) assignDriverCallBack;
  final Future<void> Function(int driverId) deleteOfferCallback;

  const CustTaxiOfferCard(
      {required this.taxiOffer,
      required this.assignDriverCallBack,
      required this.deleteOfferCallback});

  @override
  _CustTaxiOfferCardState createState() => _CustTaxiOfferCardState();
}

class _CustTaxiOfferCardState extends State<CustTaxiOfferCard> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(widget.taxiOffer.driverImage),
                  radius: 20,
                ),
                SpinKitRing(
                  color: primaryBlueColor,
                  lineWidth: 3,
                  size: 40 + 2,
                ),
              ],
            ),
            hTinySepartor,
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.taxiOffer.driverName}',
                    style: context.textTheme.bodyLarge,
                  ),
                  Text(
                      'Expires: ${widget.taxiOffer.expiryTime.getEstimatedTime()}'),
                ],
              ),
            ),
            hSmallSepartor,
            Text(
              widget.taxiOffer.price.toPriceString(),
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: primaryBlueColor),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MezInkwell(
                    label: "Accept",
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    onClick: () async {
                      await widget.assignDriverCallBack
                          .call(widget.taxiOffer.id);
                    },
                  ),
                  hSmallSepartor,
                  MezIconButton(
                    onTap: () async {
                      await widget.deleteOfferCallback
                          .call(widget.taxiOffer.id);
                    },
                    icon: Icons.close,
                    padding: const EdgeInsets.all(5),
                    iconColor: redAccentColor,
                    backgroundColor: offRedColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
