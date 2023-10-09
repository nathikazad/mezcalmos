import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpDateTimePicker.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/ServicesOfferHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/OfferItemsSelectView/OfferItemsSelectView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/controllers/ServiceOfferEditViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
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
                : "${_i18n()['addOffer']}"),
        bottomNavigationBar: MezButton(
          borderRadius: 0,
          label: viewController.isEditMode.value
              ? "${_i18n()['update']}"
              : "${_i18n()['add']}",
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
                    children: <Widget>[
                      Text(
                        "${_i18n()['selectYourOffer']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Builder(builder: (BuildContext context) {
                        return MezStringDropDown(
                          labelText: "${_i18n()['selectYourOffer']}",
                          langPath: _i18n(),
                          value: viewController.selectedOfferType.value
                              ?.toFirebaseFormatString(),
                          items: <OfferType>[
                            OfferType.Coupon,
                            OfferType.Promotion,
                            OfferType.Influencer,
                            //     OfferType.MonthlySubscription
                          ]
                              .map((OfferType e) => e.toFirebaseFormatString())
                              .toList(),
                          // icons: [
                          //   Icons.discount_rounded,
                          //   Icons.attach_money,
                          //   //  Icons.workspace_premium_rounded
                          // ],
                          validator: (String? value) {
                            if (value == null ||
                                viewController.selectedOfferType.value ==
                                    null) {
                              return "${_i18n()['required']}";
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
                      Obx(() {
                        if (viewController.offerForInfluencer)
                          return _rewardTypeSelector();
                        else
                          return SizedBox();
                      }),

                      meduimSeperator,
                      Obx(
                        () => Text(
                          viewController.isCoupon
                              ? "${_i18n()['couponCode']}"
                              : "${_i18n()['name']}",
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      smallSepartor,
                      TextFormField(
                        controller: viewController.offerNameController,
                        decoration: InputDecoration(
                            hintText: viewController.isCoupon
                                ? "${_i18n()['enterYourCouponCode']}"
                                : "${_i18n()['enterYourPromotionName']}"),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "${_i18n()['required']}";
                          }
                          return null;
                        },
                      ),
                      meduimSeperator,

                      Text(
                        "${_i18n()['selectTypeOfOrder']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      MezStringDropDown(
                        labelText: "${_i18n()['selectYourOffer']}",
                        langPath: Get.find<LanguageController>()
                            .strings['Shared']['pages']['ServiceOfferView'],
                        value: viewController.selectedOfferOrderType.value
                            ?.toFirebaseFormatString(),
                        items: <String>[
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
                        "${_i18n()['items']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      if (viewController.selectedItems.isEmpty &&
                          viewController.itemsNames.isEmpty)
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(children: <InlineSpan>[
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.check_circle_rounded,
                                    color: primaryBlueColor,
                                  )),
                                  WidgetSpan(child: hTinySepartor),
                                  TextSpan(
                                      text: "${_i18n()['allItems']}",
                                      style: context.textTheme.bodyLarge)
                                ]),
                              ),
                              smallSepartor,
                              Text(
                                "${_i18n()['noItemsSelected']}",
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
                                    selectedItems:
                                        viewController.initalItemsIds,
                                    serviceProviderId: serviceProviderId!,
                                    serviceProviderType: serviceProviderType);

                            if (data != null) {
                              viewController.selectedItems.value = data;
                            }
                          },
                          title: "${_i18n()['selectItems']}"),
                      if (viewController.itemsNames.isNotEmpty &&
                          viewController.selectedItems.isEmpty)
                        Column(
                          children: List.generate(
                              viewController.itemsNames.length,
                              (int index) => MezCard(
                                    contentPadding: EdgeInsets.all(8),
                                    content: Text(
                                      viewController.itemsNames[index]
                                              .getTranslation(userLanguage) ??
                                          "",
                                      style: context.textTheme.bodyLarge,
                                    ),
                                    action: MezIconButton(
                                      elevation: 0,
                                      padding: const EdgeInsets.all(3),
                                      onTap: () {
                                        viewController.itemsNames.remove(
                                            viewController.itemsNames[index]);
                                      },
                                      icon: Icons.remove,
                                      iconColor: redAccentColor,
                                      backgroundColor: offRedColor,
                                    ),
                                  )),
                        ),

                      _offerItems(),

                      meduimSeperator,
                      Text(
                        "${_i18n()['discountType']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      _discountTypeSelector(),
                      if (viewController.selectedDiscountType.value ==
                          DiscountType.AnotherSameFlat)
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          child: RichText(
                              text: TextSpan(children: <InlineSpan>[
                            WidgetSpan(
                                child: Icon(Icons.info,
                                    color: primaryBlueColor, size: 18)),
                            TextSpan(
                                text: "${_i18n()['customerTwoItemText']}",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(color: primaryBlueColor))
                          ])),
                        ),
                      meduimSeperator,
                      Text(
                        "${_i18n()['minimumOrderCost']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      TextFormField(
                        controller: viewController.minOrderCost,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                            focusColor: primaryBlueColor,
                            hintText:
                                "${_i18n()['leaveItEmptyIfThereIsNoMinimumOrderCost']}",
                            suffixIcon: Icon(Icons.attach_money)),
                        validator: (String? value) {
                          if (value != null && double.tryParse(value) == null) {
                            return "${_i18n()['notValid']}";
                          }
                          return null;
                        },
                      ),

                      meduimSeperator,
                      Text(
                        "${_i18n()['selectYourAvailability']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      _timeSelector(context),
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

  Widget _discountTypeSelector() {
    return Row(
      children: <Widget>[
        Expanded(
          child: MezStringDropDown(
            labelText: "${_i18n()['SelectDiscountType']}",
            value: viewController.selectedDiscountType.value
                .toFirebaseFormatString(),
            langPath: _i18n(),
            items: <DiscountType>[
              DiscountType.FlatAmount,
              DiscountType.Percentage,
              // DiscountType.AnotherSameFlat
            ].map((DiscountType e) => e.toFirebaseFormatString()).toList(),
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
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffix: viewController.selectedDiscountType.value !=
                      DiscountType.FlatAmount
                  ? Text("%")
                  : Text("\$"),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "${_i18n()['required']}";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _rewardTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        smallSepartor,
        Text(
          "${_i18n()['rewardType']}",
          style: context.textTheme.bodyLarge,
        ),
        smallSepartor,
        MezStringDropDown(
          labelText: "${_i18n()['selectRewardType']}",
          value:
              viewController.selectedRewardType.value.toFirebaseFormatString(),
          langPath: _i18n(),
          items: <DiscountType>[
            DiscountType.FlatAmount,
            DiscountType.Percentage,
            // DiscountType.AnotherSameFlat
          ].map((DiscountType e) => e.toFirebaseFormatString()).toList(),
          onChanged: (String? value) {
            if (value == null) return;
            viewController.selectedRewardType.value = value.toDiscountType();
          },
        ),
        meduimSeperator,
        Text("${_i18n()['rewardValue']}", style: context.textTheme.bodyLarge),
        smallSepartor,
        TextFormField(
          controller: viewController.rewardController,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            hintText: "0",
            label: null,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffix: viewController.selectedRewardType.value !=
                    DiscountType.FlatAmount
                ? Text("%")
                : Text("\$"),
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "${_i18n()['required']}";
            }
            return null;
          },
        ),
      ],
    );
  }

  FormField<Object> _timeSelector(BuildContext context) {
    return FormField(
      validator: (Object? value) {
        if (viewController.selectedStartDate.value == null ||
            viewController.selectedEndDate.value == null) {
          return "${_i18n()['selectYourAv']}";
        }
        if (viewController.selectedStartDate.value!
            .isAfter(viewController.selectedEndDate.value!)) {
          return "${_i18n()['startDateError']}";
        }
        return null;
      },
      builder: (FormFieldState<Object?> state) {
        return Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () async {
                  showAvailability();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.access_time_filled),
                      hTinySepartor,
                      viewController.selectedStartDate.value != null &&
                              viewController.selectedEndDate.value != null
                          ? Text(
                              "${viewController.selectedStartDate.value!.getOrderTime()} - ${viewController.selectedEndDate.value!.getOrderTime()}")
                          : Text(
                              "${_i18n()['selectYourTime']}",
                            ),
                    ],
                  ),
                ),
              ),
              if (state.hasError)
                Text(
                  state.errorText!,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        );
      },
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
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text(
                      "${_i18n()['offerAvailibilty']}",
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
                  label: "${_i18n()['startDate']}",
                  validator: (DateTime? p0) {
                    if (p0 == null) {
                      BotToast.showText(
                          text: "${_i18n()['required']}",
                          duration: Duration(seconds: 5));
                      return "${_i18n()['required']}";
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
                  label: "${_i18n()['endDate']}",
                  validator: (DateTime? p0) {
                    if (p0 == null) {
                      BotToast.showText(
                          text: "${_i18n()['required']}",
                          duration: Duration(seconds: 5));
                      return "${_i18n()['required']}";
                    }
                    return null;
                  },
                  time: viewController.selectedEndDate.value,
                ),
                bigSeperator,
                MezButton(
                  height: 50,
                  label: "${_i18n()['save']}",
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
