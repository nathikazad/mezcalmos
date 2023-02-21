import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustRequestCourrierView/components/CustRequestCourierItems.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustRequestCourrierView/controller/CustRequestCourierViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/DeliveryTimePicker.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class CustRequestCourierView extends StatefulWidget {
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
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: viewController.handleBack, title: "Courier"),
      body: PageView(
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
                    style: Get.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MezCard(
                      firstAvatarBgImage: CachedNetworkImageProvider(
                          viewController.company.value!.info.image),
                      content: Text(
                        viewController.company.value!.info.name,
                        style: Get.textTheme.bodyLarge,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  DeliveryTimePicker(
                    deliveryTime: viewController.deliveryTime.value,
                    isServiceOpen: viewController.company.value!.isOpen(),
                    numberOfDays: 7,
                    onValue: (DateTime? value) {
                      viewController.deliveryTime.value = value;
                    },
                    periodOfTime: null,
                    schedule: viewController.company.value!.schedule,
                  ),
                ],
              ),
            ),
          ]),
      bottomSheet: MezButton(
        label: "Next",
        height: 75,
        onClick: () async {
          viewController.handleNext();
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
              style: Get.textTheme.bodyLarge,
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
              style: Get.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 5,
            ),
            DropDownLocationList(
              onValueChangeCallback: ({MezLocation? location}) {
                if (location != null && location.isValidLocation()) {}
              },
              bgColor: Colors.white,
              checkDistance: true,
              serviceProviderLocation: null,
            ),
            SizedBox(
              height: 15,
            ),
            CustRequestCourierItems(
              viewController: viewController,
            )
          ],
        ),
      ),
    );
  }

  Row _fromFeild() {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Material(
            elevation: 0.5,
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
                style: Get.textTheme.bodyLarge,
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
          onTap: () {},
        )
      ],
    );
  }
}
