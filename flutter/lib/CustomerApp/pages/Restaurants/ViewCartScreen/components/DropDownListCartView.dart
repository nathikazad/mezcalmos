import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as locModel;
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["DropDownListCartView"];

typedef OnDropDownNewValue = void Function({String? newValue});

class DropDownListCartView extends StatefulWidget {
  final OnDropDownNewValue? onValueChangeCallback;

  const DropDownListCartView({
    this.onValueChangeCallback,
    Key? key,
  }) : super(key: key);

  @override
  _DropDownListCartViewState createState() => _DropDownListCartViewState();
}

class _DropDownListCartViewState extends State<DropDownListCartView> {
  RestaurantController controller = Get.find<RestaurantController>();

  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  List<SavedLocation> listOfSavedLoacations = <SavedLocation>[];
  SavedLocation? dropDownListValue;
  SavedLocation? loc;

  @override
  void initState() {
    super.initState();
    setState(() {
      // default ID: _pick_ , stands for our  Pick From Map
      // TODO:544D-HASURA

      // loc = SavedLocation(name: _i18n()["pickLocation"], id: "_pick_");

      loc = SavedLocation(
          name: _i18n()["pickLocation"],
          location: locModel.Location(
              "address",
              LocationData.fromMap({
                "latitude": 17.07555488925666,
                "longitude": -96.72663344788708
              })),
          id: 1);
      listOfSavedLoacations.add(loc!);

      setState(() {
        dropDownListValue = loc;
      });

      customerAuthController.customer?.savedLocations
          .forEach((SavedLocation element) {
        listOfSavedLoacations.add(element);
      });

      // dropDownListValue = listOfSavedLoacations[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.5,
            color: (dropDownListValue != loc)
                ? Theme.of(context).primaryColorLight
                : Colors.red,
          )),
      child: DropdownButtonHideUnderline(
        child: Obx(
          () {
            return DropdownButton<SavedLocation>(
              selectedItemBuilder: (_) {
                return listOfSavedLoacations
                    .map<Widget>(
                      (SavedLocation item) => Container(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.name,
                            style: txt.headline2!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList();
              },
              iconDisabledColor: Color.fromRGBO(172, 89, 252, 1),
              iconEnabledColor: Color.fromRGBO(172, 89, 252, 1),
              value: dropDownListValue,
              isDense: true,
              isExpanded: true,
              hint: Center(
                child: Text(_i18n()["pickLocation"],
                    style: Theme.of(context).textTheme.bodyText2),
              ),
              icon: Icon(Icons.expand_more),
              items: listOfSavedLoacations
                  .map<DropdownMenuItem<SavedLocation>>(
                    (SavedLocation e) => DropdownMenuItem<SavedLocation>(
                      value: e,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: Color.fromRGBO(172, 89, 252, 1),
                            ),
                            const SizedBox(width: 15),
                            Flexible(
                              child: Container(
                                width: Get.width * 0.72,
                                child: Text(
                                  e.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: txt.headline2!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (SavedLocation? newValue) async {
                mezDbgPrint(
                    "Changed value over to ====> ${newValue?.name} | Old one was : ${dropDownListValue?.name}");

                setState(() {
                  dropDownListValue = newValue;
                });
                // we will route the user back to the Map
                if (newValue?.id == "_pick_") {
                  final SavedLocation? _savedLocation =
                      await MezRouter.toNamed<void>(kPickLocationRoute,
                          arguments: true) as SavedLocation?;
                  mezDbgPrint("View Got result : $_savedLocation");
                  if (_savedLocation != null) {
                    // in case it's repeated with the same name or same address
                    listOfSavedLoacations.removeWhere(
                      (savedLoc) =>
                          savedLoc.name == _savedLocation.name ||
                          (_savedLocation.location.address != null &&
                              savedLoc.location.address ==
                                  _savedLocation.location.address),
                    );

                    setState(() {
                      listOfSavedLoacations.add(_savedLocation);
                      dropDownListValue = listOfSavedLoacations[
                          listOfSavedLoacations.length - 1];
                      controller.cart.value.toLocation =
                          _savedLocation.location;
                      controller.saveCart();
                      controller.refresh();
                    });
                  }
                  widget.onValueChangeCallback
                      ?.call(newValue: _savedLocation?.name);
                } else {
                  widget.onValueChangeCallback?.call(newValue: newValue?.name);

                  controller.cart.value.toLocation = newValue!.location;
                  await controller.saveCart();
                  controller.refresh();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
