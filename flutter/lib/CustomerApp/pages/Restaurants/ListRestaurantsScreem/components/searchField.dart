import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n = Get.find<LanguageController>().strings["CustomerApp"]["pages"]
    ["Restaurants"]["ListRestaurantsScreem"]["components"]["searchField"];

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextField(
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
            labelText: '${_i18n["search"]}',
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
