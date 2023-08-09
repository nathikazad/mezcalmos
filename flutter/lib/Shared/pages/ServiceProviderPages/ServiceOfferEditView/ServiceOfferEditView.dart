import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpDateTimePicker.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/ServiceOfferHelpers.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/OfferItemsSelectView/OfferItemsSelectView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/controllers/ServiceOfferEditViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServiceOfferView'];

class ServiceOfferEditView extends StatefulWidget {
  const ServiceOfferEditView({
    super.key,
  });
  @override
  State<ServiceOfferEditView> createState() => _ServiceOfferEditViewState();

  static Future<bool?> navigate({
    required int? offerId,
    required int serviceProviderId,
    required ServiceProviderType serviceProviderType,
  }) async {
    final String route = SharedServiceProviderRoutes.kServiceEditOffersRoute
        .replaceFirst(":offerId", offerId.toString());
    await MezRouter.toPath(route, arguments: <String, dynamic>{
      "offerId": offerId,
      "serviceProviderId": serviceProviderId,
      "serviceProviderType": serviceProviderType,
    });
    return MezRouter.backResult;
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

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
          MezRouter.back(backResult: viewController.shouldRefetch);
        },
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
                      Builder(builder: (BuildContext context) {
                        return MezStringDropDown(
                          labelText: "Select your offer",
                          langPath: _i18n(),
                          value: viewController.selectedOfferType.value
                              ?.toFirebaseFormatString(),
                          items: [
                            OfferType.Coupon,
                            OfferType.Promotion,
                            //     OfferType.MonthlySubscription
                          ]
                              .map((OfferType e) => e.toFirebaseFormatString())
                              .toList(),
                          icons: [
                            Icons.discount_rounded,
                            Icons.attach_money,
                            //  Icons.workspace_premium_rounded
                          ],
                          validator: (String? value) {
                            if (value == null ||
                                viewController.selectedOfferType.value ==
                                    null) {
                              return "Please select your offer";
                            }
                            return null;
                          },
                          onChanged: (String? value) {
                            if (value == null) return;
                            viewController.switchOfferType(value.toOfferType());
                          },
                        );
                      }),
                      meduimSeperator,
                      Obx(
                        () => Text(
                          viewController.isCoupon ? "Coupon Code" : "Name",
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      smallSepartor,
                      TextFormField(
                        controller: viewController.offerNameController,
                        decoration: InputDecoration(
                          hintText: viewController.isCoupon
                              ? "Enter your Coupon Code"
                              : "Enter your promotion name",
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      meduimSeperator,
                      Text(
                        "Select type of order",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      MezStringDropDown(
                        labelText: "Select your offer",
                        langPath: Get.find<LanguageController>()
                            .strings['Shared']['pages']['ServiceOfferView'],
                        value: viewController.selectedOfferOrderType.value
                            ?.toFirebaseFormatString(),
                        items: [
                          OfferOrderType.AnyOrder.toFirebaseFormatString(),
                          OfferOrderType.FirstOrderOnly.toFirebaseFormatString()
                        ],
                        onChanged: (String? value) async {
                          viewController.selectedOfferOrderType.value =
                              value!.toOfferOrderType();
                        },
                      ),
                      meduimSeperator,
                      Text(
                        "Items",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      if (viewController.selectedItems.isEmpty &&
                          viewController
                                  .currentOffer.value?.details.items?.isEmpty ==
                              true)
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.check_circle_rounded,
                                    color: primaryBlueColor,
                                  )),
                                  WidgetSpan(child: hTinySepartor),
                                  TextSpan(
                                      text: "All items",
                                      style: context.textTheme.bodyLarge)
                                ]),
                              ),
                              smallSepartor,
                              Text(
                                "No particular items have been selected this offer will be applied to all items",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                      MezAddButton(
                        btnHeight: 45,
                        onClick: () async {
                          final List<OfferItemData>? data =
                              await OfferItemsSelectView.navigate(
                                  selectedItems: viewController.selectedItems
                                      .map(
                                          (OfferItemData element) => element.id)
                                      .toList(),
                                  serviceProviderId: serviceProviderId!,
                                  serviceProviderType: serviceProviderType);

                          if (data != null) {
                            viewController.selectedItems.value = data;
                          }
                        },
                        title: "Select items",
                      ),
                      if (viewController.currentOffer.value?.details.items
                                  ?.isNotEmpty ==
                              true &&
                          viewController.selectedItems.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(12),
                          alignment: Alignment.center,
                          child: Text(
                            "Offer applied to ${viewController.currentOffer.value!.details.items?.length} items click select items to manage items",
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge
                                ?.copyWith(color: primaryBlueColor),
                          ),
                        ),

                      _offerItems(),

                      meduimSeperator,
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
                                // DiscountType.AnotherSameFlat
                              ]
                                  .map((DiscountType e) =>
                                      e.toFirebaseFormatString())
                                  .toList(),
                              onChanged: (String? value) {
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
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                hintText: "0",
                                label: null,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                suffix:
                                    viewController.selectedDiscountType.value !=
                                            DiscountType.FlatAmount
                                        ? Text("%")
                                        : Text("\$"),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your Coupon Code";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      if (viewController.selectedDiscountType.value ==
                          DiscountType.AnotherSameFlat)
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          child: RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                                child: Icon(Icons.info,
                                    color: primaryBlueColor, size: 18)),
                            TextSpan(
                                text:
                                    "When customer adds two then the second gets discount.",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(color: primaryBlueColor))
                          ])),
                        ),
                      meduimSeperator,
                      Text(
                        "Select your availability",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      FormField(
                        validator: (Object? value) {
                          if (viewController.selectedStartDate.value == null ||
                              viewController.selectedEndDate.value == null) {
                            return "Please select your availability";
                          }
                          if (viewController.selectedStartDate.value!
                              .isAfter(viewController.selectedEndDate.value!)) {
                            return "Start date must be before end date";
                          }
                          return null;
                        },
                        builder: (FormFieldState<Object?> state) {
                          return Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    showAvailability();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.access_time_filled),
                                        hTinySepartor,
                                        viewController.selectedStartDate
                                                        .value !=
                                                    null &&
                                                viewController.selectedEndDate
                                                        .value !=
                                                    null
                                            ? Text(
                                                "${viewController.selectedStartDate.value!.getOrderTime()} - ${viewController.selectedEndDate.value!.getOrderTime()}")
                                            : Text(
                                                "Select your time",
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (state.hasError)
                                  Text(
                                    state.errorText!,
                                    style:
                                        context.textTheme.bodyMedium!.copyWith(
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                      smallSepartor,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Repeat this offer every week",
                      //       style: context.textTheme.bodyLarge,
                      //     ),
                      //     Switch(
                      //       value: viewController.repeatOffer.value,
                      //       onChanged: (bool value) {
                      //         viewController.repeatOffer.value = value;
                      //       },
                      //     )
                      //   ],
                      // ),
                      // if (viewController.selectedOfferType.value ==
                      //     OfferType.Coupon)
                      //   Column(),
                      // if (viewController.selectedOfferType.value ==
                      //     OfferType.Promotion)
                      //   Column(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void showAvailability() {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (BuildContext context) {
        return Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text(
                      "Offer Availibilty",
                      style: context.textTheme.bodyLarge,
                    )),
                Divider(
                  thickness: 0.3,
                ),
                meduimSeperator,
                BsOpDateTimePicker(
                  fillColor: Colors.white,
                  onNewPeriodSelected: (DateTime v) {
                    viewController.selectedStartDate.value = v;
                  },
                  label: "Start date",
                  validator: (DateTime? p0) {
                    if (p0 == null) {
                      BotToast.showText(
                          text: "Please select a time",
                          duration: Duration(seconds: 5));
                      return "Please select a time";
                    }
                    return null;
                  },
                  time: viewController.selectedStartDate.value,
                ),
                bigSeperator,
                BsOpDateTimePicker(
                  fillColor: Colors.white,
                  onNewPeriodSelected: (DateTime v) {
                    viewController.selectedEndDate.value = v;
                  },
                  label: "End Date",
                  validator: (DateTime? p0) {
                    if (p0 == null) {
                      BotToast.showText(
                          text: "Please select a time",
                          duration: Duration(seconds: 5));
                      return "Please select a time";
                    }
                    return null;
                  },
                  time: viewController.selectedEndDate.value,
                ),
                bigSeperator,
                MezButton(
                  height: 50,
                  label: "Save",
                  onClick: () async {
                    Navigator.pop(context);
                  },
                ),
                bigSeperator
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _offerItems() {
    return Column(
      children: List.generate(
        viewController.selectedItems.length,
        (int index) {
          return MezCard(
            elevation: 0,
            margin: EdgeInsets.only(bottom: 8),
            radius: 17,
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.selectedItems[index].image),
            content: Text(
              viewController.selectedItems[index].name.getTranslation(
                      Get.find<LanguageController>().userLanguageKey) ??
                  "",
              style: context.textTheme.bodyLarge,
            ),
            action: MezIconButton(
              elevation: 0,
              padding: const EdgeInsets.all(3),
              onTap: () {
                viewController.removeItem(
                    id: viewController.selectedItems[index].id);
              },
              icon: Icons.remove,
              iconColor: redAccentColor,
              backgroundColor: offRedColor,
            ),
          );
        },
      ),
    );
  }
}
