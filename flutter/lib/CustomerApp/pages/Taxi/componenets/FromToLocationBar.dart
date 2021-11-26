import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/componenets/LocationChoicesDropDown.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';

typedef LocationDropDownStateNotifier = void Function(DropDownState state);

class FromToLocationBar extends StatefulWidget {
  Rx<TaxiRequest> request;
  SearchLocationNotifier eventNotifier;
  LocationDropDownStateNotifier ddStateNotifier;
  // int flexValueFrom;
  // bool fromReadOnly;
  // FocusNode fromFocusNode;
  // String? fromLocationAddress;
  // Function fromTextFieldOnClear;
  // Function fromTextFieldOnFocus;
  // Function fromTextFieldOnTextChanged;
  // Function fromTextFieldOnFocusLost;
  // Function fromTextFieldNotifyParent;

  FromToLocationBar(this.request, this.eventNotifier, this.ddStateNotifier);

  @override
  _FromToLocationBarState createState() => _FromToLocationBarState();
}

class _FromToLocationBarState extends State<FromToLocationBar> {
  SearchComponentType _focusedTextField = SearchComponentType.From;

// To Text Field Callbacks ---------------------------------------------------------------------------
  void textFieldOnClear() {
    setState(() {
      // _animateMarkersAndPolylines = false;
      // _polylines.clear();
      // _markers.removeWhere((element) => element.markerId.value == "to");
      if (_focusedTextField == SearchComponentType.From) {
        widget.request.value.from?.address = "";
      } else {
        widget.request.value.to?.address = "";
      }
      // _toReadOnly = false;
      // hideFakeMarkerInCaseEmptyAddress();
    });
  }

  void textFieldOnTextChanged(String value) {
    if (value.length >= 1) {
      widget.ddStateNotifier(DropDownState.Collapse);
    } else {
      setState(() {
        // expand
        widget.ddStateNotifier(DropDownState.Expand);
      });
    }
  }

  void textFieldOnFocus(SearchComponentType type) {
    mezDbgPrint("====================== TO : $type =======================");
    setState(() {
      mezDbgPrint(
          "====================== TO : $_focusedTextField =======================");
      _focusedTextField = type;
      mezDbgPrint(
          "====================== TO : $_focusedTextField =======================");
    });
    mezDbgPrint(
        "====================== TO : $_focusedTextField =======================");
    if (type == SearchComponentType.From) {
      widget.eventNotifier(widget.request.value.from, SearchComponentType.From);
    } else if (type == SearchComponentType.To) {
      widget.eventNotifier(widget.request.value.to, SearchComponentType.To);
    }

    widget.ddStateNotifier(DropDownState.Expand);
  }

  void textFieldOnFocusLost() {
    widget.ddStateNotifier(DropDownState.Collapse);
  }

  Widget topBarFromTextField() {
    return Expanded(
      flex: _focusedTextField == SearchComponentType.To ? 1 : 3,
      child: LocationSearchComponent(
        readOnly: widget.request.value.from?.address == null,
        dropDownDxOffset: -10,
        dropDownWidth: Get.width - 30,
        useBorders: false,
        leftTopRadius: 5,
        leftBotRaduis: 5,
        bgColor: Colors.white,
        labelStyle: TextStyle(fontFamily: 'psb', fontSize: 14),
        label: "From",
        text: widget.request.value.from?.address ?? "",
        onClear: textFieldOnClear,
        onTextChange: textFieldOnTextChanged,
        onFocus: () => textFieldOnFocus(SearchComponentType.From),
        onFocusLost: textFieldOnFocusLost,
        notifyParent: (Location location) {
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
      flex: _focusedTextField == SearchComponentType.From ? 1 : 3,
      child: LocationSearchComponent(
        readOnly: widget.request.value.to?.address == null,
        useBorders: false,
        rightTopRaduis: 5,
        rightBotRaduis: 5,
        bgColor: Colors.white,
        // to Controll where to start our dropDown DX (Distance on X axis)
        dropDownDxOffset: -(Get.width / 2.5),
        dropDownWidth: Get.width - 30,
        labelStyle: TextStyle(fontFamily: 'psb', fontSize: 14),
        label: "To",
        text: "",
        onClear: textFieldOnClear,
        onTextChange: textFieldOnTextChanged,
        onFocus: () => textFieldOnFocus(SearchComponentType.To),
        onFocusLost: textFieldOnFocusLost,
        notifyParent: (Location location) {
          widget.eventNotifier(location, SearchComponentType.To);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      left: 15,
      right: 15,
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
        child: Row(
          children: [
            topBarFromTextField(),
            topBarMiddleLogo(),
            topBarToTextField()
          ],
        ),
      ),
    );
  }
}
