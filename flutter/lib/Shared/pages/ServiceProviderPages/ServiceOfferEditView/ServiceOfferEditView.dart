import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/ServiceOfferHelpers.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/controllers/ServiceOfferEditViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezPeriodPicker/MezPeriodPicker.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';
import 'package:sizer/sizer.dart';

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
    required int serviceProviderId,
    required ServiceProviderType serviceProviderType,
  }) {
    final String route = SharedServiceProviderRoutes.kServiceEditOffersRoute
        .replaceFirst(":offerId", offerId.toString());
    return MezRouter.toPath(route, arguments: <String, dynamic>{
      "offerId": offerId,
      "serviceProviderId": serviceProviderId,
      "serviceProviderType": serviceProviderType,
    });
  }
}

class _ServiceOfferEditViewState extends State<ServiceOfferEditView> {
  ServiceOfferEditViewController viewController =
      ServiceOfferEditViewController();
  int? offerId;
  int? serviceProviderId;
  late ServiceProviderType serviceProviderType;

  @override
  void initState() {
    super.initState();
    offerId = int.tryParse(MezRouter.bodyArguments!["offerId"].toString());
    serviceProviderId =
        int.tryParse(MezRouter.bodyArguments!["serviceProviderId"].toString());
    serviceProviderType =
        MezRouter.bodyArguments!["serviceProviderType"] as ServiceProviderType;

    mezDbgPrint(
        "Body args ::::::========>$serviceProviderId $offerId $serviceProviderType");
    viewController.init(
      offerId: offerId,
      serviceProviderId: serviceProviderId!,
      serviceProviderType: serviceProviderType,
    );
  }

  void showAvailability() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return MezPeriodPicker(
          startDate: DateTime.now(),
          numberOfDaysInterval: 0,
          serviceSchedule: Schedule(openHours: {}),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: MezRouter.back,
            title: viewController.currentOffer.value != null
                ? viewController.currentOffer.value!.name!.getTranslation(
                    Get.find<LanguageController>().userLanguageKey)
                : "Add Offer"),
        bottomNavigationBar: MezButton(
          borderRadius: 0,
          label: viewController.isEditMode.value ? "Update" : "Add",
          withGradient: true,
          onClick: () async {
            await viewController.save();
          },
        ),
        body: viewController.currentOffer.value == null &&
                viewController.isEditMode.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: viewController.formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          value: viewController.selectedOfferType.value
                              ?.toFirebaseFormatString(),
                          items: [OfferType.Coupon, OfferType.Promotion]
                              .map((e) => e.toFirebaseFormatString())
                              .toList(),
                          icons: [Icons.local_offer, Icons.attach_money],
                          onChanged: (value) {
                            if (value == null) return;
                            viewController.selectedOfferType.value =
                                value.toOfferType();
                          },
                        );
                      }),
                      Text(
                        "Coupon Code",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      TextFormField(
                        controller: viewController.offerNameController,
                        decoration: InputDecoration(
                          hintText: "Enter your Coupon Code",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Coupon Code";
                          }
                          return null;
                        },
                      ),
                      smallSepartor,
                      Text(
                        "Select type of order",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      MezStringDropDown(
                        labelText: "Select your offer",
                        langPath: _i18n(),
                        value: viewController.selectedOfferOrderType.value
                            ?.toFirebaseFormatString(),
                        items: OfferOrderType.values
                            .map((e) => e.toFirebaseFormatString())
                            .toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          viewController.selectedOfferOrderType.value =
                              value.toOfferOrderType();
                        },
                      ),
                      Text(
                        "Discount type",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Row(
                        children: [
                          Expanded(
                            child: MezStringDropDown(
                              labelText: "Select discount type",
                              value: viewController.selectedDiscountType.value
                                  .toFirebaseFormatString(),
                              langPath: _i18n(),
                              items: [
                                DiscountType.FlatAmount,
                                DiscountType.Percentage,
                                DiscountType.AnotherSameFlat
                              ].map((e) => e.toFirebaseFormatString()).toList(),
                              onChanged: (value) {
                                if (value == null) return;
                                viewController.selectedDiscountType.value =
                                    value.toDiscountType();
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: viewController.discountController,
                              decoration: InputDecoration(
                                hintText: "0",
                                suffixIcon:
                                    viewController.selectedDiscountType.value ==
                                            DiscountType.Percentage
                                        ? Text("%")
                                        : Text("\$"),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your Coupon Code";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      smallSepartor,
                      Text(
                        "Select your availability",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      InkWell(
                        onTap: () async {
                          showAvailability();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.access_time_filled),
                              viewController.selectedStartDate.value != null &&
                                      viewController.selectedEndDate.value !=
                                          null
                                  ? Text(
                                      "${viewController.selectedStartDate.value!.getEstimatedTime()}")
                                  : Text(
                                      "Select your time",
                                    ),
                            ],
                          ),
                        ),
                      ),
                      smallSepartor,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Repeat this offer every week",
                            style: context.textTheme.bodyLarge,
                          ),
                          Switch(
                            value: viewController.repeatOffer.value,
                            onChanged: (value) {
                              viewController.repeatOffer.value = value;
                            },
                          )
                        ],
                      ),
                      if (viewController.selectedOfferType.value ==
                          OfferType.Coupon)
                        Column(),
                      if (viewController.selectedOfferType.value ==
                          OfferType.Promotion)
                        Column(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
