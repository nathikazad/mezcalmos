import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/models/CustDeliveryType.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDelivery/CustDeliveryRequest/components/CustDeliveryRequestitems.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDelivery/CustDeliveryRequest/controllers/CustDeliveryRequestViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/DeliveryTimePicker.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/deliveryRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/LoadingWidgets/MezLoadingOverlay.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/ServiAmigosCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["courrier"]["CustRequestCourierView"];

class CustDeliveryRequestView extends StatefulWidget {
  static Future<void> navigate({required CustDeliveryType deliveryType}) {
    return MezRouter.toPath(CustDeliveryRoutes.deliveryRequestRoute,
        arguments: <String, dynamic>{
          "dvType": deliveryType.toFirebaseFormatString(),
        });
  }

  const CustDeliveryRequestView({super.key});

  @override
  State<CustDeliveryRequestView> createState() =>
      _CustDeliveryRequestViewState();
}

class _CustDeliveryRequestViewState extends State<CustDeliveryRequestView> {
  CustDeliveryRequestViewController viewController =
      CustDeliveryRequestViewController();
  @override
  void initState() {
    final CustDeliveryType? dvType =
        MezRouter.bodyArguments?["dvType"].toString().toCustDeliveryType();
    if (dvType != null) {
      viewController.init(deliveryType: dvType);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MezLoadingOverlay(
        isLoading: viewController.showRedirectText.value,
        label: "${_i18n()['redirectText']}",
        labelStyle: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        child: Scaffold(
          appBar: MezcalmosAppBar(
            AppBarLeftButtonType.Back,
            ordersRoute: CustomerRoutes.customerOrdersRoute,
            onClick: viewController.handleBack,
            title: viewController.deliveryType.name,
          ),
          body: Obx(
            () {
              return PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: viewController.pageController,
                  children: <Widget>[
                    _itemsPage(),
                    _deliveryPage(context),
                  ]);
            },
          ),
          bottomSheet: Obx(
            () => MezButton(
              label: viewController.currentPage.value == 0
                  ? '${_i18n()["next"]}'
                  : '${_i18n()["orderNow"]}',
              withGradient: true,
              height: 75,
              onClick: () async {
                await viewController.handleNext();
              },
              borderRadius: 0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _deliveryPage(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   '${_i18n()["deliveryCompany"]}',
          //   style: context.txt.bodyLarge,
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // if (viewController.company.value != null)
          //   MezCard(
          //       firstAvatarBgImage: CachedNetworkImageProvider(
          //           viewController.company.value!.info.image),
          //       content: Text(
          //         viewController.company.value!.info.name,
          //         style: context.txt.bodyLarge,
          //       )),
          ServiceAmigosCard(),

          Form(
            key: viewController.secondFormKey,
            child: DeliveryTimePicker(
              fixed7days: true,
              deliveryTime: viewController.deliveryTime.value,
              isServiceOpen: viewController.company.value?.isOpen ?? true,
              numberOfDays: 7,
              onValue: (DateTime? value) {
                if (value != null &&
                    viewController.secondFormKey.currentState?.validate() ==
                        true) {
                  viewController.deliveryTime.value = value;
                }
              },
              onClear: () {
                viewController.deliveryTime.value = null;
              },
              periodOfTime: null,
              schedule: viewController.company.value?.schedule,
            ),
          ),

          // Text(
          //   'Payment method',
          //   style: context.txt.bodyLarge,
          // ),
          OrderSummaryCard(
              margin: EdgeInsets.only(top: 20),
              costs: OrderCosts(
                  deliveryCost: viewController.shippingCost.value,
                  refundAmmount: null,
                  tax: null,
                  orderItemsCost: null,
                  totalCost: null),
              showNullValues: true,
              stripeOrderPaymentInfo: null)
        ],
      ),
    );
  }

  Widget _itemsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (viewController.showFromLocation) ...<Widget>[
            Text(
              '${_i18n()["from"]}',
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 5,
            ),
            _fromFeild(),
            SizedBox(
              height: 15,
            ),
          ],
          Text(
            '${_i18n()["to"]}',
            style: context.txt.bodyLarge,
          ),
          SizedBox(
            height: 5,
          ),
          Form(
            key: viewController.fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DropDownLocationList(
                  elevation: 0,
                  onValueChangeCallback: (MezLocation location) {
                    viewController.setToLocation(location);
                  },
                  bgColor: Colors.white,
                  checkDistance: false,
                  passedInLocation: viewController.toLoc.value,
                  serviceProviderLocation: null,
                ),
                SizedBox(
                  height: 15,
                ),
                CustDeliveryRequestItems(
                  viewController: viewController,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }

  Widget _fromFeild() {
    return Column(
      children: <Widget>[
        Material(
          elevation: 0,
          child: LocationSearchComponent(
              textStyle: context.textTheme.bodyLarge,
              showInputAsOption: true,
              bgColor: Colors.white,
              controller: viewController.fromLocText,
              onClear: () {},
              notifyParent: (MezLocation? location) {
                if (location != null) {
                  setState(() {
                    viewController.addFromLoc(location: location);
                  });
                }
              }),
        ),
        SizedBox(
          height: 7,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.info_outline,
              color: primaryBlueColor,
              size: 16.sp,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              '${_i18n()["thisFieldCanBeEmpty"]}',
              style: context.txt.bodyLarge
                  ?.copyWith(color: primaryBlueColor, fontSize: 12.5),
            )
          ],
        )
      ],
    );
  }
}