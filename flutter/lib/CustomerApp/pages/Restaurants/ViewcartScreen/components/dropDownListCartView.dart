import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

typedef OnDropDownNewValue = void Function({String? newValue});

class DropDownListCartView extends StatefulWidget {
  final OnDropDownNewValue? onValueChangeCallback;

  DropDownListCartView({this.onValueChangeCallback, Key? key})
      : super(key: key);

  @override
  _DropDownListCartViewState createState() => _DropDownListCartViewState();
}

class _DropDownListCartViewState extends State<DropDownListCartView> {
  RestaurantController controller = Get.find<RestaurantController>();
  LanguageController lang = Get.find<LanguageController>();

  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  List<SavedLocation> listOfSavedLoacations = <SavedLocation>[];
  SavedLocation? dropDownListValue;

  @override
  void initState() {
    setState(() {
      // default ID: _pick_ , stands for our  Pick From Map
      SavedLocation loc = SavedLocation(
          name: lang.strings["customer"]["restaurant"]["cart"]["pickLocation"],
          id: "_pick_");

      listOfSavedLoacations.add(loc);

      setState(() {
        dropDownListValue = loc;
      });

      customerAuthController.customerRxn.value?.savedLocations
          .forEach((element) {
        listOfSavedLoacations.add(element);
      });

      // dropDownListValue = listOfSavedLoacations[0];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: DropdownButtonHideUnderline(
        child: Obx(() {
          return DropdownButton<SavedLocation>(
            selectedItemBuilder: (context) {
              return listOfSavedLoacations
                  .map<Widget>((item) => Container(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(item.name,
                              style: txt.headline2!.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                        ),
                      ))
                  .toList();
            },
            iconDisabledColor: Color.fromRGBO(172, 89, 252, 1),
            iconEnabledColor: Color.fromRGBO(172, 89, 252, 1),
            value: dropDownListValue,
            isDense: false,
            isExpanded: true,
            hint: Center(
              child: Text(
                  lang.strings["customer"]["restaurant"]["cart"]
                      ["pickLocation"],
                  style: const TextStyle(
                      color: const Color(0xff000f1c),
                      fontWeight: FontWeight.w500,
                      fontFamily: "FontAwesome5Pro",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.left),
            ),
            icon: Icon(Icons.expand_more),
            items: listOfSavedLoacations
                .map<DropdownMenuItem<SavedLocation>>(
                    (e) => DropdownMenuItem<SavedLocation>(
                          value: e,
                          child: Container(
                              child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 18,
                                color: Color.fromRGBO(172, 89, 252, 1),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: Get.width * 0.72,
                                child: Text(
                                  e.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: txt.headline2!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          )),
                        ))
                .toList(),
            onChanged: (newValue) async {
              mezDbgPrint(
                  "Changed value over to ====> ${newValue?.name} | Old one was : ${dropDownListValue?.name}");

              setState(() {
                dropDownListValue = newValue;
              });
              // we will route the user back to the Map
              if (newValue?.id == "_pick_") {
                SavedLocation? saveLocation =
                    await Get.toNamed(kPickLocationRoute, arguments: true)
                        as SavedLocation?;
                mezDbgPrint("View Got result : $saveLocation");
                if (saveLocation != null) {
                  setState(() {
                    listOfSavedLoacations.add(saveLocation);
                    dropDownListValue =
                        listOfSavedLoacations[listOfSavedLoacations.length - 1];
                    controller.cart.value.toLocation = saveLocation.location;
                    controller.saveCart();
                    controller.refresh();
                  });
                }
                widget.onValueChangeCallback
                    ?.call(newValue: saveLocation?.name);
              } else {
                widget.onValueChangeCallback?.call(newValue: newValue?.name);

                controller.cart.value.toLocation = newValue!.location!;
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
