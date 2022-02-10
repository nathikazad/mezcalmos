import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';

enum SearchComponentType { From, To, None }

extension ParseSearchComponentTypeToString on SearchComponentType {
  String toShortString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

typedef SearchLocationNotifier = void Function(
    Location? location, SearchComponentType locationType);

class LocationDropDownItem {
  final String title;
  final Icon icon;
  final VoidCallback function;

  LocationDropDownItem(
      {required this.icon, required this.function, required this.title});
}

class LocationSearchBarController {
  RxDouble pickChoicesDropDownHeight = 0.0.obs;
  FocusNode fromTextFieldFocusNode = FocusNode();
  FocusNode toTextFieldFocusNode = FocusNode();
  Rx<SearchComponentType> focusedTextField = SearchComponentType.None.obs;

  void collapseDropdown() {
    pickChoicesDropDownHeight.value = 0;
  }

  void expandDropdown({int itemsCount = 2}) {
    /// eachItems = [itemMaxHeight] OF HEIGHT
    double itemMaxHeight = 40.0 - (itemsCount == 2 ? 0 : itemsCount);
    double height = 2 * itemMaxHeight;

    if (itemsCount >= 2 && itemsCount <= 4) {
      height = itemsCount * itemMaxHeight;
    } else if (itemsCount > 4) {
      height = 4 * itemMaxHeight;
    }

    pickChoicesDropDownHeight.value = height;
  }

  /// if no type was specified it unfocus from and to
  void unfocusFieldByType({required SearchComponentType type}) {
    if (type == SearchComponentType.From) {
      fromTextFieldFocusNode.unfocus();
    } else if (type == SearchComponentType.To) {
      toTextFieldFocusNode.unfocus();
    }
  }

  void unfocusAllFocusNodes() {
    fromTextFieldFocusNode.unfocus();
    toTextFieldFocusNode.unfocus();
    // focusedTextField.value = SearchComponentType.None;
  }
}

class LocationSearchBar extends StatefulWidget {
  final Rx<TaxiRequest> request;
  final SearchLocationNotifier newLocationChosenEvent;
  final LocationSearchBarController locationSearchBarController;
  LocationSearchBar(
      {required this.request,
      required this.newLocationChosenEvent,
      required this.locationSearchBarController});

  @override
  LocationSearchBarState createState() =>
      LocationSearchBarState(locationSearchBarController);
}

class LocationSearchBarState extends State<LocationSearchBar> {
  CustomerAuthController? _authController;
  LocationSearchBarController locationSearchBarController;
  List<LocationDropDownItem> dropDownItems = [];
  LocationSearchBarState(this.locationSearchBarController);
  LanguageController lang = Get.find<LanguageController>();
  /************  Init, build and other overrided function *********************************/
  @override
  void initState() {
    loadDropdownItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Positioned(
        top: 5,
        left: 10,
        right: 10,
        child: Container(
            decoration: getDecoration(),
            child: Center(
                child: Column(children: [
              Row(
                children: [fromTextField(), middleLogo(), toTextField()],
              ),
              // SizedBox(height: 5),
              pickChoicesDropDown()
            ]))));
  }

