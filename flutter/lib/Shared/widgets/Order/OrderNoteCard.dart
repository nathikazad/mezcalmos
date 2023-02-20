import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["components"]["notesWidget"];

class OrderNoteCard extends StatelessWidget {
  const OrderNoteCard({super.key, required this.note});
  final String? note;
  @override
  Widget build(BuildContext context) {
    if (note != null && note!.isNotEmpty) {
      return Card(
        margin: const EdgeInsets.only(top: 15),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _i18n()['notes'],
                style: Get.textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 4),
              Container(
                child: Text(
                  note!,
                  style: Get.textTheme.subtitle2,
                ),
              ),
            ],
          ),
        ),
      );
    } else
      return SizedBox();
  }
}
