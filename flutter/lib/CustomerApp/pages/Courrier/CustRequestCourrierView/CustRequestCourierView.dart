import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustRequestCourrierView/components/CustRequestCourierItems.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustRequestCourrierView/controller/CustRequestCourierViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/DeliveryTimePicker.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:sizer/sizer.dart';

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
    courierId = int.tryParse(Get.parameters["courierId"] ?? "");
    if (courierId != null) {
      viewController.init(courierId: courierId!);
    } else {
      showErrorSnackBar();
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
        title: "Courier",
      ),
      body: Obx(
        () {
          if (viewController.company.value != null) {
            return PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: viewController.pageController,
                children: [
                  _itemsPage(),
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery company",
                          style: context.txt.bodyMedium,
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
                          height: 15,
                        ),
                        DeliveryTimePicker(
                          fixed7days: true,
                          deliveryTime: viewController.deliveryTime.value,
                          isServiceOpen:
                              viewController.company.value?.isOpen() ?? true,
                          numberOfDays: 7,
                          onValue: (DateTime? value) {
                            viewController.deliveryTime.value = value;
                          },
                          periodOfTime: null,
                          schedule: viewController.company.value!.schedule,
                        ),
                        OrderSummaryCard(
                            shippingCost: viewController.shippingCost.value,
                            orderCost: null,
                            totalCost: null,
                            refundAmmount: null,
                            showNullValues: false,
                            stripeOrderPaymentInfo: null)
                      ],
                    ),
                  ),
                ]);
          } else
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
        },
      ),
      bottomSheet: MezButton(
        label: "Next",
        withGradient: true,
        height: 75,
        onClick: () async {
          await viewController.handleNext();
        },
        borderRadius: 0,
      ),
    );
  }

  SingleChildScrollView _itemsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: viewController.fromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "From",
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
              "To",
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 5,
            ),
            DropDownLocationList(
              onValueChangeCallback: ({MezLocation? location}) {
                if (location != null && location.isValidLocation()) {
                  viewController.setToLocation(location);
                }
              },
              bgColor: Colors.white,
              checkDistance: true,
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
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Material(
                elevation: 0.5,
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                    style: context.txt.bodyLarge,
                    controller: viewController.fromLocText,
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.white,
                      hintText: "Enter location",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          gapPadding: 0),
                    )),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            MezIconButton(
              icon: Icons.place,
              iconColor: Colors.black,
              padding: const EdgeInsets.all(12),
              backgroundColor: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
              onTap: () async {
                final SavedLocation? _savedLocation = await MezRouter.toNamed(
                  SharedRoutes.kPickLocation,
                ) as SavedLocation?;
                if (_savedLocation != null) {
                  viewController.addFromLoc(location: _savedLocation.location);
                }
              },
            )
          ],
        ),
        SizedBox(
          height: 8,
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
              "This field can be empty",
              style: context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
            )
          ],
        )
      ],
    );
  }
}
