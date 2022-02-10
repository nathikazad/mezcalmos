import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    return Container(
      margin: EdgeInsets.all(8),
      child: TextField(
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
            labelText: '${i18n.strings["shared"]["placeHolders"]["search"]}',
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
