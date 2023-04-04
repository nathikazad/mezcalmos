import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOrderView"]["components"]["ROpOrderNote"];

//
class ROpOrderNote extends StatelessWidget {
  const ROpOrderNote({
    Key? key,
    required this.orderNote,
  }) : super(key: key);
  final String? orderNote;

  @override
  Widget build(BuildContext context) {
    if (orderNote != null && orderNote!.isNotEmpty) {
      return Card(
        margin: const EdgeInsets.only(bottom: 25),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${_i18n()["notes"]} ',
                style: context.txt.bodyLarge,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Container(
                child: Text(
                  orderNote!,
                  style: context.txt.subtitle2,
                ),
              ),
            ],
          ),
        ),
      );
    } else
      return Container();
  }
}
