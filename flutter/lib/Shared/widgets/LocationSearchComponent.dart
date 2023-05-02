// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

typedef TextFieldGotUpdated = void Function(String updatedText);

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['widgets']
    ["LocationSearchComponent"];

// Location Search component
class LocationSearchComponent extends StatefulWidget {
  final bool placeNameAsAdress;
  final bool showInputAsOption;

  // raduis

  final Color bgColor;
  final TextStyle labelStyle;
  final TextStyle? textStyle;
  final TextEditingController? controller;

  final TextFieldGotUpdated? onTextChange;

  final String? initialTextValue;
  final MapHelper.LocationChangesNotifier notifyParent;
  final Function onClear;
  final bool showSearchIcon;

  const LocationSearchComponent({
    this.initialTextValue,
    this.placeNameAsAdress = true,
    this.controller,
    this.showInputAsOption = false,
    this.showSearchIcon = false,
    this.textStyle,
    this.bgColor = const Color(0xfff8f8f8),
    this.labelStyle = const TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 14,
      color: Colors.black87,
    ),
    required this.notifyParent,
    required this.onClear,
    this.onTextChange,
    Key? key,
  }) : super(key: key);

  @override
  LocationSearchComponentState createState() => LocationSearchComponentState();
}

class LocationSearchComponentState extends State<LocationSearchComponent> {
  TextEditingController _controller = TextEditingController();

  FocusNode? _focusNode;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    //  _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<MapHelper.AutoCompleteResult>(
      optionsViewBuilder: (BuildContext context, onSelected,
          Iterable<MapHelper.AutoCompleteResult> options) {
        return Column(
          children: List.generate(
              options.length,
              (int index) => MezCard(
                  margin: EdgeInsets.zero,
                  contentPadding: EdgeInsets.all(8),
                  borderRadius: 1,
                  firstAvatarIcon: Icons.place,
                  firstAvatarBgColor: Colors.white,
                  radius: 15,
                  firstAvatarIconColor: Colors.black,
                  onClick: () {
                    onSelected.call(options.toList()[index]);
                  },
                  content: Text(
                    options.toList()[index].description.toString(),
                    style: context.textTheme.bodyLarge,
                  ))),
        );
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          Function()? onFieldSubmitted) {
        _controller = textEditingController;

        _focusNode = focusNode;
        return TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: _inputDecoration(),
          onChanged: (String v) {
            if (v.length.isEven == true && v.length > 3) {
              setState(() {});
            }
          },
          style: widget.textStyle ??
              widget.labelStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                overflow: TextOverflow.ellipsis,
              ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text.length > 3 &&
            textEditingValue.text.length.isEven) {
          List<MapHelper.AutoCompleteResult> data =
              await MapHelper.getLocationsSuggestions(textEditingValue.text);

          data.retainWhere((MapHelper.AutoCompleteResult element) => element
              .description
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()));
          if (widget.showInputAsOption && _controller.text.isNotEmpty) {
            data.add(MapHelper.AutoCompleteResult(
                description: _controller.text, placeId: null));
          }

