import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  void expandDropdown() {
    pickChoicesDropDownHeight.value = 100;
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
  CustomerAuthController _authController = Get.find<CustomerAuthController>();
  LocationSearchBarController locationSearchBarController;
  List<LocationDropDownItem> dropDownItems = [];
  LocationSearchBarState(this.locationSearchBarController);
  /************  Init, build and other overrided function *********************************/
  @override
  void initState() {
    // locationSearchBarController = LocationSearchBarController();
    dropDownItems.addAll([
      LocationDropDownItem(
          function: () async {
            widget.newLocationChosenEvent(await MapHelper.getCurrentLocation(),
                locationSearchBarController.focusedTextField.value);
          },
          title: "Current location",
          icon:
              Icon(MezcalmosIcons.crosshairs, size: 20, color: Colors.purple)),
      LocationDropDownItem(
          function: () async {
            widget.newLocationChosenEvent(await MapHelper.getCurrentLocation(),
                locationSearchBarController.focusedTextField.value);
          },
          title: "Pick From Map",
          icon: Icon(MezcalmosIcons.crosshairs, size: 20, color: Colors.purple))
    ]);
    dropDownItems.addAll(getSavedLocationsWithCallbacks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Positioned(
        top: 10,
        left: 10,
        right: 10,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(60, 0, 0, 0),
                    spreadRadius: .5,
                    blurRadius: 4,
                    offset: Offset(0, 5)),
              ],
            ),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      fromTextField(),
                      middleLogo(),
                      toTextField(),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  pickChoicesDropDown()
                ],
              ),
            )));
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

  /******************************  Widgets ************************************/

  Widget fromTextField() {
    return Expanded(
      flex: locationSearchBarController.fromTextFieldFocusNode.hasFocus ? 6 : 5,
      child: LocationSearchComponent(
        suffixPadding: EdgeInsets.only(top: 20, right: 10),
        focusNode: locationSearchBarController.fromTextFieldFocusNode,
        readOnly: widget.request.value.from?.address != null,
        dropDownDxOffset: 0,
        dropDownWidth: Get.width - 20,
        useBorders: false,
        leftTopRadius: 5,
        leftBotRaduis: 5,
        bgColor: Colors.white,
        label: "From",
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
                  child: Image.asset('assets/images/logoWhite.png'),
                ),
              ),
            ]));
  }

  Widget toTextField() {
    return Expanded(
      flex: locationSearchBarController.toTextFieldFocusNode.hasFocus ? 6 : 5,
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
        label: "To",
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
          child: Wrap(
            spacing: 20,
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              ...dropDownItems.map<Widget>((e) => SizedBox(
                    // width: 20,
                    height: 20,
                    child: InkWell(
                      onTap: () {
                        e.function();
                        locationSearchBarController.unfocusAllFocusNodes();

                        setState(() {});
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          e.icon,
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            e.title,
                            style: TextStyle(fontFamily: 'psb'),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          )),
    );
  }

/******************************  EVENT HANDLERS ************************************/
// To Text Field Callbacks ---------------------------------------------------------------------------
  void textFieldOnClear(SearchComponentType _type) {
    setState(() {
      if (_type == SearchComponentType.From) {
        locationSearchBarController.fromTextFieldFocusNode.requestFocus();
        mezDbgPrint("Cleared From TF !");
        widget.request.value.from = null;
      }
      if (_type == SearchComponentType.To) {
        locationSearchBarController.fromTextFieldFocusNode.requestFocus();
        mezDbgPrint("Cleared From TF !");
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
      locationSearchBarController.expandDropdown();
    }
  }

  void textFieldOnFocus(SearchComponentType type) {
    if (type == SearchComponentType.From &&
            widget.request.value.from?.address == null ||
        widget.request.value.from?.address == "") {
      locationSearchBarController.expandDropdown();
      setState(() {
        locationSearchBarController.focusedTextField.value = type;
      });
    }

    if (type == SearchComponentType.To &&
            widget.request.value.to?.address == null ||
        widget.request.value.from?.address == "") {
      locationSearchBarController.expandDropdown();
      setState(() {
        locationSearchBarController.focusedTextField.value = type;
      });
    }
  }

  void textFieldOnFocusLost() {
    locationSearchBarController.collapseDropdown();
  }

  /******************************  helper functions ************************************/
  List<LocationDropDownItem> getSavedLocationsWithCallbacks() {
    return _authController.customerRxn.value?.savedLocations
            .map<LocationDropDownItem>((e) {
          return LocationDropDownItem(
              icon: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              function: () {
                mezcalmosSnackBar(e.name, "${e.location?.address}");
                Location? _savedLoc = _authController.getLocationById(e.id!);
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
