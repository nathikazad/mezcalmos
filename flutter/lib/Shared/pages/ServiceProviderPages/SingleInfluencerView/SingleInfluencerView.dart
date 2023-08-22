import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfluencersView/models/InfluenceFakeModel.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/SingleInfluencerView/controllers/SingleInfluencerViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezToggle.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["SingleInfluencerView"];

class SingleInfluencerView extends StatefulWidget {
  const SingleInfluencerView({super.key});
  static void navigate({required int influencerId}) {
    final String route = SharedServiceProviderRoutes.kSinglefluencerView
        .replaceFirst(":id", "$influencerId");
    MezRouter.toPath(
      route,
    );
  }

  @override
  State<SingleInfluencerView> createState() => _SingleInfluencerViewState();
}

class _SingleInfluencerViewState extends State<SingleInfluencerView> {
  SingleInfluencerViewController viewController =
      SingleInfluencerViewController();
  @override
  void initState() {
    final int? influencerId = MezRouter.urlArguments["id"]?.asInt;
    if (influencerId != null) {
      viewController.init(id: influencerId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      bottomNavigationBar: _footer(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notif) {
          viewController.handleScroll(notif);
          return false;
        },
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              Text(
                "Platforms",
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    viewController.influencer!.platforms.length,
                    (int index) => _socialPlatfromCard(index, context)),
              ),
              meduimSeperator,
              Text(
                "Pricing",
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    viewController.influencer!.prices.length,
                    (int index) => _pricingCard(index, context)),
              ),
              meduimSeperator,
              Row(
                children: [
                  Text(
                    "Sales increases",
                    style: context.textTheme.bodyLarge,
                  ),
                  hTinySepartor,
                  Text(
                    "+${viewController.influencer!.totalSalesIncrease.toPriceString()}",
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: primaryBlueColor),
                  ),
                ],
              ),
              smallSepartor,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    viewController.influencer!.saleIncreases.length,
                    (int index) => _saleIncreaseCard(
                        viewController.influencer!.saleIncreases[index],
                        context)),
              ),
              meduimSeperator,
              _reviews(context),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footer() {
    return Obx(() => Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        decoration: BoxDecoration(
          color: secondaryLightBlueColor,
        ),
        child: viewController.influencer!.state == InfluencerState.Partner
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.check_circle,
                      color: primaryBlueColor,
                    )),
                    WidgetSpan(child: hTinySepartor),
                    TextSpan(
                        text: "You’re already partners",
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: primaryBlueColor)),
                  ])),
                  MezInkwell(
                    label: "Cancel",
                    textColor: redAccentColor,
                    onClick: () async {},
                    backgroundColor: Colors.white,
                  ),
                ],
              )
            : SizedBox()));
  }

  AppBar _appbar(BuildContext context) {
    return MezcalmosAppBar(AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        backButtonGradient: false,
        bgColor: context.theme.scaffoldBackgroundColor,
        actionIcons: [
          Obx(() => viewController.showTitle.isTrue
              ? _messageBtn(elevetaion: 0)
              : SizedBox()),
        ],
        titleWidget: Obx(() => viewController.showTitle.isTrue
            ? Text(viewController.influencer!.name)
            : SizedBox()));
  }

  MezToggle _reviews(BuildContext context) {
    return MezToggle(
        title: "Reviews",
        titleWidget: Text.rich(TextSpan(children: [
          TextSpan(text: "Reviews", style: context.textTheme.bodyLarge),
          WidgetSpan(child: hTinySepartor),
          WidgetSpan(
            child: Icon(
              Icons.star_rate_rounded,
              color: primaryBlueColor,
            ),
          ),
          TextSpan(
              text: "${viewController.influencer!.rate.toStringAsFixed(1)}",
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: primaryBlueColor)),
          WidgetSpan(child: hTinySepartor),
          TextSpan(
              text: "(${viewController.influencer!.reviews.length})",
              style: context.textTheme.bodyMedium),
        ])),
        content: Column(
          children: List.generate(
              viewController.influencer!.reviews.length,
              (int index) => ReviewCard(
                  review: viewController.influencer!.reviews[index])),
        ));
  }

  Widget _saleIncreaseCard(SalesIncrease sale, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(sale.serviceImage),
            radius: 20,
          ),
          hSmallSepartor,
          Text(sale.serviceName),
          hSmallSepartor,
          Text(
            "+${sale.increaseValue.toPriceString()}",
            style:
                context.textTheme.bodyLarge?.copyWith(color: primaryBlueColor),
          ),
        ]),
      ),
    );
  }

  Widget _pricingCard(int index, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(children: [
          Icon(
            viewController.influencer!.prices.keys.toList()[index].icon,
            color: Colors.grey.shade800,
            size: 20,
          ),
          hSmallSepartor,
          Text(
              "${_i18n()['${viewController.influencer!.prices.keys.toList()[index].name}']}"),
          hSmallSepartor,
          Text(
            viewController.influencer!.prices.values
                .toList()[index]
                .toPriceString(),
            style: context.textTheme.bodyLarge?.copyWith(),
          ),
        ]),
      ),
    );
  }

  Widget _socialPlatfromCard(int index, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Row(children: [
            Icon(
              viewController.influencer!.platforms.keys.toList()[index].icon,
              color: Colors.grey.shade800,
              size: 20,
            ),
            hSmallSepartor,
            Text(viewController.influencer!.platforms.keys.toList()[index].name,
                style: context.textTheme.bodyMedium),
            hTinySepartor,
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                  viewController.influencer!.platforms.values
                      .toList()[index]
                      .toCount,
                  style: context.textTheme.bodyLarge),
            ),
            Icon(
              Icons.open_in_new,
              color: Colors.black,
            )
          ]),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 47,
              backgroundColor: primaryBlueColor,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: CachedNetworkImageProvider(
                    viewController.influencer!.image),
              ),
            ),
            hSmallSepartor,
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewController.influencer!.name,
                              style: context.textTheme.bodyLarge,
                            ),
                            Text(
                              "@" + viewController.influencer!.username,
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      _messageBtn()
                    ],
                  ),
                  smallSepartor,
                  Text.rich(
                      TextSpan(children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.place_outlined,
                            size: 18,
                          ),
                        ),
                        WidgetSpan(child: hTinySepartor),
                        TextSpan(
                          text: "Puerto Escondido, Oaxaca, Mexico",
                        ),
                      ]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                ],
              ),
            ),
          ],
        ),
        smallSepartor,
        Text(viewController.influencer!.description),
        Wrap(
          spacing: 2,
          runSpacing: 3,
          children: List.generate(
              viewController.influencer!.categories.length,
              (int index) => Chip(
                  padding: EdgeInsets.all(3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  labelStyle: context.textTheme.bodyMedium,
                  backgroundColor: Colors.grey.shade200,
                  label:
                      Text(viewController.influencer!.categories[index].name))),
        ),
        Divider(
          thickness: 0.3,
          height: 26,
        ),
      ],
    );
  }

  MezIconButton _messageBtn({double elevetaion = 0.5}) {
    return MezIconButton(
      onTap: () {},
      icon: Icons.textsms,
      elevation: elevetaion,
      iconSize: 25,
      backgroundColor: Colors.transparent,
    );
  }
}