          return data;
        } else {
          return [];
        }
      },
      onSelected: (MapHelper.AutoCompleteResult selection) {
        _controller.text = selection.description;
        _focusNode?.unfocus();
        if (selection.placeId != null) {
          MapHelper.getLocationFromPlaceId(
                  selection.placeId!, selection.description)
              .then((MezLocation? value) {
            if (value != null) {
              widget.notifyParent
                  .call(MezLocation(selection.description, value.position));
            }
          });
        } else {
          widget.notifyParent.call(null);
          if (widget.controller != null) {
            widget.controller?.text = selection.description;
          }
        }
      },
    );

    // return Column(
    //   children: <Widget>[
    //     Center(
    //       child: Container(
    //         alignment: Alignment.centerLeft,
    //         decoration: BoxDecoration(
    //           border: widget.border,
    //           color: widget.bgColor,
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(widget.leftTopRadius),
    //             topRight: Radius.circular(widget.rightTopRaduis),
    //             bottomLeft: Radius.circular(widget.leftBotRaduis),
    //             bottomRight: Radius.circular(widget.rightBotRaduis),
    //           ),
    //         ),
    //         child: Stack(
    //           alignment: Alignment.center,
    //           children: <Widget>[
    //             AutoCompleteTextView(
    //               readOnly: widget.readOnly,
    //               focusNode: widget.focusNode,
    //               dropDownDxOffset: widget.dropDownDxOffset,
    //               dropDownWidth: widget.dropDownWidth,
    //               tfInitialText: widget.text,
    //               tfCursorColor: Colors.black,
    //               tfStyle: widget.textStyle ??
    //                   widget.labelStyle.copyWith(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w500,
    //                     color: Colors.black87,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //               controller: _controller,
    //               suggestionsApiFetchDelay: 1,
    //               getSuggestionsMethod: MapHelper.getLocationsSuggestions,
    //               focusGained: widget.onFocus ?? () {},
    //               focusLost: widget.onFocusLost ?? () {},
    //               onValueChanged: (String value) {
    //                 if (widget.onTextChange != null) {
    //                   widget.onTextChange!(value);
    //                 }
    //                 if (!_showClearBtn && value.length >= 3) {
    //                   setState(() {
    //                     _showClearBtn = true;
    //                   });
    //                 }

    //                 if (_showClearBtn && value.length < 3) {
    //                   setState(() {
    //                     _showClearBtn = false;
    //                   });
    //                 }
    //               },
    //               onTapCallback: (String placeId, String name) async {
    //                 mezDbgPrint(
    //                     "place id =============================>$placeId");
    //                 final MezLocation? _loc =
    //                     await MapHelper.getLocationFromPlaceId(placeId);
    //                 if (_loc != null) {
    //                   widget.notifyParent(_loc);
    //                   setState(() {
    //                     _showClearBtn = false;
    //                   });
    //                 }
    //               },
    //               tfTextDecoration: InputDecoration(
    //                   fillColor: widget.bgColor,
    //                   enabledBorder: OutlineInputBorder(
    //                       borderSide: BorderSide.none,
    //                       borderRadius: BorderRadius.circular(10)),
    //                   focusedBorder: OutlineInputBorder(
    //                       borderSide: BorderSide.none,
    //                       borderRadius: BorderRadius.circular(10)),
    //                   contentPadding: widget.hintPadding,
    //                   hintText: _i18n()["address"],
    //                   hintStyle: TextStyle(
    //                       color: Color.fromRGBO(141, 141, 141, 1),
    //                       fontSize: 16.33,
    //                       fontWeight: FontWeight.w400,
    //                       fontFamily: 'psr'),
    //                   border: InputBorder.none,
    //                   suffixIconConstraints: BoxConstraints(
    //                     maxWidth: 30,
    //                   ),
    //                   suffixIcon: Padding(
    //                     padding: widget.suffixPadding,
    //                     child: setSuffixIcon(),
    //                   )),
    //             ),
    //             // Padding(
    //             //   padding: const EdgeInsets.only(left: 10.0, top: 5),
    //             //   child: Text(
    //             //     widget.label,
    //             //     style: widget.labelStyle,
    //             //   ),
    //             // ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      fillColor: Colors.white,
      label: Text(widget.initialTextValue ?? ""),
      labelStyle: widget.textStyle ??
          widget.labelStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            overflow: TextOverflow.ellipsis,
          ),
      isDense: true,
      suffixIconConstraints: BoxConstraints(
        maxWidth: 30,
      ),
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 3),
        child: setSuffixIcon(),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    );
  }

  Widget setSuffixIcon() {
    if (_controller.text.length > 3) {
      return Container(
        // margin: EdgeInsets.only(right: 5),
        // padding: EdgeInsets.only(bottom: 1),
        alignment: Alignment.centerRight,
        child: GestureDetector(
            onTap: () async {
              setState(() {
                _controller.clear();
                widget.onClear();
              });
            },
            child: Icon(Icons.cancel, size: 20, color: Colors.grey.shade700)),
      );
    } else {
      if (widget.showSearchIcon) {
        return Icon(MezcalmosIcons.search, size: 16, color: Colors.black);
      } else
        return SizedBox();
    }
  }
}
