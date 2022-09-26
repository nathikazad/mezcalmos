import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["components"]["DropDownLocationList"]; //

typedef OnDropDownNewValue = void Function({Location? location});

class DropDownLocationList extends StatefulWidget {
  DropDownLocationList({
    this.onValueChangeCallback,
    this.passedInLocation,
    this.checkDistance = false,
    this.serviceProviderLocation,
    this.bgColor = Colors.transparent,
    Key? key,
  }) : super(key: key);

  final OnDropDownNewValue? onValueChangeCallback;

  Location? passedInLocation;
  Location? serviceProviderLocation;
  bool checkDistance;
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
      dropDownListValue = listOfSavedLoacations.firstWhereOrNull(
              (SavedLocation element) => element.defaultLocation) ??
          pickLocationPlaceholder;
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
          child: DropdownButton<SavedLocation>(
        selectedItemBuilder: (BuildContext context) {
          return dropDownSelectedItemBuilder(textTheme);
        },
        iconDisabledColor: Colors.grey.shade800,
        iconEnabledColor: Colors.grey.shade800,
        value: dropDownListValue,
        dropdownColor: widget.bgColor,
        isDense: true,
        isExpanded: true,
        icon: Icon(Icons.expand_more),
        hint: Text(
          '${_i18n()["chooseLoc"]}',
          style: Get.textTheme.bodyText1,
        ),
        items: listOfSavedLoacations
            .map<DropdownMenuItem<SavedLocation>>(
                (SavedLocation e) => buildItems(e, textTheme))
            .toList(),
        onChanged: (SavedLocation? v) async {
          await handleChange(v!);
        },
        // onChanged: (SavedLocation? newLocation) async {
        //   // await locationChangedHandler(newLocation);
        // },
      )),
    );
  }

  Future<void Function(SavedLocation? p1)?> handleChange(
      SavedLocation loc) async {
    if (loc.id == "_pick_") {
      await locationChangedHandler(loc);
    } else if (_checkDistance() && await _lessThanDistance(loc.location!)) {
      mezDbgPrint("Lessssss");
      await locationChangedHandler(loc);
    } else if (widget.checkDistance) {
      mezDbgPrint("Morrrrr");
      MezSnackbar(
        '${_i18n()["ops"]}',
        '${_i18n()["distanceError"]}',
      );
    } else {
      await locationChangedHandler(loc);
    }
    return null;
  }

  bool _checkDistance() {
    return widget.serviceProviderLocation != null && widget.checkDistance;
  }

  Future<bool> _lessThanDistance(Location loc) async {
    final MapHelper.Route routeInfo = await MapHelper.getDurationAndDistance(
      widget.serviceProviderLocation!,
      loc,
    );
    mezDbgPrint(
        "distance :=:::::::::=====>${(routeInfo.distance.distanceInMeters / 1000)}");
    return (routeInfo.distance.distanceInMeters / 1000) <= 10;
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
      final SavedLocation? _savedLocation = await Get.toNamed(
        kPickLocationRoute,
        arguments: true,
      ) as SavedLocation;
      mezDbgPrint("View Got result : $_savedLocation");
      if (_savedLocation != null) {
        // in case it's repeated with the same name or same address
        listOfSavedLoacations.removeWhere(
          (SavedLocation savedLoc) =>
              savedLoc.name == _savedLocation.name ||
              (_savedLocation.location?.address != null &&
                  savedLoc.location?.address ==
                      _savedLocation.location?.address),
        );

        setState(() {
          listOfSavedLoacations.add(_savedLocation);
          dropDownListValue =
              listOfSavedLoacations[listOfSavedLoacations.length - 1];
        });
        widget.onValueChangeCallback?.call(location: _savedLocation.location);
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
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          child: Row(
        children: <Widget>[
          Icon(
            Icons.place,
            size: 18,
            color: primaryBlueColor,
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Container(
              width: Get.width * 0.72,
              child: Text(
                e.name,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.bodyText2,
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
                style: Get.textTheme.bodyText2
                    ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
        .toList();
  }
}
