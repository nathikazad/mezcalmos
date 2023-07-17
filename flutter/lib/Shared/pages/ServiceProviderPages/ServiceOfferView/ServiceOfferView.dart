import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/ServiceOfferEditView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferView/controllers/ServiceOfferViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServiceOfferView'];

class ServiceOfferView extends StatefulWidget {
  const ServiceOfferView({
    super.key,
    this.serviceProviderType,
    this.serviceProviderId,
    this.serviceLinkId,
  });

  final int? serviceProviderId;
  final int? serviceLinkId;
  final ServiceProviderType? serviceProviderType;
  @override
  State<ServiceOfferView> createState() => _ServiceOfferViewState();

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

class _ServiceOfferViewState extends State<ServiceOfferView> {
  int? serviceProviderId;
  int? serviceLinkId;
  ServiceProviderType? serviceProviderType;
  ServiceOfferViewController viewController = ServiceOfferViewController();

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
          children: [
            MezAddButton(
              onClick: () async {
                await ServiceOfferEditView.navigate(
                  offerId: null,
                  serviceProviderId: serviceProviderId!,
                  serviceProviderType: serviceProviderType!,
                );
              },
              title: "${_i18n()['addOffer']}",
            ),
            Obx(
              () {
                if (viewController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: viewController.serviceOffers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                          "${viewController.serviceOffers[index].couponCode}"),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          final bool? needRefetch =
                              await ServiceOfferEditView.navigate(
                            offerId:
                                viewController.serviceOffers[index].id.toInt(),
                            serviceProviderId: serviceProviderId!,
                            serviceProviderType: serviceProviderType!,
                          );
                          mezDbgPrint("needRefetch $needRefetch");
                          if (needRefetch != null && needRefetch) {
                            await viewController.fetchServiceOffers();
                          }
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
