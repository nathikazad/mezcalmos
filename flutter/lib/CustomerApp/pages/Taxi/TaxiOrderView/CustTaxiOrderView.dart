import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiOrderView/components/CustTaxiOfferCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiOrderView/controllers/CustTaxiOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/taxiOrderRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezIconButton.dart';

class CustTaxiOrderView extends StatefulWidget {
  const CustTaxiOrderView({super.key});

  static Future<void> navigate(
      {required int orderId, required TaxiRequest taxiRequest}) async {
    final String route =
        TaxiOrderRoutes.taxiOrderRoute.replaceFirst(":id", "$orderId");
    await MezRouter.toPath(route, arguments: {"taxiRequest": taxiRequest});
  }

  @override
  State<CustTaxiOrderView> createState() => _CustTaxiOrderViewState();
}

class _CustTaxiOrderViewState extends State<CustTaxiOrderView> {
  TaxiOrderViewController viewController = TaxiOrderViewController();
  @override
  void initState() {
    int? orderId = MezRouter.urlArguments["id"]?.asInt;
    TaxiRequest? taxiRequest =
        MezRouter.bodyArguments?["taxiRequest"] as TaxiRequest?;
    if (orderId != null || taxiRequest != null) {
      viewController.init(orderId: orderId!, taxiRequest: taxiRequest);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: "Order", backButtonGradient: false),
      body: Stack(
        children: [
          MGoogleMap(
            mGoogleMapController: viewController.mGoogleMapController,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.topCenter,
            child: _fromToCompoenent(context),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (viewController.selectedOffer == null)
                    _offersButton(context),
                  _getMiddleWidget(),
                  _getBottomWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getMiddleWidget() {
    if (viewController.selectedOffer != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: MezCard(
          radius: 25,
          action: MessageButton(
            withPadding: false,
            chatId: 1,
            onTap: () {},
          ),
          firstAvatarBgImage: CachedNetworkImageProvider(
              viewController.selectedOffer!.driverImage),
          content:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              viewController.selectedOffer!.driverName,
              style: context.textTheme.bodyLarge,
            ),
            Text(
                "${viewController.selectedOffer!.driverName} is on the way to pick you up"),
          ]),
        ),
      );
    } else
      return _routeInfoCard(context);
  }

  Widget _offersButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: viewController.offers.length > 0
                ? BorderSide(width: 2, color: primaryBlueColor)
                : BorderSide.none),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: InkWell(
          onTap: () {
            _offersSheet(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.taxi_alert,
                  color: viewController.hasOffers
                      ? primaryBlueColor
                      : Colors.black,
                ),
                hSmallSepartor,
                Text(
                  viewController.offers.length.toString(),
                  style: context.textTheme.bodyLarge?.copyWith(
                      color:
                          viewController.hasOffers ? primaryBlueColor : null),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _offersSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        builder: (BuildContext ctx) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Offers",
                  style: context.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(),
              Obx(
                () => Column(
                  children: List.generate(
                      viewController.offers.length,
                      (int index) => CustTaxiOfferCard(
                            assignDriverCallBack: (int driverId) async {
                              await viewController.assignDriver(
                                  driverId: driverId, context: context);
                            },
                            deleteOfferCallback: (int driverId) async {
                              await viewController.rejectOffer(
                                  driverId: driverId);
                            },
                            taxiOffer: viewController.offers[index],
                          )),
                ),
              ),
            ],
          );
        });
  }

  Column _fromToCompoenent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MezCard(
          elevation: 1,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          margin: const EdgeInsets.only(bottom: 10),
          content: Text.rich(
            TextSpan(children: [
              TextSpan(text: "From: ", style: context.textTheme.bodyLarge),
              TextSpan(
                text: "${viewController.taxiRequest!.from.address}",
              ),
            ]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        MezCard(
          elevation: 1,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          content: Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "To: ",
                style: context.textTheme.bodyLarge,
              ),
              TextSpan(
                text: "${viewController.taxiRequest!.to.address}",
              ),
            ]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget _routeInfoCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Flexible(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MezIconButton(
                        backgroundColor: Colors.transparent,
                        iconColor: Colors.black,
                        onTap: () {
                          viewController.decrementOffer();
                        },
                        icon: Icons.remove_circle_outline),
                    Obx(() => Text(
                          viewController.custOffer.value.toPriceString(),
                          style: context.textTheme.bodyLarge,
                        )),
                    MezIconButton(
                        backgroundColor: Colors.transparent,
                        iconColor: Colors.black,
                        onTap: () {
                          viewController.incrementOffer();
                        },
                        icon: Icons.add_circle_outline),
                  ],
                ),
              )),
              VerticalDivider(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_taxi),
                    Text(
                      "5",
                      style: context.textTheme.bodyLarge,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBottomWidget() {
    return Obx(() {
      if (viewController.selectedOffer != null) {
        return Container(
          margin:
              const EdgeInsets.only(bottom: 20, top: 5, right: 10, left: 10),
          child: MezButton(
            height: 50,
            backgroundColor: offRedColor,
            textColor: redAccentColor,
            label: "Cancel Order",
            onClick: () async {},
          ),
        );
      } else {
        return Card(
          child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        "Waiting for a taxi driver to accept your order.",
                        style: context.textTheme.bodyMedium,
                      )),
                  hSmallSepartor,
                  Tooltip(
                    message: "Cancel your order",
                    child: MezIconButton(
                      onTap: () async {},
                      icon: Icons.close,
                      iconColor: redAccentColor,
                      backgroundColor: offRedColor,
                    ),
                  ),
                ],
              )),
          margin: EdgeInsets.zero,
        );
      }
    });
  }
}
