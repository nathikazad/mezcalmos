import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:mezcalmos/Shared/widgets/OrderFromToBar.dart';

// ignore: constant_identifier_names
enum SearchComponentType { From, To, None }

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Taxi"]["components"]["LocationSearchBar"];

// Map<String, String>  get _i18n => Get.find<LanguageController>().strings["CustomerApp"]
// ["pages"]["Taxi"]["components"]["LocationSearchBar"];

extension ParseSearchComponentTypeToString on SearchComponentType {
  String toShortString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

typedef SearchLocationNotifier = void Function(
  Location? location,
  SearchComponentType locationType,
);

class LocationDropDownItem {
  final String title;
  final Icon icon;
  final VoidCallback function;

  const LocationDropDownItem({
    required this.icon,
    required this.function,
    required this.title,
  });
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
    final double itemMaxHeight = 40.0 - (itemsCount == 2 ? 0 : itemsCount);
    double height = (2 * itemMaxHeight) + itemMaxHeight;

    if (itemsCount >= 2 && itemsCount <= 4) {
      height = itemsCount * itemMaxHeight;
    } else if (itemsCount > 4) {
      height =
          (itemsCount * itemMaxHeight) + ((itemsCount * itemMaxHeight) / 2);
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
  final TaxiRequest request;
  final SearchLocationNotifier newLocationChosenEvent;
  final LocationSearchBarController locationSearchBarController;
  final void Function()? onClear;

  const LocationSearchBar({
    required this.request,
    required this.newLocationChosenEvent,
    required this.locationSearchBarController,
    this.onClear = null,
  });

  @override
  LocationSearchBarState createState() =>
      LocationSearchBarState(locationSearchBarController);
}

class LocationSearchBarState extends State<LocationSearchBar> {
  CustomerAuthController? _authController;
  LocationSearchBarController locationSearchBarController;
  List<LocationDropDownItem> dropDownItems = <LocationDropDownItem>[];

  LocationSearchBarState(this.locationSearchBarController);

  /************  Init, build and other overrided function *********************************/
  @override
  void initState() {
    super.initState();
    loadDropdownItems();
  }

