import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/OfferHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/ServiceOfferEditView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferView/controllers/ServiceOffersListViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezToggle.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServiceOfferView'];

class ServiceOffersListView extends StatefulWidget {
  const ServiceOffersListView({
    super.key,
    this.serviceProviderType,
    this.serviceProviderId,
    this.serviceLinkId,
  });

  final int? serviceProviderId;
  final int? serviceLinkId;
  final ServiceProviderType? serviceProviderType;
  @override
  State<ServiceOffersListView> createState() => _ServiceOffersListViewState();

  static Future<void> navigate(
      {required int serviceProviderId,
      required int? serviceLinkId,
      required ServiceProviderType serviceProviderType}) {
    mezDbgPrint("Arguments =============>$serviceProviderId \n $serviceLinkId");
    String route = SharedServiceProviderRoutes.kServiceOffersRoute
        .replaceFirst(":serviceProviderId", serviceProviderId.toString());
    if (serviceLinkId != null) {
      route = route.replaceFirst(":serviceLinkId", serviceLinkId.toString());
    }
    return MezRouter.toPath(route, arguments: <String, dynamic>{
      "serviceProviderType": serviceProviderType,
    });
  }
}

class _ServiceOffersListViewState extends State<ServiceOffersListView> {
  int? serviceProviderId;
  int? serviceLinkId;
  ServiceProviderType? serviceProviderType;
  ServiceOffersListViewController viewController =
      ServiceOffersListViewController();

  @override
  void initState() {
    _settingVariables();
    mezDbgPrint("Body args ::::::========>${MezRouter.urlArguments.asMap}");
    viewController.init(
        serviceProviderId: serviceProviderId!,
        serviceLinkId: serviceLinkId,
        serviceProviderType: serviceProviderType!);

    super.initState();
  }

  void _settingVariables() {
    serviceProviderId = widget.serviceProviderId ??
        int.tryParse(MezRouter.urlArguments["serviceProviderId"].toString());
    serviceLinkId = widget.serviceLinkId ??
        int.tryParse(MezRouter.urlArguments["serviceLinkId"].toString());

    serviceProviderType = widget.serviceProviderType ??
        MezRouter.bodyArguments?["serviceProviderType"] as ServiceProviderType;

    mezDbgPrint(
        "Body args ::::::========>$serviceProviderId $serviceLinkId $serviceProviderType");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: "${_i18n()['offers']}"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            MezAddButton(
              onClick: () async {
                final bool? needRefetch = await ServiceOfferEditView.navigate(
                  offerId: null,
                  serviceProviderId: serviceProviderId!,
                  serviceProviderType: serviceProviderType!,
                );
                if (needRefetch != null && needRefetch) {
                  await viewController.fetchServiceOffers();
                }
              },
              title: "${_i18n()['addOffer']}",
            ),
            Obx(
              () {
                if (viewController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    meduimSeperator,
                    Text(
                      "${_i18n()['activeOffers']}",
                      style: context.textTheme.bodyLarge,
                    ),
                    smallSepartor,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: viewController.activeOffers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _offerCard(
                            viewController.activeOffers[index], context);
                      },
                    ),
                    MezToggle(
                        title: "${_i18n()['inactiveOffers']}",
                        content: Column(
                          children: List.generate(
                              viewController.inActiveOffers.length,
                              (int index) {
                            return _offerCard(
                                viewController.inActiveOffers[index], context);
                          }),
                        ))
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  MezCard _offerCard(Offer offer, BuildContext context) {
    return MezCard(
      firstAvatarIcon: offer.icon,
      firstAvatarIconColor: offer.isActive ? primaryBlueColor : Colors.black,
      firstAvatarBgColor:
          offer.isActive ? secondaryLightBlueColor : Colors.grey.shade200,
      radius: 20,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            offer.couponCode != null
                ? "${offer.couponCode}"
                : "${offer.name?.getTranslation(userLanguage)}",
            style: context.textTheme.bodyLarge,
          ),
          if (offer.startDate != null && offer.endDate != null)
            Text(
                "${offer.startDate!.getOrderTime()} -> ${offer.endDate!.getOrderTime()}")
        ],
      ),
      action: Row(
        children: <Widget>[
          MezIconButton(
            icon: Icons.bar_chart,
            onTap: null,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            width: 5,
          ),
          MezIconButton(
            icon: Icons.edit,
            onTap: () async {
              final bool? needRefetch = await ServiceOfferEditView.navigate(
                offerId: offer.id.toInt(),
                serviceProviderId: serviceProviderId!,
                serviceProviderType: serviceProviderType!,
              );
              if (needRefetch != null && needRefetch) {
                await viewController.fetchServiceOffers();
              }
            },
          ),
        ],
      ),
    );
  }
}
