import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Courrier/CustRequestCourrierView/components/CustRequestCourierItems.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Courrier/CustRequestCourrierView/controller/CustRequestCourierViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustCartView/components/DeliveryTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustCartView/components/SaveLocationDailog.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["courrier"]["CustRequestCourierView"];

class CustRequestCourierView extends StatefulWidget {
  static Future<void> navigate(
    int courierId,
  ) {
    return MezRouter.toPath(CourierRoutes.kCourierRequestRoute
        .replaceFirst(":courierId", courierId.toString()));
  }

  const CustRequestCourierView({super.key});

  @override
  State<CustRequestCourierView> createState() => _CustRequestCourierViewState();
}

class _CustRequestCourierViewState extends State<CustRequestCourierView> {
  CustRequestCourierViewController viewController =
      CustRequestCourierViewController();
  int? courierId;
  @override
  void initState() {
    courierId = int.tryParse(MezRouter.urlArguments["courierId"].toString());
    if (courierId != null) {
      viewController.init(courierId: courierId!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        ordersRoute: CustomerRoutes.customerOrdersRoute,
        onClick: viewController.handleBack,
        title: '${_i18n()["title"]}',
      ),
      body: Obx(
        () {
          if (viewController.company.value != null) {
            return PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: viewController.pageController,
                children: [
                  _itemsPage(),
                  _deliveryPage(context),
                ]);
          } else
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
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
    );
  }

  Widget _deliveryPage(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery company',
            style: context.txt.bodyLarge,
          ),
          SizedBox(
            height: 5,
          ),
          if (viewController.company.value != null)
            MezCard(
                firstAvatarBgImage: CachedNetworkImageProvider(
                    viewController.company.value!.info.image),
                content: Text(
                  viewController.company.value!.info.name,
                  style: context.txt.bodyLarge,
                )),
          SizedBox(
            height: 5,
          ),
          DeliveryTimePicker(
            fixed7days: true,
            deliveryTime: viewController.deliveryTime.value,
            isServiceOpen: viewController.company.value?.isOpen() ?? true,
            numberOfDays: 7,
            onValue: (DateTime? value) {
              viewController.deliveryTime.value = value;
            },
            onClear: () {
              viewController.deliveryTime.value = null;
            },
            periodOfTime: null,
            schedule: viewController.company.value!.schedule,
          ),
          SizedBox(
            height: 5,
          ),
          // Text(
          //   'Payment method',
          //   style: context.txt.bodyLarge,
          // ),
          OrderSummaryCard(
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
      child: Form(
        key: viewController.fromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text(
              '${_i18n()["to"]}',
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 5,
            ),
            DropDownLocationList(
              elevation: 0,
              onValueChangeCallback: ({MezLocation? location}) {
                if (location != null && location.isValidLocation()) {
                  viewController.setToLocation(location);
                }
              },
              bgColor: Colors.white,
              checkDistance: false,
              passedInLocation: viewController.toLoc.value,
              serviceProviderLocation: null,
            ),
            SizedBox(
              height: 15,
            ),
            CustRequestCourierItems(
              viewController: viewController,
            ),
            SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
    );
  }

  Widget _fromFeild() {
    return Column(
      children: [
        Obx(
          () => Material(
            elevation: 0,
            child: LocationSearchComponent(
                hintPadding: EdgeInsets.only(left: 10),
                suffixPadding: EdgeInsets.only(right: 10),
                leftBotRaduis: 15,
                rightBotRaduis: 15,
                rightTopRaduis: 15,
                leftTopRadius: 15,
                showSearchIcon: false,
                textStyle: context.textTheme.bodyLarge,
                bgColor: Colors.white,
                text: viewController.fromLoc.value?.address,
                onClear: () {},
                notifyParent: (MezLocation? location) {
                  setState(() {
                    viewController.addFromLoc(location: location!);
                  });
                }),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Row(
          children: [
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
