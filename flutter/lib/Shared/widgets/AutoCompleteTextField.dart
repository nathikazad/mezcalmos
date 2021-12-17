import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:rxdart/rxdart.dart';

class AutoCompleteTextView extends StatefulWidget {
  final double maxHeight;
  final TextEditingController controller;

  //AutoCompleteTextField properties
  final tfCursorColor;
  final tfCursorWidth;
  final tfStyle;
  final tfTextDecoration;
  final tfTextAlign;
  //Suggestiondrop Down properties
  final suggestionStyle;
  final String? tfInitialText;
  final suggestionTextAlign;
  final onTapCallback;
  final readOnly;
  final Function getSuggestionsMethod;
  final Function focusGained;
  final Function focusLost;
  final int suggestionsApiFetchDelay;
  final Function onValueChanged;
  final String tfHint;
  final double? dropDownWidth;
  final double? dropDownDxOffset;
  final FocusNode? focusNode;

  AutoCompleteTextView(
      {required this.controller,
      this.tfHint = "",
      this.onTapCallback,
      this.tfInitialText = null,
      this.readOnly = false,
      this.maxHeight = 200,
      this.tfCursorColor = Colors.white,
      this.tfCursorWidth = 2.0,
      this.tfStyle = const TextStyle(
        color: Colors.black87,
        fontSize: 15,
        fontFamily: 'psb',
        fontWeight: FontWeight.w500,
      ),
      this.tfTextDecoration = const InputDecoration(),
      this.tfTextAlign = TextAlign.left,
      this.suggestionStyle = const TextStyle(
        color: Colors.black87,
        fontSize: 15,
        fontFamily: 'psb',
        fontWeight: FontWeight.w500,
      ),
      this.suggestionTextAlign = TextAlign.left,
      required this.getSuggestionsMethod,
      required this.focusGained,
      this.suggestionsApiFetchDelay = 0,
      this.dropDownDxOffset,
      this.dropDownWidth,
      this.focusNode,
      required this.focusLost,
      required this.onValueChanged});
  @override
  _AutoCompleteTextViewState createState() => _AutoCompleteTextViewState();

  //This funciton is called when a user clicks on a suggestion
  // @override
  // void onTappedSuggestion(String suggestion) {
  //   onTapCallback(suggestion);
  // }
}

class _AutoCompleteTextViewState extends State<AutoCompleteTextView> {
  ScrollController scrollController = ScrollController();
  FocusNode _focusNode = FocusNode();
  late OverlayEntry _overlayEntry;
  LayerLink _layerLink = LayerLink();
  final suggestionsStreamController = new BehaviorSubject<List<String>>();
  List<String> suggestionShowList = <String>[];
  // place_id => description aka name
  Map<String, String> idWithDescription = {};

  Timer? _debounce;
  bool isSearching = true;

  FocusNode getActiveFocusNode() {
    return widget.focusNode ?? this._focusNode;
  }

  @override
  void initState() {
    super.initState();
    getActiveFocusNode().addListener(() {
      if (getActiveFocusNode().hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context)?.insert(this._overlayEntry);
        widget.focusGained();
      } else {
        this._overlayEntry.remove();
        widget.focusLost();
      }
    });
    widget.controller.addListener(_onSearchChanged);
  }

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(seconds: widget.suggestionsApiFetchDelay), () {
      if (isSearching == true) {
        _getSuggestions(widget.controller.text);
      }
    });
  }

  _getSuggestions(String data) async {
    if (data.length >= 3) {
      idWithDescription.clear();
      idWithDescription = await widget.getSuggestionsMethod(data);

      suggestionsStreamController.sink.add(idWithDescription.values.toList());
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    return OverlayEntry(
        builder: (context) => Positioned(
              width: widget.dropDownWidth ?? size.width,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset:
                    Offset(widget.dropDownDxOffset ?? 0.0, size.height + 5.0),
                child: Material(
                  elevation: 4.0,
                  child: StreamBuilder<Object>(
                      stream: suggestionsStreamController.stream,
                      builder: (context, suggestionData) {
                        if (suggestionData.hasData &&
                            widget.controller.text.isNotEmpty) {
                          suggestionShowList =
                              suggestionData.data as List<String>;
                          return ConstrainedBox(
                            constraints: new BoxConstraints(
                              maxHeight: 250,
                            ),
                            child: ListView.builder(
                                controller: scrollController,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: suggestionShowList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    minLeadingWidth: 10,
                                    leading: Icon(Icons.search_rounded),
                                    title: Text(
                                      suggestionShowList[index],
                                      style: widget.suggestionStyle,
                                      textAlign: widget.suggestionTextAlign,
                                    ),
                                    onTap: () {
                                      isSearching = false;
                                      widget.controller.text =
                                          suggestionShowList[index];
                                      mezDbgPrint(idWithDescription.keys);
                                      String placeId = idWithDescription.keys
                                          .firstWhere((placeId) {
                                        mezDbgPrint(placeId);

                                        return idWithDescription[placeId] ==
                                            suggestionShowList[index];
                                      });

                                      suggestionsStreamController.sink.add([]);
                                      // placeId along with name.
                                      getActiveFocusNode().unfocus();
                                      widget.onTapCallback(
                                          placeId, widget.controller.text);
                                    },
                                  );
                                }),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (widget.controller.text.isEmpty && widget.tfInitialText != null) {
        widget.controller.text = widget.tfInitialText!;
      }
    });

    return CompositedTransformTarget(
      link: this._layerLink,
      child: TextField(
        readOnly: widget.readOnly,
        controller: widget.controller,
        decoration: widget.tfTextDecoration,
        style: widget.tfStyle,
        cursorColor: widget.tfCursorColor,
        cursorWidth: widget.tfCursorWidth,
        textAlign: widget.tfTextAlign,
        focusNode: getActiveFocusNode(),
        onChanged: (text) {
          if (text.trim().isNotEmpty) {
            widget.onValueChanged(text);

            isSearching = true;
            if (scrollController.hasClients) {
              scrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
            }
          } else {
            isSearching = false;
            suggestionsStreamController.sink.add([]);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    suggestionsStreamController.close();
    scrollController.dispose();
    widget.controller.dispose();
    super.dispose();
  }
}
