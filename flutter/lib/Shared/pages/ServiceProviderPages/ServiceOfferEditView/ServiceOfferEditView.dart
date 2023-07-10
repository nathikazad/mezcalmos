import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/controllers/ServiceOfferEditViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServiceOfferView'];

class ServiceOfferEditView extends StatefulWidget {
  const ServiceOfferEditView({
    super.key,
  });
  @override
  State<ServiceOfferEditView> createState() => _ServiceOfferEditViewState();

  static Future<void> navigate({
    required int? offerId,
  }) {
    final String route = SharedServiceProviderRoutes.kServiceEditOffersRoute
        .replaceFirst(":offerId", offerId.toString());
    return MezRouter.toPath(route, arguments: <String, dynamic>{
      "offerId": offerId,
    });
  }
}

class _ServiceOfferEditViewState extends State<ServiceOfferEditView> {
  ServiceOfferEditViewController viewController =
      ServiceOfferEditViewController();
  int? offerId;

  @override
  void initState() {
    super.initState();
    offerId = int.tryParse(MezRouter.urlArguments["offerId"].toString());
    viewController.init(
      offerId: offerId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: MezRouter.back,
            title: viewController.isEditMode.value
                ? viewController.currentOffer!.value!.name.toString()
                : "Add Offer"),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Select your offer",
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              Builder(builder: (context) {
                return MezStringDropDown(
                  labelText: "Select your offer",
                  langPath: _i18n(),
                  items: [OfferType.Coupon, OfferType.Promotion]
                      .map((e) => e.toFirebaseFormatString())
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    viewController.selectedOfferType.value =
                        value.toOfferType();
                  },
                );
              }),
              if (viewController.selectedOfferType.value == OfferType.Coupon)
                Column(),
              if (viewController.selectedOfferType.value == OfferType.Promotion)
                Column(),
            ],
          ),
        ),
      ),
    );
  }
}