  @override
  void didUpdateWidget(LocationSearchBar oldWidget) {
    if (widget.request.value.to?.address != null &&
        widget.request.value.from?.address != null) {
      locationSearchBarController.unfocusAllFocusNodes();
      locationSearchBarController.focusedTextField.value =
          SearchComponentType.None;
      // setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  BoxDecoration getDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Color.fromARGB(60, 0, 0, 0),
            spreadRadius: .5,
            blurRadius: 4,
            offset: Offset(0, 5)),
      ],
    );
  }
  /******************************  Widgets ************************************/

  Widget fromTextField() {
    return Expanded(
      flex: locationSearchBarController.fromTextFieldFocusNode.hasFocus ? 7 : 5,
      child: LocationSearchComponent(
        suffixPadding: EdgeInsets.only(top: 20, right: 10),
        focusNode: locationSearchBarController.fromTextFieldFocusNode,
        readOnly: widget.request.value.from?.address != null &&
            widget.request.value.from?.address != "",
        dropDownDxOffset: 0,
        dropDownWidth: Get.width - 20,
        useBorders: false,
        leftTopRadius: 5,
        leftBotRaduis: 5,
        bgColor: Colors.white,
        label: lang.strings['shared']['inputLocation']['from'],
        text: widget.request.value.from?.address ?? "",
        onClear: () => textFieldOnClear(SearchComponentType.From),
        onTextChange: textFieldOnTextChanged,
        onFocus: () => textFieldOnFocus(SearchComponentType.From),
        onFocusLost: textFieldOnFocusLost,
        notifyParent: (Location? location) {
          // This is notifying the parent when the user Clicks a suggestion from the suggestions list!
          widget.newLocationChosenEvent(location, SearchComponentType.From);
        },
      ),
    );
  }

  Widget middleLogo() {
    return Expanded(
        flex: 1,
        child: Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              VerticalDivider(
                color: Color.fromARGB(255, 236, 236, 236),
                thickness: 1,
              ),
              Container(
                padding: EdgeInsets.all(
                    getSizeRelativeToScreen(2.5, Get.height, Get.width)),
                height: getSizeRelativeToScreen(17, Get.height, Get.width),
                width: getSizeRelativeToScreen(17, Get.height, Get.width),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(255, 216, 225, 249),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 7)),
                  ],
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 97, 127, 255),
                    Color.fromARGB(255, 198, 90, 252),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Center(
                  child: Image.asset('assets/images/shared/logoWhite.png'),
                ),
              ),
            ]));
  }

  Widget toTextField() {
    return Expanded(
      flex: locationSearchBarController.toTextFieldFocusNode.hasFocus ? 7 : 5,
      child: LocationSearchComponent(
        suffixPadding: EdgeInsets.only(top: 20, right: 10),
        focusNode: locationSearchBarController.toTextFieldFocusNode,
        readOnly: widget.request.value.to?.address != null,
        useBorders: false,
        rightTopRaduis: 5,
        rightBotRaduis: 5,
        bgColor: Colors.white,
        // to Controll where to start our dropDown DX (Distance on X axis)
        dropDownDxOffset: -(Get.width / 2.1),
        dropDownWidth: Get.width - 20,
        label: lang.strings['shared']['inputLocation']['to'],
        text: widget.request.value.to?.address ?? "",
        onClear: () => textFieldOnClear(SearchComponentType.To),
        onTextChange: textFieldOnTextChanged,
        onFocus: () => textFieldOnFocus(SearchComponentType.To),
        onFocusLost: textFieldOnFocusLost,
        notifyParent: (Location? location) {
          widget.newLocationChosenEvent(location, SearchComponentType.To);
        },
      ),
    );
  }

  Widget pickChoicesDropDown() {
    return Obx(
      () => AnimatedContainer(
          clipBehavior: Clip.hardEdge,
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          height: locationSearchBarController.pickChoicesDropDownHeight.value,
          width: Get.width,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(0),
              )),
          child: SingleChildScrollView(
            child: Center(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                separatorBuilder: (sContext, i) {
                  return SizedBox(height: 10);
                },
                itemCount: dropDownItems.length,
                itemBuilder: (bContext, i) {
                  return InkWell(
                    onTap: () {
                      dropDownItems[i].function();
                      locationSearchBarController.unfocusAllFocusNodes();
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        dropDownItems[i].icon,
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          dropDownItems[i].title,
                          style: TextStyle(fontFamily: 'psb'),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )),
    );
  }

/******************************  EVENT HANDLERS ************************************/
// To Text Field Callbacks ---------------------------------------------------------------------------
  void textFieldOnClear(SearchComponentType _type) {
    setState(() {
      if (_type == SearchComponentType.From) {
        locationSearchBarController.fromTextFieldFocusNode.requestFocus();
        widget.request.value.from = null;
      }
      if (_type == SearchComponentType.To) {
        locationSearchBarController.fromTextFieldFocusNode.requestFocus();
        widget.request.value.to = null;
      }
      locationSearchBarController.focusedTextField.value = _type;

      widget.newLocationChosenEvent(
          null, locationSearchBarController.focusedTextField.value);

      // _toReadOnly = false;
      // hideFakeMarkerInCaseEmptyAddress();
    });
  }

  void textFieldOnTextChanged(String value) {
    if (value.length >= 1) {
      locationSearchBarController.collapseDropdown();
    } else {
      locationSearchBarController.expandDropdown(
          itemsCount: dropDownItems.length);
    }
  }

  void textFieldOnFocus(SearchComponentType type) {
    if (type == SearchComponentType.From &&
            widget.request.value.from?.address == null ||
        widget.request.value.from?.address == "") {
      locationSearchBarController.expandDropdown(
          itemsCount: dropDownItems.length);
      setState(() {
        locationSearchBarController.focusedTextField.value = type;
      });
    }

    if (type == SearchComponentType.To &&
            widget.request.value.to?.address == null ||
        widget.request.value.from?.address == "") {
      locationSearchBarController.expandDropdown(
          itemsCount: dropDownItems.length);
      setState(() {
        locationSearchBarController.focusedTextField.value = type;
      });
    }
  }

  void textFieldOnFocusLost() {
    locationSearchBarController.collapseDropdown();
  }

  /******************************  helper functions ************************************/

  void loadDropdownItems() {
    LanguageController lang = Get.find<LanguageController>();
    dropDownItems.addAll([
      LocationDropDownItem(
          function: () async {
            widget.newLocationChosenEvent(await MapHelper.getCurrentLocation(),
                locationSearchBarController.focusedTextField.value);
          },
          title: "${lang.strings["customer"]["taxiView"]["currentLocation"]}",
          icon:
              Icon(MezcalmosIcons.crosshairs, size: 20, color: Colors.purple)),
      LocationDropDownItem(
          function: () async {
            widget.newLocationChosenEvent(await MapHelper.getCurrentLocation(),
                locationSearchBarController.focusedTextField.value);
          },
          title: "${lang.strings["customer"]["taxiView"]["pickFromMap"]}",
          icon: Icon(MezcalmosIcons.crosshairs, size: 20, color: Colors.purple))
    ]);
    if (Get.find<AuthController>().fireAuthUser != null) {
      _authController = Get.find<CustomerAuthController>();
      dropDownItems.addAll(getSavedLocationsWithCallbacks());
    }
  }

  List<LocationDropDownItem> getSavedLocationsWithCallbacks() {
    return _authController!.customerRxn.value?.savedLocations
            .map<LocationDropDownItem>((e) {
          return LocationDropDownItem(
              icon: Icon(MezcalmosIcons.search, size: 20, color: Colors.purple),
              function: () {
                Location? _savedLoc = _authController!.getLocationById(e.id!);
                widget.newLocationChosenEvent(_savedLoc,
                    locationSearchBarController.focusedTextField.value);
                // setState(() {
                //   _locationSearchBarController.focusedTextField.value = SearchComponentType.None;
                // });
              },
              title: e.name);
        }).toList() ??
        [];
  }
}
