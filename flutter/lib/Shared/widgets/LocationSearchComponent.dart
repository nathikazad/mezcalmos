import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
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
  final LocationChangesNotifier notifyParent;
  final Function onClear;
  String? text;
  final FocusNode? focusNode;

  LocationSearchComponent(
      {required this.label,
      this.readOnly = false,
      this.useBorders = true,
      this.leftTopRadius = 0,
      this.leftBotRaduis = 0,
      this.rightTopRaduis = 0,
      this.rightBotRaduis = 0,
      this.bgColor = const Color(0xfff8f8f8),
      this.labelStyle = const TextStyle(fontFamily: "psr", fontSize: 14),
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
        Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          alignment: Alignment.center,
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
              Text(
                widget.label,
                style: widget.labelStyle,
              ),
              SizedBox(
                height: 20,
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
