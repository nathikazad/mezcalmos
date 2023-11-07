import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfEarningsView/components/InfOfferEarningCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/SingleOfferView/controllers/SingleOfferStatsViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

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
          children: <Widget>[
            _earningsCard(context),
            meduimSeperator,
            _recordSaleButton(context),
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
                Text("Order total"),
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
                meduimSeperator,
                MezButton(
                  label: "Record sale",
                  onClick: () async {
                    await viewController.recordSale();
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
