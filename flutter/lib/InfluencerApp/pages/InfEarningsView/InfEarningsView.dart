import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/InfluencerApp/constants/influencerConstants.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfEarningsView/components/InfOfferEarningCard.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfEarningsView/controllers/InfEarningsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
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
            return _buildEarningCards(context);
          }),
          Row(
            children: <Widget>[
              FilterChip(
                  label: Text("${_i18n()['refOrders']}"),
                  selected: viewController.isOrdersView,
                  onSelected: (bool v) {
                    viewController
                        .switchOrdersPayments(OrdersPaymentsView.Orders);
                  }),
              hSmallSepartor,
              FilterChip(
                  label: Text("${_i18n()['payments']}"),
                  selected: viewController.isPaymentsView,
                  onSelected: (bool v) {
                    viewController
                        .switchOrdersPayments(OrdersPaymentsView.Payments);
                  })
            ],
          ),
          Obx(() {
            if (viewController.isOrdersView)
              return _buildOrders(context);
            else
              return _buildPayouts(context);
          })
        ],
      ),
    );
  }

  Widget _buildOrders(BuildContext context) {
    if (viewController.earnings.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children:
                List.generate(viewController.earnings.length, (int index) {
              final InfEarning e = viewController.earnings[index];
              return InfOfferEarningCard(earning: e);
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
  }

  Widget _buildPayouts(BuildContext context) {
    if (viewController.payouts.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: List.generate(viewController.payouts.length, (int index) {
              final InfPayout e = viewController.payouts[index];
              return MezCard(
                firstAvatarBgImage:
                    CachedNetworkImageProvider(e.serviceInfo.image),
                action: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("${_i18n()['paidYou']}: "),
                    hSmallSepartor,
                    Text(
                      e.amount.toPriceString(),
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                  ],
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      e.serviceInfo.name,
                      style: context.textTheme.bodyLarge,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.watch_later_outlined,
                          size: 16,
                        ),
                        hTinySepartor,
                        Text(e.date.getOrderTime())
                      ],
                    ),
                  ],
                ),
              );
              //  return InfOfferEarningCard(earning: e);
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
              "${_i18n()['noPayouts']}",
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            Text(
              "${_i18n()['noPayoutsSubtitle']}",
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }
  }

  Column _buildEarningCards(BuildContext context) {
    return Column(
      children:
          List.generate(viewController.groupedByRestaurant.length, (int index) {
        final MapEntry<ServiceInfo, List<InfEarning>> data =
            viewController.groupedByRestaurant.entries.toList()[index];
        return MezCard(
          firstAvatarBgImage: CachedNetworkImageProvider(data.key.image),
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
            ],
          ),
          footer: FutureBuilder<double?>(
            future: viewController.fetchInfluencerPayouts(
                serviceId: data.key.hasuraId),
            builder: (BuildContext context, AsyncSnapshot<double?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final double paid = snapshot.data ?? 0;
                final num total = data.value.fold(
                    0,
                    (num sum, InfEarning infEarning) =>
                        sum + infEarning.comission);
                return IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("${_i18n()["total"]}: " + total.toPriceString(),
                          style: context.textTheme.bodyLarge),
                      Container(
                        width: 1.5,
                        color: Colors.grey.shade200,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Text(
                        "${_i18n()["paid"]}: " +
                            paid.toPriceString(hideZero: false),
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      ),
                      Container(
                        width: 1.5,
                        color: Colors.grey.shade200,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        //flex: 10,
                        child: Text(
                          "${_i18n()["unpaid"]}: " +
                              (total - paid).toPriceString(),
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: redAccentColor),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
