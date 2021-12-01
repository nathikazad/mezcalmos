import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';

import '../../../../router.dart';

class DropDownListCartView extends StatefulWidget {
  DropDownListCartView({Key? key}) : super(key: key);

  @override
  _DropDownListCartViewState createState() => _DropDownListCartViewState();
}

class _DropDownListCartViewState extends State<DropDownListCartView> {
  RestaurantController controller = Get.find<RestaurantController>();
  LanguageController lang = Get.find<LanguageController>();

  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  var listOfSavedLoacations = <SavedLocation>[];
  SavedLocation? dropDownListValue;

  @override
  void initState() {
    setState(() {
      listOfSavedLoacations = [
        SavedLocation(
            name: "Pick From map",
            location: Location.fromFirebaseData(<String, dynamic>{
              "lat": 37.33233141,
              "lng": -122.0312186,
              "address": "Unnamed Road, Cupertino, CA 95014, USA"
            }))
      ];
      customerAuthController.customerRxn.value?.savedLocations
          .forEach((element) {
        listOfSavedLoacations.add(element);
      });

      dropDownListValue = listOfSavedLoacations[0];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: const Color(0xffececec), width: 0.5),
          color: const Color(0x80ffffff)),
      child: DropdownButtonHideUnderline(
        child: Obx(() {
          return DropdownButton<SavedLocation>(
            selectedItemBuilder: (context) {
              return listOfSavedLoacations
                  .map<Widget>((item) => Container(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(item.name),
                        ),
                      ))
                  .toList();
            },
            value: dropDownListValue,
            isDense: false,
            isExpanded: true,
            hint: Text(
                lang.strings["customer"]["restaurant"]["cart"]["pickLocation"],
                style: const TextStyle(
                    color: const Color(0xff000f1c),
                    fontWeight: FontWeight.w500,
                    fontFamily: "FontAwesome5Pro",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                textAlign: TextAlign.left),
            icon: Icon(Icons.expand_more),
            items: listOfSavedLoacations
                .map<DropdownMenuItem<SavedLocation>>(
                    (e) => DropdownMenuItem<SavedLocation>(
                          value: e,
                          child: Container(
                              child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 18,
                                color: Color(0xff2362f1),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(e.name),
                            ],
                          )),
                        ))
                .toList(),
            onChanged: (newValue) async {
              setState(() {
                dropDownListValue = newValue;
              });
              // we will route the user back to the Map
              if (newValue!.name == "Pick From map") {
                SavedLocation saveLocation =
                    await Get.toNamed(kPickLocationRoute);
                setState(() {
                  listOfSavedLoacations.add(saveLocation);
                  dropDownListValue =
                      listOfSavedLoacations[listOfSavedLoacations.length - 1];
                  controller.cart.value.toLocation = saveLocation.location;
                  controller.saveCart();
                  controller.refresh();
                });
              } else {
                controller.cart.value.toLocation = newValue.location;
                controller.saveCart();
                controller.refresh();
              }
            },
          );
        }),
      ),
    );
  }
}
