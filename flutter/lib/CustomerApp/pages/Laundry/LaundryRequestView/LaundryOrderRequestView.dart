import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/models/LaundryRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryRequestView/Components/LaundryStepsComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/dropDownListCartView.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class LaundryOrderRequestView extends StatefulWidget {
  const LaundryOrderRequestView({Key? key}) : super(key: key);

  @override
  State<LaundryOrderRequestView> createState() =>
      _LaundryOrderRequestViewState();
}

class _LaundryOrderRequestViewState extends State<LaundryOrderRequestView> {
  final LocationPickerController locationPickerController =
      LocationPickerController();
  final AuthController authController = Get.find<AuthController>();

  LaundryController laundryController = Get.find<LaundryController>();
  LanguageController lang = Get.find<LanguageController>();
  Location? defaultLoc;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(defaultLoc);
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(autoBack: true),
      bottomNavigationBar: bottomButton(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  'How it works',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              LaundryStepsComponent(),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  '${lang.strings["customer"]["restaurant"]["cart"]["deliveryLocation"]} :',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Obx(
                () => Card(
                  child: authController.user != null
                      ? DropDownListCartView(
                          isRestaurant: false,
                          defaultLocation: defaultLoc,
                          callBack: (loc) {
                            setState(() {
                              defaultLoc = loc;
                            });
                          },
                        )
                      : pickFromMapComponent(context),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              orderSummaryCard(context)
            ],
          ),
        ),
      ),
    );
  }

  orderSummaryCard(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "${lang.strings["customer"]["restaurant"]["cart"]["orderSummary"]}",
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["orderCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "\$5/KG",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["deliveryCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "\$10",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Divider(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${lang.strings["customer"]["restaurant"]["cart"]["deliveryLocation"]} :",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: Text(defaultLoc?.address ?? 'No location selected',
                        maxLines: 1)),
              ],
            )
          ],
        ),
      ),
    );
  }

  pickFromMapComponent(BuildContext context) {
    return InkWell(
      onTap: () async {
        Location? currentLoc = await Get.toNamed(kLaundryPickLoc) as Location?;
        if (currentLoc != null) {
          setState(() {
            defaultLoc = currentLoc;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: (defaultLoc == null)
                    ? Colors.red
                    : Theme.of(context).primaryColorLight)),
        child: Row(
          children: [
            Icon(
              Icons.place_rounded,
              color: Theme.of(context).primaryColorLight,
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
                child:
                    Text(defaultLoc?.address ?? 'Pick Location', maxLines: 1)),
          ],
        ),
      ),
    );
  }

  bottomButton(BuildContext context) {
    return Obx(
      () => BottomAppBar(
        child: (authController.user != null)
            ? TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: (defaultLoc != null)
                      ? Theme.of(context).primaryColorLight
                      : Colors.grey,
                ),
                onPressed: (defaultLoc == null)
                    ? null
                    : () async {
                        await laundryController
                            .requestLaundryService(LaundryRequest(
                                to: defaultLoc,
                                notes: 'hhhh',
                                paymentType: PaymentType.Cash))
                            .whenComplete(
                                () => Get.toNamed(kLaundryCurrentOrder));
                      },
                child: Container(
                    padding: EdgeInsets.all(8), child: Text('Order Now')),
              )
            : TextButton(
                onPressed: () async {
                  await Get.toNamed(kSignInRouteOptional);
                },
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text('Sign in to make an order')),
              ),
      ),
    );
  }
}
