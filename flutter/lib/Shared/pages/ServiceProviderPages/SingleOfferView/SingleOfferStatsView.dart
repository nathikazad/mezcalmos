import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/SingleOfferView/controllers/SingleOfferStatsViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/Influencer/InfOfferEarningCard.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["SingleOfferStatsView"];

class SingleOfferStatsView extends StatefulWidget {
  const SingleOfferStatsView({super.key});
  static void navigate({required int offerId}) {
    final String route = SharedServiceProviderRoutes.kSingleOfferStatsView
        .replaceFirst(":offerId", offerId.toString());
    MezRouter.toPath(route);
  }

  @override
  State<SingleOfferStatsView> createState() => _SingleOfferStatsViewState();
}

class _SingleOfferStatsViewState extends State<SingleOfferStatsView> {
  SingleOfferStatsViewController viewController =
      SingleOfferStatsViewController();

  @override
  void initState() {
    final int? offerId = MezRouter.urlArguments["offerId"]?.asInt;
    mezDbgPrint("Init 🇹🇳🇹🇳🇹🇳🇹🇳🇹🇳 ========>$offerId");
    if (offerId != null) {
      viewController.init(offerId: offerId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: _i18n()['backButtonTitle'],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _earningsCard(context),
            meduimSeperator,
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _i18n()['infPayouts'],
                    style: context.textTheme.bodyLarge,
                  ),
                  meduimSeperator,
                  Column(
                    children: List.generate(viewController.groupedByInf.length,
                        (int index) {
                      final MapEntry<UserInfo, num> item =
                          viewController.groupedByInf.entries.toList()[index];
                      return _infPayoutCard(item, context);
                    }),
                  ),
                ],
              ),
            ),
            meduimSeperator,
            _recordSaleButton(context),
            meduimSeperator,
            Obx(
              () => Row(
                children: <Widget>[
                  FilterChip(
                    label: Text(_i18n()['transactions']),
                    selected: viewController.isOrdersView,
                    onSelected: (bool v) {
                      viewController.switchOrdersPayments(
                          TransactionsPaymentsView.Orders);
                    },
                  ),
                  hSmallSepartor,
                  FilterChip(
                    label: Text(_i18n()['payouts']),
                    selected: viewController.isPaymentsView,
                    onSelected: (bool v) {
                      viewController.switchOrdersPayments(
                          TransactionsPaymentsView.Payments);
                    },
                  ),
                ],
              ),
            ),
            meduimSeperator,
            Obx(
              () {
                if (viewController.isOrdersView)
                  return _buildOrders();
                else
                  return _buildPayouts();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrders() {
    return Column(
      children: <Widget>[
        Column(
          children: List.generate(viewController.earnings.length, (int index) {
            final InfEarning e = viewController.earnings[index];
            return InfOfferEarningCard(
              earning: e,
              forServiceProvider: true,
            );
          }),
        ),
        if (!viewController.earningsReachedEndData)
          MezButton(
            label: "View more",
            onClick: () async {
              await viewController.fetchOfferEarnings();
            },
          )
      ],
    );
  }

  Widget _buildPayouts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: List.generate(viewController.payouts.length, (int index) {
            final InfPayout e = viewController.payouts[index];
            return MezCard(
              firstAvatarBgImage:
                  CachedNetworkImageProvider(e.influencerInfo.image),
              action: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("${_i18n()['youPaid']}: "),
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
                    e.influencerInfo.name,
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
          }),
        ),
        if (!viewController.payoutsReachedEndOfData)
          MezButton(
            label: "View more",
            onClick: () async {
              await viewController.fetchAllPayouts();
            },
          )
      ],
    );
  }

  MezCard _infPayoutCard(MapEntry<UserInfo, num> item, BuildContext context) {
    return MezCard(
      firstAvatarBgImage: CachedNetworkImageProvider(item.key.image),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.key.name.inCaps,
            style: context.textTheme.bodyLarge,
          ),
          Text(
            "${_i18n()['total']} : ${item.value.toPriceString()}",
          ),
        ],
      ),
      action: MezInkwell(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        label: _i18n()['recordPayout'],
        icon: Icons.payments,
        backgroundColor: secondaryLightBlueColor,
        textColor: primaryBlueColor,
        onClick: () async {
          final double? paid = await viewController.fetchInfluencerPayouts(
              influencerId: item.key.hasuraId);
          if (paid != null) {
            final double max = item.value - paid;
            showMezSheet(
              context: context,
              showCancel: true,
              title:
                  "${_i18n()['recordPayoutTitle'].replaceAll('{infName}', item.key.name)}",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_i18n()['amount']),
                  smallSepartor,
                  TextFormField(
                    controller: viewController.infPayoutAmmount,
                    validator: (String? v) {
                      if (v == null || num.tryParse(v) == null) {
                        return "${_i18n()['requiredValidNumber']}";
                      } else if (num.parse(v) > max) {
                        return "${_i18n()['maxAmount']} : $max";
                      }
                      return null;
                    },
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      suffixText: "\$",
                      helperText:
                          "${_i18n()['maxAmount']} : ${max.toPriceString()} ",
                    ),
                  ),
                  meduimSeperator,
                  if (max > 0)
                    MezButton(
                      label: _i18n()['recordPayout'],
                      onClick: () async {
                        final double? amount = double.tryParse(
                            viewController.infPayoutAmmount.text);
                        if (amount != null && amount < max) {
                          await viewController.recordInfPayout(
                              infId: item.key.hasuraId, context: context);
                          setState(() {});
                        } else {
                          showErrorSnackBar(
                              errorText: "${_i18n()['enterCorrectAmount']}");
                        }
                      },
                    ),
                ],
              ),
            );
          }
        },
      ),
      footer: FutureBuilder<double?>(
        future: viewController.fetchInfluencerPayouts(
            influencerId: item.key.hasuraId),
        builder: (BuildContext context, AsyncSnapshot<double?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the Future to complete
            return LinearProgressIndicator();
          } else if (snapshot.hasError) {
            // Show an error message if the Future fails
            return Text('Error: ${snapshot.error}');
          } else {
            // Show the result in a Text widget
            final double paid = snapshot.data ?? 0;
            return IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "${_i18n()['paid']} : ${paid.toPriceString(hideZero: false)}",
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                  ),
                  VerticalDivider(),
                  Flexible(
                    child: Text(
                      "${_i18n()['unpaid']} : ${(item.value - paid).toPriceString()}",
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
  }

  MezButton _recordSaleButton(BuildContext context) {
    return MezButton(
      label: "${_i18n()['recordSaleButton']}",
      onClick: () async {
        showMezSheet(
          context: context,
          isScrollControlled: true,
          showCancel: true,
          title: "${_i18n()['recordSale']}",
          content: Form(
            key: viewController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${_i18n()['orderTotal']}"),
                smallSepartor,
                TextFormField(
                  controller: viewController.orderTotal,
                  validator: (String? v) {
                    if (v == null || num.tryParse(v) == null) {
                      return "${_i18n()['requiredValidNumber']}";
                    }
                    return null;
                  },
                  decoration: InputDecoration(suffixText: "\$"),
                ),
                meduimSeperator,
                Text("${_i18n()['discount']}"),
                smallSepartor,
                TextFormField(
                  controller: viewController.discountTxt,
                  validator: (String? v) {
                    if (v == null || num.tryParse(v) == null) {
                      return "${_i18n()['requiredValidNumber']}";
                    }
                    return null;
                  },
                  decoration: InputDecoration(suffixText: "\$"),
                ),
                meduimSeperator,
                Text("${_i18n()['infCommission']}"),
                smallSepartor,
                TextFormField(
                  controller: viewController.infCommission,
                  validator: (String? v) {
                    if (v == null || num.tryParse(v) == null) {
                      return "${_i18n()['amount']} ${_i18n()['requiredValidNumber']}";
                    }
                    return null;
                  },
                  decoration: InputDecoration(suffixText: "\$"),
                ),
                meduimSeperator,
                Text("${_i18n()['infCode']}"),
                smallSepartor,
                TextFormField(
                  controller: viewController.infCode,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "${_i18n()['required']}";
                    }
                    return null;
                  },
                ),
                MezButton(
                  label: "${_i18n()['recordSale']}",
                  onClick: () async {
                    await viewController.recordSale(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _earningsCard(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                "${_i18n()['totalUsages']}",
                style: context.textTheme.bodyLarge,
              ),
            ),
            meduimSeperator,
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Obx(
                          () => Text(
                            "+ ${viewController.revenue.toPriceString()}",
                            style: context.textTheme.displayMedium
                                ?.copyWith(color: primaryBlueColor),
                          ),
                        ),
                        smallSepartor,
                        Text(
                          "${_i18n()['revenue']}",
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: primaryBlueColor),
                        )
                      ],
                    ),
                  ),
                  hBigSeperator,
                  VerticalDivider(),
                  hBigSeperator,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Obx(
                          () => Text(
                            "- ${viewController.loss.toPriceString()}",
                            style: context.textTheme.displayMedium
                                ?.copyWith(color: redAccentColor),
                          ),
                        ),
                        smallSepartor,
                        Text(
                          "${_i18n()['cost']}",
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: redAccentColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            meduimSeperator,
            Divider(
              thickness: 0.3,
            ),
            Text.rich(
              TextSpan(children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.info_outline,
                    size: 13.mezSp,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(
                  text: "${_i18n()['infoMessage']}",
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
