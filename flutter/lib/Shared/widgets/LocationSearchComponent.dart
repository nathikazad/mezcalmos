import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/AutoCompleteTextField.dart';

typedef TextFieldGotUpdated = void Function(String updatedText);

// Location Search component
class LocationSearchComponent extends StatefulWidget {
  final bool useBorders;
  final bool readOnly;
  // raduis
  final double leftTopRadius;
  final double leftBotRaduis;
  final double rightTopRaduis;
  final double rightBotRaduis;

  final Color bgColor;
  final TextStyle labelStyle;
  final Function? onFocus;
  final Function? onFocusLost;
  final TextFieldGotUpdated? onTextChange;
  final double? dropDownWidth;
  final double? dropDownDxOffset;

  final String label;
  final String hint;
  final MapHelper.LocationChangesNotifier notifyParent;
  final Function onClear;
  String? text;
  final FocusNode? focusNode;

  LocationSearchComponent(
      {required this.label,
      this.readOnly = false,
      this.useBorders = true,
      this.leftTopRadius = 6,
      this.leftBotRaduis = 6,
      this.rightTopRaduis = 6,
      this.rightBotRaduis = 6,
      this.bgColor = const Color(0xfff8f8f8),
      this.labelStyle = const TextStyle(
          fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black87),
      this.hint = "Enter Address",
      this.text,
      required this.notifyParent,
      required this.onClear,
      this.onFocus,
      this.onFocusLost,
      this.onTextChange,
      this.dropDownWidth,
      this.dropDownDxOffset,
      this.focusNode,
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
        Center(
          child: Container(
            // padding: EdgeInsets.only(left: 0, top: 10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: widget.useBorders
                    ? Border.all(color: const Color(0xffececec), width: 0.5)
                    : null,
                color: widget.bgColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.leftTopRadius),
                    topRight: Radius.circular(widget.rightTopRaduis),
                    bottomLeft: Radius.circular(widget.leftBotRaduis),
                    bottomRight: Radius.circular(widget.rightBotRaduis))),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Text(
                    widget.label,
                    style: widget.labelStyle,
                  ),
                ),
                AutoCompleteTextView(
                  readOnly: widget.readOnly,
                  focusNode: widget.focusNode,
                  dropDownDxOffset: widget.dropDownDxOffset,
                  dropDownWidth: widget.dropDownWidth,
                  tfInitialText: widget.text,
                  tfCursorColor: Colors.black,
                  controller: _controller,
                  suggestionsApiFetchDelay: 1,
                  getSuggestionsMethod: MapHelper.getLocationsSuggestions,
                  focusGained: widget.onFocus ?? () {},
                  focusLost: widget.onFocusLost ?? () {},
                  onValueChanged: (String value) {
                    if (widget.onTextChange != null) {
                      widget.onTextChange!(value);
                    }
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
                    Location? _loc =
                        await MapHelper.getLocationFromPlaceId(placeId);
                    if (_loc != null) {
                      widget.notifyParent(_loc);
                      setState(() {
                        _showClearBtn = false;
                      });
                    }
                  },
                  tfTextDecoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 20),
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(141, 141, 141, 1),
                        fontSize: 16.33,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'psr'),
                    border: InputBorder.none,
                    suffixIconConstraints: BoxConstraints(
                      maxWidth: 30,
                    ),
                    suffixIcon: _showClearBtn
                        ? GestureDetector(
                            onTap: () async {
                              setState(() {
                                widget.onClear();
                                _showClearBtn = false;
                                _controller.clear();
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(),
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.only(top: 20, right: 10),
                                alignment: Alignment.bottomRight,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Icon(MezcalmosIcons.times_circle,
                                        size: 16, color: Colors.black),
                                  ),
                                )),
                          )
                        : SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
