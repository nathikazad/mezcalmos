import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

import 'SavedLocationComponent.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["SavedLocations"]["components"]["SavedLocationBody"];

class SavedLocationBody extends StatelessWidget {
  const SavedLocationBody({
    Key? key,
    required this.savedLocations,
  }) : super(key: key);

  final List<SavedLocation> savedLocations;

  int getLocationNumbers() {
    return savedLocations.length;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(right: 16, bottom: 10, left: 16),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(_i18n()["title"],
                      style: txt.headline1!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                      textAlign: TextAlign.center),
                ),
                const Spacer(),
                Container(
                  child: Text(
                    "${getLocationNumbers()} ${_i18n()["location"]}${getLocationNumbers() > 1 ? 's' : ''}",
                    style: txt.headline4!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          ...savedLocations.map(
            (SavedLocation savedLocation) => SavedLocationComponent(
              savelocation: savedLocation,
            ),
          ),
          const SizedBox(height: 25),
        ],
      )),
    );
  }
}
