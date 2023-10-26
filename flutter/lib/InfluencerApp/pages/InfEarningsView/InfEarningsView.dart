import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/InfluencerApp/constants/influencerConstants.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfEarningsView/controllers/InfEarningsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
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
        body: Obx(() {
          if (viewController.isFetching) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          return _buildBody(context);
        }));
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
                    // VerticalDivider(),
                    // Flexible(
                    //   fit: FlexFit.tight,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     children: <Widget>[
                    //       Text("${_i18n()['outstanding']}"),
                    //       smallSepartor,
                    //       Obx(
                    //         () => Text(
                    //           viewController.totalDiscounts
                    //               .toPriceString(hideZero: false),
                    //           style: context.textTheme.displayLarge
                    //               ?.copyWith(color: primaryBlueColor),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          meduimSeperator,
          Obx(() {
            if (viewController.groupedByRestaurant.isEmpty) {
              return SizedBox();
            }
            return Column(
              children: List.generate(viewController.groupedByRestaurant.length,
                  (int index) {
                final MapEntry<ServiceInfo, List<InfEarning>> data =
                    viewController.groupedByRestaurant.entries.toList()[index];
                return MezCard(
                    firstAvatarBgImage:
                        CachedNetworkImageProvider(data.key.image),
                    action: Row(
                      children: <Widget>[
                        MezIconButton(
                            backgroundColor: Colors.green.shade100,
                            iconColor: Colors.green,
                            onTap: () async {
                              await viewController.callWhatsapp(
                                  phone: data.key.phoneNumber);
                            },
                            icon: Ionicons.logo_whatsapp),
                        hMeduimSeperator,
                        MezIconButton(
                            onTap: () async {
                              await viewController.openGmaps(data.key.location);
                            },
                            icon: Ionicons.map),
                      ],
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data.key.name,
                          style: context.textTheme.bodyLarge,
                        ),
                        Text(
                          data.value
                              .fold(
                                  0,
                                  (num sum, InfEarning infEarning) =>
                                      sum + infEarning.comission)
                              .toPriceString(),
                          style: context.textTheme.bodyLarge,
                        ),
                      ],
                    ));
              }),
            );
          }),
          meduimSeperator,
          Obx(() {
            if (viewController.earnings.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${_i18n()['refOrders']}",
                    style: context.textTheme.bodyLarge,
                  ),
                  meduimSeperator,
                  Column(
                    children: List.generate(viewController.earnings.length,
                        (int index) {
                      final InfEarning e = viewController.earnings[index];
                      return MezCard(
                          action: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "+${e.comission.toPriceString()}",
                              style: context.textTheme.displayMedium
                                  ?.copyWith(color: primaryBlueColor),
                            ),
                          ),
                          firstAvatarBgImage:
                              CachedNetworkImageProvider(e.customerInfo.image!),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                e.customerInfo.name!,
                                style: context.textTheme.bodyLarge,
                              ),
                              Text.rich(TextSpan(children: <InlineSpan>[
                                WidgetSpan(
                                  child: Icon(
                                    Icons.food_bank,
                                    size: 17,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                WidgetSpan(child: hTinySepartor),
                                TextSpan(text: e.serviceInfo.name),
                              ])),
                              Text.rich(TextSpan(children: <InlineSpan>[
                                WidgetSpan(
                                  child: Icon(
                                    Icons.attach_money,
                                    size: 17,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                WidgetSpan(child: hTinySepartor),
                                TextSpan(
                                    text:
                                        "Order Total : ${e.orderTotal.toPriceString()}"),
                              ])),
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
    );
  }
}
