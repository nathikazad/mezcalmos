import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpItemCard extends StatelessWidget {
  const ROpItemCard({Key? key, required this.item}) : super(key: key);
  final Item item;
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: CachedNetworkImageProvider(item.image!),
            ),
            SizedBox(
              width: 5,
            ),
            Text(item.name[userLanguage] ?? "")
          ],
        ),
      ),
    );
  }
}
