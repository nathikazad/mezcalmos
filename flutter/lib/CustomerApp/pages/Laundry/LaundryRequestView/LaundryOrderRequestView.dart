import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/dropDownListCartView.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class LaundryOrderRequestView extends StatefulWidget {
  const LaundryOrderRequestView({Key? key}) : super(key: key);

  @override
  State<LaundryOrderRequestView> createState() =>
      _LaundryOrderRequestViewState();
}

class _LaundryOrderRequestViewState extends State<LaundryOrderRequestView> {
  @override
  void dispose() {
    // savedLocListener!.cancel();
    // savedLocListener = null;
    super.dispose();
  }

  final LocationPickerController locationPickerController =
      LocationPickerController();
  final AuthController authController = Get.find<AuthController>();
  StreamSubscription? savedLocListener;

  LanguageController lang = Get.find<LanguageController>();
  Location? defaultLoc;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(defaultLoc);
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(autoBack: true),
      bottomNavigationBar: BottomAppBar(
        child: (authController.isUserSignedIn)
            ? TextButton(
                onPressed: (defaultLoc == null) ? null : () {},
                child: Container(
                    padding: EdgeInsets.all(8), child: Text('Order Now')),
              )
            : TextButton(
                onPressed: () async {
                  await Get.toNamed(kSignInRouteOptional);
                  if (authController.isUserSignedIn) {}
                },
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text('Sign in to make an order')),
              ),
      ),
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
                  child: (authController.isUserSignedIn)
                      ? DropDownListCartView(
                          isRestaurant: false,
                          defaultLocation: defaultLoc,
                        )
                      : InkWell(
                          onTap: () async {
                            Location? currentLoc =
                                await Get.toNamed(kLaundryPickLoc) as Location?;
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
                                    child: Text(
                                        defaultLoc?.address ?? 'Pick Location',
                                        maxLines: 1)),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        "${lang.strings["customer"]["restaurant"]["cart"]["orderSummary"]}",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Divider(),
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
                      Divider(),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${lang.strings["customer"]["restaurant"]["cart"]["deliveryLocation"]} :",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LaundryStepsComponent extends StatefulWidget {
  const LaundryStepsComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<LaundryStepsComponent> createState() => _LaundryStepsComponentState();
}

class _LaundryStepsComponentState extends State<LaundryStepsComponent> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              stepComponent(context, 1),
              Expanded(child: Divider()),
              stepComponent(context, 2),
              Expanded(child: Divider()),
              stepComponent(context, 3),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              margin: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(
                getDescription(index),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(height: 1.5),
              ),
            ),
          )
        ],
      ),
    );
  }

  Material stepComponent(BuildContext context, int value) {
    return Material(
      shape: CircleBorder(),
      color: (index == value)
          ? Theme.of(context).primaryColorLight
          : Colors.grey.shade400,
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          setState(() {
            index = value;
          });
        },
        child: Ink(
          padding: const EdgeInsets.all(16),
          child: Text(
            value.toString(),
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

String getDescription(int index) {
  switch (index) {
    case 1:
      return 'First step is creating an order once you create an order one of our drivers will be reaching your location to pickup your things';
    case 2:
      return 'Second step our laundry service provider will recieve your order and start doing his work and we will inform you about price changes depending on the order weight';
    case 3:
      return 'Final step once your order is ready one of our driver will pickup the order from the laundry and get it to your location as soon as possible';
    default:
      return '';
  }
}
