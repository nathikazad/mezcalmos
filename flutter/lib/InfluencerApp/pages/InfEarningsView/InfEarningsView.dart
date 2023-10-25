import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/constants/influencerConstants.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfEarningsView/controllers/InfEarningsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["InfluencerApp"]
    ["Pages"]["InfEarningsView"];

class InfEarningsView extends StatefulWidget {
  const InfEarningsView({super.key});

  @override
  State<InfEarningsView> createState() => _InfEarningsViewState();
}

class _InfEarningsViewState extends State<InfEarningsView> {
  InfEarningsViewController viewController = InfEarningsViewController();

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
        title: "${_i18n()['earnings']}",
        showNotifications: true,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: IntrinsicHeight(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${_i18n()['totalEarnings']}"),
                            smallSepartor,
                            Obx(
                              () => Text(
                                viewController.totalEarnings
                                    .toPriceString(hideZero: false),
                                style: context.textTheme.displayLarge
                                    ?.copyWith(color: primaryBlueColor),
                              ),
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("${_i18n()['outstanding']}"),
                            smallSepartor,
                            Obx(
                              () => Text(
                                viewController.totalDiscounts
                                    .toPriceString(hideZero: false),
                                style: context.textTheme.displayLarge
                                    ?.copyWith(color: primaryBlueColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            meduimSeperator,
            Obx(() {
              if (viewController.earnings.isNotEmpty) {
                return Column(
                  children: <Widget>[
                    Column(
                      children: List.generate(viewController.earnings.length,
                          (int index) {
                        final InfEarning e = viewController.earnings[index];
                        return MezCard(
                            firstAvatarBgImage: CachedNetworkImageProvider(
                                e.customerInfo.image!),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  e.customerInfo.name!,
                                  style: context.textTheme.bodyLarge,
                                ),
                                Text(e.description),
                              ],
                            ));
                      }),
                    )
                  ],
                );
              } else {
                return Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        kNoEarningImg,
                        height: 70.mezW,
                        width: 50.mezW,
                      ),
                      meduimSeperator,
                      Text(
                        "${_i18n()['noEranings']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Text(
                        "${_i18n()['noEarningsSubtitle']}",
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
}
