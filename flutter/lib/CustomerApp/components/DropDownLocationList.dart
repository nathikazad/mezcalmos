import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';

typedef OnDropDownNewValue = void Function({Location? location});

class DropDownLocationList extends StatefulWidget {
  DropDownLocationList({
    this.onValueChangeCallback,
    this.passedInLocation,
    this.bgColor = Colors.transparent,
    Key? key,
  }) : super(key: key);

  final OnDropDownNewValue? onValueChangeCallback;
  Location? passedInLocation;
  final Color bgColor;

  @override
  _DropDownLocationListState createState() => _DropDownLocationListState();
}

class _DropDownLocationListState extends State<DropDownLocationList> {
  dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
      ["components"]["DropDownLocationList"];
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  List<SavedLocation> listOfSavedLoacations = <SavedLocation>[];
  SavedLocation? dropDownListValue;
  SavedLocation? pickLocationPlaceholder;

  @override
  void initState() {
    super.initState();
    // default ID: _pick_ , stands for our  Pick From Map
    getSavedLocation();
    pickLocationPlaceholder =
        SavedLocation(name: _i18n()["pickLocation"], id: "_pick_");

    listOfSavedLoacations.add(pickLocationPlaceholder!);

    if (widget.passedInLocation == null) {
      dropDownListValue = pickLocationPlaceholder;
    } else {
      final SavedLocation passedInLocation = SavedLocation(
        name: widget.passedInLocation!.address,
        location: widget.passedInLocation,
        id: 'new',
      );

      dropDownListValue = passedInLocation;
      listOfSavedLoacations.add(passedInLocation);
    }
    // dropDownListValue = listOfSavedLoacations[0];
  }

  void getSavedLocation() {
    customerAuthController.customer.value?.savedLocations.forEach(
      (SavedLocation element) {
        listOfSavedLoacations.add(element);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.bgColor,
        // border: Border.all(
        //   // width: 1.5,
        //   // color: (dropDownListValue != pickLocationPlaceholder)
        //   //     ? Theme.of(context).primaryColorLight
        //   //     : Colors.red,
        // ),
      ),
      child: DropdownButtonHideUnderline(
        child: Obx(() {
          return DropdownButton<SavedLocation>(
              selectedItemBuilder: (BuildContext context) {
                return dropDownSelectedItemBuilder(textTheme);
              },
              iconDisabledColor: Colors.grey.shade800,
              iconEnabledColor: Colors.grey.shade800,
              value: dropDownListValue,
              dropdownColor: widget.bgColor,
              isDense: true,
              isExpanded: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.w800),
              hint: Center(
                child: Text(_i18n()["pickLocation"],
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w800)),
              ),
              icon: Icon(Icons.expand_more),
              items: listOfSavedLoacations
                  .map<DropdownMenuItem<SavedLocation>>(
                      (SavedLocation e) => buildItems(e, textTheme))
                  .toList(),
              onChanged: (SavedLocation? newLocation) async {
                await locationChangedHandler(newLocation);
              });
        }),
      ),
    );
  }

  Future<void> locationChangedHandler(SavedLocation? newLocation) async {
    mezDbgPrint(
        "Changed value over to ====> ${newLocation?.name} | Old one was : ${dropDownListValue?.name}");

    setState(() {
      dropDownListValue = newLocation;
      widget.passedInLocation = dropDownListValue!.location;
    });

    mezDbgPrint(widget.passedInLocation);
    // we will route the user back to the Map
    if (newLocation?.id == "_pick_") {
      final SavedLocation? saveLocation = await Get.toNamed(
        kPickLocationRoute,
        arguments: true,
      ) as SavedLocation;
      mezDbgPrint("View Got result : $saveLocation");
      if (saveLocation != null) {
        setState(() {
          listOfSavedLoacations.add(saveLocation);
          dropDownListValue =
              listOfSavedLoacations[listOfSavedLoacations.length - 1];
        });
        widget.onValueChangeCallback?.call(location: saveLocation.location);
      }
    } else {
      if (newLocation != null) {
        widget.onValueChangeCallback?.call(location: newLocation.location);
      }
      widget.passedInLocation = dropDownListValue!.location;
    }
  }

  DropdownMenuItem<SavedLocation> buildItems(
    SavedLocation e,
    TextTheme textTheme,
  ) {
    return DropdownMenuItem<SavedLocation>(
      value: e,
      child: Container(
          child: Row(
        children: <Widget>[
          Icon(
            Icons.location_on_outlined,
            size: 18,
            color: customerAppColor,
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Container(
              width: Get.width * 0.72,
              child: Text(
                e.name,
                overflow: TextOverflow.ellipsis,
                style: textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  List<Widget> dropDownSelectedItemBuilder(TextTheme txt) {
    return listOfSavedLoacations
        .map<Widget>(
          (SavedLocation item) => Container(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                item.name,
                style: txt.headline2!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ),
          ),
        )
        .toList();
  }
}
