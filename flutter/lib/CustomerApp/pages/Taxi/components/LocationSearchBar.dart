import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
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
  late void Function() collapseDropdown;
  late void Function() expandDropdown;
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
  double pickChoicesDropDownHeight = 0;
  final FocusNode fromTextFieldFocusNode = FocusNode();
  final FocusNode toTextFieldFocusNode = FocusNode();
  SearchComponentType focusedTextField = SearchComponentType.None;
  List<LocationDropDownItem> dropDownItems = [];

  LocationSearchBarState(this.locationSearchBarController) {
    locationSearchBarController.collapseDropdown = collapseDropdown;
    locationSearchBarController.expandDropdown = expandDropdown;
  }

/******************************  Controller functions ************************************/
  void collapseDropdown() {
    setState(() {
      pickChoicesDropDownHeight = 0;
    });
  }

  void expandDropdown() {
    setState(() {
      pickChoicesDropDownHeight = 100;
    });
  }

  /************  Init, build and other overrided function *********************************/
  @override
  void initState() {
    // locationSearchBarController = LocationSearchBarController();
    dropDownItems.addAll([
      LocationDropDownItem(
          function: () async {
            widget.newLocationChosenEvent(
                await MapHelper.getCurrentLocation(), focusedTextField);
          },
          title: "Current location",
          icon: Icon(Icons.location_on, color: Colors.purple)),
      LocationDropDownItem(
          function: () async {
            widget.newLocationChosenEvent(
                await MapHelper.getCurrentLocation(), focusedTextField);
          },
          title: "Pick From Map",
          icon: Icon(Icons.location_searching_outlined, color: Colors.purple))
    ]);
    dropDownItems.addAll(getSavedLocationsWithCallbacks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 5,
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
            )));
  }

  @override
  void didUpdateWidget(LocationSearchBar oldWidget) {
    if (widget.request.value.to?.address != null &&
        widget.request.value.from?.address != null) {
      fromTextFieldFocusNode.unfocus();
      toTextFieldFocusNode.unfocus();
      focusedTextField = SearchComponentType.None;
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  /******************************  Widgets ************************************/

  Widget fromTextField() {
    return Expanded(
      flex: fromTextFieldFocusNode.hasFocus ? 3 : 2,
      child: LocationSearchComponent(
        focusNode: fromTextFieldFocusNode,
        readOnly: widget.request.value.from?.address != null,
        dropDownDxOffset: -10,
        dropDownWidth: Get.width - 30,
        useBorders: false,
        leftTopRadius: 5,
        leftBotRaduis: 5,
        bgColor: Colors.white,
        labelStyle: TextStyle(fontFamily: 'psb', fontSize: 14),
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
      flex: toTextFieldFocusNode.hasFocus ? 3 : 2,
      child: LocationSearchComponent(
        focusNode: toTextFieldFocusNode,
        readOnly: widget.request.value.to?.address != null,
        useBorders: false,
        rightTopRaduis: 5,
        rightBotRaduis: 5,
        bgColor: Colors.white,
        // to Controll where to start our dropDown DX (Distance on X axis)
        dropDownDxOffset: -(Get.width / 2.5),
        dropDownWidth: Get.width - 30,
        labelStyle: TextStyle(fontFamily: 'psb', fontSize: 14),
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
    return AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        height: pickChoicesDropDownHeight,
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
                      fromTextFieldFocusNode.unfocus();
                      toTextFieldFocusNode.unfocus();
                      // focusedTextField = SearchComponentType.None;

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
        ));
  }

/******************************  EVENT HANDLERS ************************************/
// To Text Field Callbacks ---------------------------------------------------------------------------
  void textFieldOnClear(SearchComponentType _type) {
    setState(() {
      if (_type == SearchComponentType.From) {
        fromTextFieldFocusNode.requestFocus();
        mezDbgPrint("Cleared From TF !");
        widget.request.value.from = null;
      }
      if (_type == SearchComponentType.To) {
        fromTextFieldFocusNode.requestFocus();
        mezDbgPrint("Cleared From TF !");
        widget.request.value.to = null;
      }
      focusedTextField = _type;

      widget.newLocationChosenEvent(null, focusedTextField);

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
        widget.request.value.from?.address == null) {
      locationSearchBarController.expandDropdown();
      setState(() {
        focusedTextField = type;
      });
    }

    if (type == SearchComponentType.To &&
        widget.request.value.to?.address == null) {
      locationSearchBarController.expandDropdown();
      setState(() {
        focusedTextField = type;
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
                mezcalmosSnackBar(e.name, e.location.address);
                Location? _savedLoc = _authController.getLocationById(e.id!);
                widget.newLocationChosenEvent(_savedLoc, focusedTextField);
                // setState(() {
                //   _focusedTextField = SearchComponentType.None;
                // });
              },
              title: e.name);
        }).toList() ??
        [];
  }
}
