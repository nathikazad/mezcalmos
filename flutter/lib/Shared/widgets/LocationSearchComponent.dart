import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AutoCompleteTextField.dart';

typedef LocationChangesNotifier = void Function(
  Location location,
  bool showBlackScreen,
);

// Location Search component
class LocationSearchComponent extends StatefulWidget {
  final String label;
  final String hint;
  final LocationChangesNotifier notifyParent;
  final Function onClear;
  String? text;

  LocationSearchComponent(
      {required this.label,
      this.hint = "Enter Address",
      this.text = null,
      required this.notifyParent,
      required this.onClear,
      Key? key})
      : super(key: key);

  @override
  LocationSearchComponentState createState() => LocationSearchComponentState();
}

class LocationSearchComponentState extends State<LocationSearchComponent> {
  TextEditingController _controller = TextEditingController();
  final LanguageController _lang = Get.find<LanguageController>();

  // bool isTfEnabled = true;
  bool _showClearBtn = false;

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(LocationSearchComponent oldWidget) {
    if (widget.text != oldWidget.text &&
        widget.text != null &&
        widget.text!.length >= 1) {
      _controller.clear();
      setState(() {
        _controller.text = widget.text!;
      });
      ;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (widget.text != null && widget.text!.length >= 1) {
        setState(() {
          _showClearBtn = true;
          widget.text = null;
        });
      }
    });

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffececec), width: 0.5),
              color: const Color(0xfff8f8f8),
              borderRadius: BorderRadius.circular(5)),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Text(
                widget.label,
                style: TextStyle(fontFamily: "psr", fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              AutoCompleteTextView(
                tfInitialText: widget.text,
                tfCursorColor: Colors.black,
                controller: _controller,
                suggestionsApiFetchDelay: 1,
                getSuggestionsMethod: getLocationsSuggestions,
                focusGained: () {
                  mezDbgPrint("Focus Gained on TF !");
                },
                focusLost: () {
                  mezDbgPrint("Focus Lost on TF !");
                },
                onValueChanged: (String value) {
                  if (!_showClearBtn && value.length >= 3) {
                    setState(() {
                      _showClearBtn = true;
                    });
                  }

                  if (_showClearBtn && value.length < 3) {
                    setState(() {
                      _showClearBtn = false;
                    });
                  }
                },
                onTapCallback: (String placeId, String name) async {
                  Location? _loc = await getLocationFromPlaceId(placeId);
                  if (_loc != null) {
                    widget.notifyParent(_loc, true);
                    setState(() {
                      _showClearBtn = false;
                    });
                  }
                },
                tfTextDecoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  suffixIconConstraints: BoxConstraints(
                    maxWidth: 20,
                  ),
                  suffixIcon: _showClearBtn
                      ? Container(
                          margin: EdgeInsets.only(right: 5),
                          padding: EdgeInsets.only(bottom: 1),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  widget.onClear();
                                  _showClearBtn = false;
                                  _controller.clear();
                                });
                              },
                              child: Icon(Icons.clear_rounded,
                                  size: 22, color: Colors.black)),
                        )
                      : SizedBox(height: 0, width: 0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
