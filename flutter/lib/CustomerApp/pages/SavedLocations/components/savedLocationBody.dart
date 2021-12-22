import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

import 'SavedLocationComponent.dart';

class SavedLocationBody extends StatelessWidget {
  SavedLocationBody({Key? key, required this.savedLocations}) : super(key: key);
  final List<SavedLocation> savedLocations;
  int getLocationNumbers() {
    return savedLocations.length;
  }

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Container(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(right: 16, bottom: 10, left: 16),
            child: Row(
              children: [
                Container(
                  child: Text(
                      lang.strings["customer"]["savedLocations"]["title"],
                      style: txt.headline1!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                      textAlign: TextAlign.left),
                ),
                Spacer(),
                Container(
                  child: Text(
                      "${getLocationNumbers()} ${lang.strings["customer"]["savedLocations"]["location"]}${getLocationNumbers() > 1 ? 's' : ''}",
                      style: txt.headline4!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                      textAlign: TextAlign.right),
                )
              ],
            ),
          ),
          ...savedLocations.map((savedLocation) => SavedLocationComponent(
                savelocation: savedLocation,
                onPress: () {
                  Get.back(result: savedLocation);
                },
              )),
          SizedBox(
            height: 25,
          ),
        ],
      )),
    );
  }
}
