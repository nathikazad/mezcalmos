import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/constants/influencerConstants.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfDealsView/components/InfDealCard.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfDealsView/controllers/InfDealsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["InfluencerApp"]
    ["Pages"]["InfDealssView"];

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
        title: "${_i18n()['deals']}",
        showNotifications: true,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
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
                      "${_i18n()['myOffers']}",
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
                return SizedBox();
              }
            }),
            Obx(() {
              if (viewController.openOffers.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    bigSeperator,
                    Text(
                      "${_i18n()['openOffers']}",
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
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        kNoDealsImg,
                        height: 70.mezW,
                        width: 50.mezW,
                      ),
                      meduimSeperator,
                      Text(
                        "${_i18n()['noDeals']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Text(
                        "${_i18n()['noDealsText']}",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
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
                  Text("${_i18n()['refCode']}"),
                  smallSepartor,
                  Text(
                    viewController.influencer.tag,
                    style: context.textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            MezIconButton(
              onTap: () {
                showMezSheet(
                    context: context,
                    title: "${_i18n()['refTitle']}",
                    content: Column(
                      children: <Widget>[
                        bigSeperator,
                        bigSeperator,
                        Row(
                          children: <Widget>[
                            Expanded(child: Divider()),
                            hTinySepartor,
                            Text("${_i18n()['or']}"),
                            hTinySepartor,
                            Expanded(child: Divider()),
                          ],
                        ),
                        meduimSeperator,
                        Row(
                          children: <Widget>[
                            Flexible(
                                flex: 1,
                                child: MezButton(
                                  height: 50,
                                  label: "${_i18n()['copyLink']}",
                                  backgroundColor: Colors.white,
                                  textColor: primaryBlueColor,
                                  textStyle: context.textTheme.bodyMedium
                                      ?.copyWith(color: primaryBlueColor),
                                  borderColor: primaryBlueColor,
                                  icon: Icons.link,
                                  onClick: () async {},
                                )),
                            hMeduimSeperator,
                            Flexible(
                                flex: 2,
                                child: MezButton(
                                  height: 50,
                                  label: "${_i18n()['downloadedQr']}",
                                  textStyle: context.textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white),
                                  icon: Icons.download,
                                  onClick: () async {},
                                )),
                          ],
                        )
                      ],
                    ));
              },
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
