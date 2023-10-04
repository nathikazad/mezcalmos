import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfDealsView/components/InfDealCard.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfDealsView/controllers/InfDealsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class InfDealsView extends StatefulWidget {
  const InfDealsView({super.key});

  @override
  State<InfDealsView> createState() => _InfDealsViewState();
}

class _InfDealsViewState extends State<InfDealsView> {
  InfDealsViewController viewController = InfDealsViewController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        title: "Deals",
        showNotifications: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _tagCard(context),
            Obx(() {
              if (viewController.currentOffers.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    bigSeperator,
                    Text(
                      "My offers",
                      style: context.textTheme.bodyLarge,
                    ),
                    meduimSeperator,
                    Column(
                      children: List.generate(
                          viewController.currentOffers.length,
                          (int index) => InfDealCard(
                                isPromoted: true,
                                offer: viewController.currentOffers[index],
                                onClick: () async {
                                  await viewController.unpromote(
                                      offerId: viewController
                                          .currentOffers[index].id);
                                },
                              )),
                    )
                  ],
                );
              } else {
                return Container();
              }
            }),
            Obx(() {
              if (viewController.openOffers.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    bigSeperator,
                    Text(
                      "Open offers",
                      style: context.textTheme.bodyLarge,
                    ),
                    meduimSeperator,
                    Column(
                      children: List.generate(
                          viewController.openOffers.length,
                          (int index) => InfDealCard(
                                isPromoted: false,
                                offer: viewController.openOffers[index],
                                onClick: () async {
                                  await viewController.promote(
                                      offerId:
                                          viewController.openOffers[index].id);
                                },
                              )),
                    )
                  ],
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(12),
                  child: Text("No offers available"),
                );
              }
            })
          ],
        ),
      ),
    );
  }

  Widget _tagCard(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Referral code"),
                  smallSepartor,
                  Text(
                    viewController.influencer.tag,
                    style: context.textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            MezIconButton(
              onTap: () {},
              icon: Icons.qr_code,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconColor: Colors.black,
              iconSize: 30,
            )
          ],
        ),
      ),
    );
  }
}
