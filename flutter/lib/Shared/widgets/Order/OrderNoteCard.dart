import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["components"]["notesWidget"];

class OrderNoteCard extends StatelessWidget {
  const OrderNoteCard({super.key, required this.note, this.margin});
  final String? note;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    if (note != null && note!.isNotEmpty) {
      return Card(
        margin: margin ?? const EdgeInsets.only(bottom: 0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _i18n()['notes'],
                style: Get.textTheme.bodyLarge,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 4),
              Container(
                child: Text(
                  note!,
                  //  style: Get.textTheme.titleSmall,
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      );
    } else
      return SizedBox();
  }
}
