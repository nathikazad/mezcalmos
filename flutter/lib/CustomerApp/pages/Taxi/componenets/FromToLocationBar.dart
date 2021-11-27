import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/helper.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';

// typedef LocationDropDownStateNotifier = void Function(DropDownState state);

// LocationChoicesDropDown(
//               newLocationFromChildren,
//                 initialDropDownState: this.ddState,
//               ),
typedef SearchLocationNotifier = void Function(
    Location? location, SearchComponentType locationType);

class LocationDropDownItem {
  final String title;
  final Icon icon;
  final VoidCallback function;

  LocationDropDownItem(
      {required this.icon, required this.function, required this.title});
}

class FromToLocationBar extends StatefulWidget {
  Rx<TaxiRequest> request;
  SearchLocationNotifier eventNotifier;

  FromToLocationBar(this.request, this.eventNotifier, {Key? key})
      : super(key: key);

  @override
  FromToLocationBarState createState() => FromToLocationBarState();
}

class FromToLocationBarState extends State<FromToLocationBar> {
  final GlobalKey<FromToLocationBarState> widgetKey = GlobalKey();
  late FromToLocationBarHelper helper;
  CustomerAuthController _authController = Get.find<CustomerAuthController>();
  final FocusNode fromTextFieldFocusNode = FocusNode();
  final FocusNode toTextFieldFocusNode = FocusNode();
  SearchComponentType focusedTextField = SearchComponentType.None;
  List<LocationDropDownItem> dropDownItems = [];

  @override
  void didUpdateWidget(FromToLocationBar oldWidget) {
    if (widget.request.value.to?.address != null &&
        widget.request.value.from?.address != null) {
      fromTextFieldFocusNode.unfocus();
      toTextFieldFocusNode.unfocus();
      focusedTextField = SearchComponentType.None;
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

// To Text Field Callbacks ---------------------------------------------------------------------------
  void textFieldOnClear(SearchComponentType _type) {
    setState(() {
      // _animateMarkersAndPolylines = false;
      // _polylines.clear();
      // _markers.removeWhere((element) => element.markerId.value == "to");
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

      widget.eventNotifier(null, focusedTextField);

      // _toReadOnly = false;
      // hideFakeMarkerInCaseEmptyAddress();
    });
  }

  void textFieldOnTextChanged(String value) {
    if (value.length >= 1) {
      helper.collapse();
    } else {
      helper.expand();
    }
  }

  void textFieldOnFocus(SearchComponentType type) {
    if (type == SearchComponentType.From &&
        widget.request.value.from?.address == null) {
      helper.expand();
      setState(() {
        focusedTextField = type;
      });
    }

    if (type == SearchComponentType.To &&
        widget.request.value.to?.address == null) {
      helper.expand();
      setState(() {
        focusedTextField = type;
      });
    }
    // if (type == SearchComponentType.From) {
    //   widget.eventNotifier(widget.request.value.value.from, SearchComponentType.From);
    // } else if (type == SearchComponentType.To) {
    //   widget.eventNotifier(widget.request.value.value.to, SearchComponentType.To);
    // }
  }

  void textFieldOnFocusLost() {
    helper.collapse();
  }

  Widget topBarFromTextField() {
    return Expanded(
      flex: focusedTextField == SearchComponentType.To ? 1 : 3,
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
          widget.eventNotifier(location, SearchComponentType.From);
        },
      ),
    );
  }

  Widget topBarMiddleLogo() {
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

  Widget topBarToTextField() {
    return Expanded(
      flex: focusedTextField == SearchComponentType.From ? 1 : 3,
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
          widget.eventNotifier(location, SearchComponentType.To);
        },
      ),
    );
  }

  Widget pickChoicesDropDown() {
    return AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        height: helper.pickChoicesDropDownHeight,
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
                widget.eventNotifier(_savedLoc, focusedTextField);
                // setState(() {
                //   _focusedTextField = SearchComponentType.None;
                // });
              },
              title: e.name);
        }).toList() ??
        [];
  }

  @override
  void initState() {
    helper = FromToLocationBarHelper(widgetKey);
    dropDownItems.addAll([
      LocationDropDownItem(
          function: () async {
            widget.eventNotifier(
                await MapHelper.getCurrentLocation(), focusedTextField);
          },
          title: "Current location",
          icon: Icon(Icons.location_on, color: Colors.purple)),
      LocationDropDownItem(
          function: () async {
            // we might just return a saved snapshot to reduce the await
            widget.eventNotifier(
                await MapHelper.getCurrentLocation(), focusedTextField);
            // setState(() {
            //   _focusedTextField = SearchComponentType.None;
            // });
          },
          title: "Pick From Map",
          icon: Icon(Icons.location_searching_outlined, color: Colors.purple))
    ]);
    // adding dynamic savedLocations
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
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 10)),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    topBarFromTextField(),
                    topBarMiddleLogo(),
                    topBarToTextField(),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                pickChoicesDropDown()
              ],
            )));
  }
}
