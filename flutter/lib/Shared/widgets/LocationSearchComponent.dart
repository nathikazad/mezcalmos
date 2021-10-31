import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AutoCompleteTextField.dart';

typedef LocationChangesNotifier = void Function(Location msg);

// Location Search component
class LocationSearchComponent extends StatefulWidget {
  final String label;
  final LocationChangesNotifier notifyParent;
  final Function onClear;

  LocationSearchComponent(
      {required this.label,
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

  Future<Map<String, String>> _getLocationsSuggestions(String search) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&language=${_lang.userLanguageKey}&components=country:mx&key=$placesApikey";

    http.Response resp = await http.get(Uri.parse(url));
    Map<String, dynamic> respJson = json.decode(resp.body);
    Map<String, String> _returnedPredictions = <String, String>{};

    if (respJson["status"] == "OK") {
      respJson["predictions"].forEach((pred) {
        if (pred["description"].toLowerCase().contains(search.toLowerCase())) {
          _returnedPredictions[pred["place_id"]] = pred["description"];
        }
      });
    }

    mezDbgPrint(_returnedPredictions.length);

    return _returnedPredictions;
  }

  Future<void> _getLocationFromPlaceId(String placeId, String name) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$placesApikey";
    http.Response resp = await http.get(Uri.parse(url));
    Map<String, dynamic> respJson = json.decode(resp.body);

    if (respJson["status"] == "OK") {
      double lat = respJson["result"]["geometry"]["location"]["lat"];
      double lng = respJson["result"]["geometry"]["location"]["lng"];
      String address = respJson["result"]["formatted_address"];
      widget
          .notifyParent(Location({"address": address, "lat": lat, "lng": lng}));

      setState(() {
        // isTfEnabled = false;
        _showClearBtn = true;
      });
    } else {
      // in case there is a problem on request!

      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                tfCursorColor: Colors.black,
                controller: _controller,
                suggestionsApiFetchDelay: 1,
                getSuggestionsMethod: _getLocationsSuggestions,
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
                onTapCallback: _getLocationFromPlaceId,
                tfTextDecoration: InputDecoration(
                  hintText: "Enter Address",
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
