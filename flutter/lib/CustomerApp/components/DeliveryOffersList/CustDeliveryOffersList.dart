import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/DeliveryOffersList/controllers/CustDeliveryOffersListController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/DeliveryOfferHelper.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class CustDeliveryOffersList extends StatefulWidget {
  const CustDeliveryOffersList({super.key, required this.deliveryOrderId});
  final int deliveryOrderId;

  @override
  State<CustDeliveryOffersList> createState() => _CustDeliveryOffersListState();
}

class _CustDeliveryOffersListState extends State<CustDeliveryOffersList> {
  CustDeliveryOffersListController _viewController =
      CustDeliveryOffersListController();
  @override
  void initState() {
    _viewController.init(orderId: widget.deliveryOrderId);
    super.initState();
  }

  @override
  void dispose() {
    _viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Card(
            margin: EdgeInsets.only(top: 15),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "Your offered delivery price",
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      Text(
                        _viewController.customerOffer.value?.toPriceString() ??
                            "-",
                        style: context.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      MezIconButton(
                        icon: Icons.add,
                        iconSize: 22,
                        padding: EdgeInsets.all(3),
                        onTap: () async {
                          await _viewController.updateCustomerOffer();
                        },
                      ),
                    ],
                  ),
                  smallSepartor,
                  Text(
                      "${_viewController.driversSawOfferCount} out of ${_viewController.notifiedDrivers.length} drivers have seen your order and not accepted it")
                ],
              ),
            ),
          ),
          if (_viewController.counterOffers.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                meduimSeperator,
                Text(
                  "Counter offers (${_viewController.counterOffers.length})",
                  style: context.textTheme.bodyLarge,
                ),
                smallSepartor,
                Column(
                  children: _viewController.counterOffers.entries
                      .map((MapEntry<int, CounterOffer> entry) {
                    final int key = entry.key;
                    final CounterOffer counterOffer = entry.value;

                    return Card(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (counterOffer.image != null)
                                Container(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: CachedNetworkImageProvider(
                                        counterOffer.image!),
                                  ),
                                ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      counterOffer.name ?? "error",
                                      style: context.textTheme.bodyLarge,
                                    ),
                                    Text(
                                        "Expires at: ${counterOffer.expiryTimeFormatted}"),
                                  ],
                                ),
                              ),
                              Text(
                                counterOffer.price.toPriceString(),
                                style: context.textTheme.bodyLarge,
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: MezInkwell(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 5),
                                  borderRadius: 5,
                                  backgroundColor: Colors.white,
                                  textColor: redAccentColor,
                                  borderColor: redAccentColor,
                                  onClick: () async {
                                    await _viewController.rejectOffer(id: key);
                                  },
                                  label: "Reject",
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: MezInkwell(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 5),
                                  borderRadius: 5,
                                  onClick: () async {
                                    await _viewController.acceptOffer(id: key);
                                  },
                                  label: "Accept",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
                  }).toList(),
                )
              ],
            ),
        ],
      );
    });
  }
}