  @override
  void didChangeDependencies() {
    mezDbgPrint("Location@Search@Bar : ${widget.request.from?.address}");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      left: 10,
      right: 10,
      child: Container(
        decoration: getDecoration(),
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Column(
                children: OrderPositionedFromToTopBar.buildwithWidgets(
                  context: context,
                  fromWidget: fromTextField(),
                  toWidget: toTextField(),
                ),
              ),
              Positioned(
                top: locationSearchBarController.focusedTextField.value ==
                        SearchComponentType.From
                    ? 45
                    : 95,
                child: pickChoicesDropDown(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(LocationSearchBar oldWidget) {
    mezDbgPrint(
        "DidUpdate => Location@Search@Bar : ${widget.request.from?.address}");

    if (widget.request.to?.address != null &&
        widget.request.from?.address != null) {
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
      color: Colors.transparent,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Color.fromARGB(60, 0, 0, 0),
          spreadRadius: .5,
          blurRadius: 4,
          offset: Offset(0, 5),
        ),
      ],
    );
  }

  /******************************  Widgets ************************************/

  Widget fromTextField() {
    return Expanded(
      // flex: locationSearchBarController.fromTextFieldFocusNode.hasFocus ? 7 : 5,
      child: LocationSearchComponent(
        // suffixPadding: EdgeInsets.only(top: 20, right: 10),
        focusNode: locationSearchBarController.fromTextFieldFocusNode,
        readOnly: widget.request.from?.address != null &&
            widget.request.from?.address != "",
        // dropDownDxOffset: -110,
        dropDownWidth: Get.width - 25,
        useBorders: false,
        leftTopRadius: 5,
        leftBotRaduis: 5,
        bgColor: Colors.white,
        // label: _i18n()['from'],
        text: widget.request.from?.address ?? "",
        onClear: () => textFieldOnClear(SearchComponentType.From),
        onTextChange: textFieldOnTextChanged,
        onFocus: () => textFieldOnFocus(SearchComponentType.From),
        onFocusLost: textFieldOnFocusLost,
        notifyParent: (Location? location) {
          // This is notifying the parent when the user Clicks a suggestion from the suggestions list!
          widget.newLocationChosenEvent(
            location,
            SearchComponentType.From,
          );
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
        children: <Widget>[
          VerticalDivider(
            color: Color.fromARGB(255, 236, 236, 236),
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(
              getSizeRelativeToScreen(2.5, Get.height, Get.width),
            ),
            height: getSizeRelativeToScreen(17, Get.height, Get.width),
            width: getSizeRelativeToScreen(17, Get.height, Get.width),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromARGB(255, 216, 225, 249),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 7),
                ),
              ],
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromARGB(255, 97, 127, 255),
                  Color.fromARGB(255, 198, 90, 252),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Image.asset('assets/images/shared/logoWhite.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget toTextField() {
    return Expanded(
      // flex: locationSearchBarController.toTextFieldFocusNode.hasFocus ? 7 : 5,
      child: LocationSearchComponent(
        // suffixPadding: EdgeInsets.only(top: 20, right: 10),
        focusNode: locationSearchBarController.toTextFieldFocusNode,
        readOnly: widget.request.to?.address != null,
        useBorders: false,
        rightTopRaduis: 5,
        rightBotRaduis: 5,
        bgColor: Colors.white,

        // to Controll where to start our dropDown DX (Distance on X axis)
        // dropDownDxOffset: -(Get.width / 2.1),
        dropDownWidth: Get.width - 25,
        // label: _i18n()['to'],
        text: widget.request.to?.address ?? "",
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
        width: Get.width - 20,
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
          ),
        ),
        child: Column(
          children: dropDownItems
              .map(
                (LocationDropDownItem d) => Expanded(
                  child: InkWell(
                    onTap: () {
                      d.function();
                      locationSearchBarController.unfocusAllFocusNodes();
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        d.icon,
                        const SizedBox(width: 10),
                        Text(
                          d.title,
                          style: TextStyle(fontFamily: 'psb'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  /******************************  EVENT HANDLERS ************************************/
// To Text Field Callbacks ---------------------------------------------------------------------------
  void textFieldOnClear(SearchComponentType _type) {
    widget.onClear?.call();
    setState(() {
      if (_type == SearchComponentType.From) {
        locationSearchBarController.fromTextFieldFocusNode.requestFocus();
        widget.request.from = null;
      }
      if (_type == SearchComponentType.To) {
        locationSearchBarController.fromTextFieldFocusNode.requestFocus();
        widget.request.to = null;
      }
      locationSearchBarController.focusedTextField.value = _type;

      widget.newLocationChosenEvent(null, _type);

      // _toReadOnly = false;
      // hideFakeMarkerInCaseEmptyAddress();
    });
  }

  void textFieldOnTextChanged(String value) {
    if (value.length >= 1) {
      locationSearchBarController.collapseDropdown();
    } else {
      locationSearchBarController.expandDropdown(
        itemsCount: dropDownItems.length,
      );
    }
  }

  void textFieldOnFocus(SearchComponentType type) {
    if (type == SearchComponentType.From &&
            widget.request.from?.address == null ||
        widget.request.from?.address == "") {
      locationSearchBarController.expandDropdown(
          itemsCount: dropDownItems.length);
      setState(() {
        locationSearchBarController.focusedTextField.value = type;
      });
    }

    if (type == SearchComponentType.To && widget.request.to?.address == null ||
        widget.request.from?.address == "") {
      locationSearchBarController.expandDropdown(
        itemsCount: dropDownItems.length,
      );
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
    dropDownItems.addAll(
      <LocationDropDownItem>[
        LocationDropDownItem(
          function: () async {
            final Location? _loc = await MapHelper.getCurrentLocation();
            mezDbgPrint("zlaganga::root : ${_loc?.address}");
            widget.newLocationChosenEvent(
                _loc, locationSearchBarController.focusedTextField.value);
          },
          title: "${_i18n()["currentLocation"]}",
          icon: Icon(
            MezcalmosIcons.crosshairs,
            size: 20,
            color: Colors.purple,
          ),
        ),
        LocationDropDownItem(
          function: () async {
            widget.newLocationChosenEvent(await MapHelper.getCurrentLocation(),
                locationSearchBarController.focusedTextField.value);
          },
          title: "${_i18n()["pickFromMap"]}",
          icon: Icon(
            MezcalmosIcons.crosshairs,
            size: 20,
            color: Colors.purple,
          ),
        )
      ],
    );
    if (Get.find<AuthController>().fireAuthUser != null) {
      _authController = Get.find<CustomerAuthController>();
      dropDownItems.addAll(getSavedLocationsWithCallbacks());
    }
  }

  List<LocationDropDownItem> getSavedLocationsWithCallbacks() {
    return _authController!.customer.value?.savedLocations
            .map<LocationDropDownItem>((SavedLocation e) {
          return LocationDropDownItem(
              icon: Icon(MezcalmosIcons.search, size: 20, color: Colors.purple),
              function: () {
                final Location? _savedLoc =
                    _authController?.getLocationById(e.id!);
                mezDbgPrint(
                    "${e.id} Saved looooooooooooocccc =====>${_savedLoc?.toFirebaseFormattedJson()}");
                widget.newLocationChosenEvent(_savedLoc,
                    locationSearchBarController.focusedTextField.value);
              },
              title: e.name);
        }).toList() ??
        <LocationDropDownItem>[];
  }
}
