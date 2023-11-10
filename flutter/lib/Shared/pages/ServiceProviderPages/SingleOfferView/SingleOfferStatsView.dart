import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfEarningsView/components/InfOfferEarningCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/SingleOfferView/controllers/SingleOfferStatsViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

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
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: "Offer"),
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
                    "Influencers payouts",
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
            Text(
              "Transactions",
              style: context.textTheme.bodyLarge,
            ),
            meduimSeperator,
            Obx(
              () => Column(
                children:
                    List.generate(viewController.earnings.length, (int index) {
                  final InfEarning e = viewController.earnings[index];
                  return InfOfferEarningCard(
                    earning: e,
                    forServiceProvider: true,
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  MezCard _infPayoutCard(MapEntry<UserInfo, num> item, BuildContext context) {
    return MezCard(
      firstAvatarBgImage: CachedNetworkImageProvider(item.key.image),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.key.name,
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
        ],
      ),
      action: MezInkwell(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        label: "Pay",
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
                title: "Record ${item.key.name} payout",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Amount"),
                    smallSepartor,
                    TextFormField(
                      controller: viewController.infPayoutAmmount,
                      validator: (String? v) {
                        if (v == null || num.tryParse(v) == null) {
                          return "required valid number";
                        } else if (num.parse(v) > max) {
                          return "Max : $max";
                        }
                        return null;
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          suffixText: "\$",
                          helperText: "Max : ${max.toPriceString()} "),
                    ),
                    meduimSeperator,
                    if (max > 0)
                      MezButton(
                        label: "Record Payout",
                        onClick: () async {
                          final double? amount = double.tryParse(
                              viewController.infPayoutAmmount.text);
                          if (amount != null && amount < max) {
                            await viewController.recordInfPayout(
                                infId: item.key.hasuraId, context: context);
                            setState(() {});
                          } else {
                            showErrorSnackBar(
                                errorText: "Please enter a correct amount");
                          }
                        },
                      ),
                  ],
                ));
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
                    fit: FlexFit.tight,
                    child: Text("Total: " + item.value.toPriceString(),
                        style: context.textTheme.bodyLarge),
                  ),
                  VerticalDivider(),
                  Flexible(
                    child: Text(
                      "Paid: " + paid.toPriceString(hideZero: false),
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                  ),
                  VerticalDivider(),
                  Flexible(
                    child: Text(
                      "Unpaid: " + (item.value - paid).toPriceString(),
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
      label: "Record Influencer Sale",
      onClick: () async {
        showMezSheet(
          context: context,
          isScrollControlled: true,
          showCancel: true,
          title: "Record Influencer Sale",
          content: Form(
            key: viewController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Order total (after discount)"),
                smallSepartor,
                TextFormField(
                  controller: viewController.orderTotal,
                  validator: (String? v) {
                    if (v == null || num.tryParse(v) == null) {
                      return "required valid number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(suffixText: "\$"),
                ),
                meduimSeperator,
                Text("Discount"),
                smallSepartor,
                TextFormField(
                  controller: viewController.discountTxt,
                  validator: (String? v) {
                    if (v == null || num.tryParse(v) == null) {
                      return "required valid number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(suffixText: "\$"),
                ),
                meduimSeperator,
                Text("Influencer commission"),
                smallSepartor,
                TextFormField(
                  controller: viewController.infCommission,
                  validator: (String? v) {
                    if (v == null || num.tryParse(v) == null) {
                      return "required valid number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(suffixText: "\$"),
                ),
                meduimSeperator,
                Text("Influencer code"),
                smallSepartor,
                TextFormField(
                  controller: viewController.infCode,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "required";
                    }
                    return null;
                  },
                  // decoration: InputDecoration(suffixText: "\$"),
                ),
                MezButton(
                  label: "Record sale",
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
                "Total number of usages",
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
                          "Revenue",
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
                          "Cost",
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
            Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Icon(
                  Icons.info_outline,
                  size: 13.mezSp,
                ),
              ),
              WidgetSpan(child: hTinySepartor),
              TextSpan(
                  text:
                      "Cost refers to the amount of money lost as a result of discounts."),
            ]))
          ],
        ),
      ),
    );
  }
}
