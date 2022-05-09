import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class CustomerLaundrySelectCard extends StatelessWidget {
  const CustomerLaundrySelectCard({Key? key, required this.laundry})
      : super(key: key);
  final Laundry laundry;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Get.toNamed(kLaundryOrderRequest, arguments: laundry);
      },
      child: Container(
        child: Column(
          children: [
            _laundryInfoHeader(),
            // Divider(),
            _costsExpandableComponent()
          ],
        ),
      ),
    ));
  }

  Widget _laundryInfoHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(laundry.info.image),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  laundry.info.name,
                  style: Get.textTheme.bodyText1,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: keyAppColor,
                    ),
                    Flexible(
                      child: Text(laundry.info.location.address,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.subtitle1,
                          maxLines: 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _costsExpandableComponent() {
    return Theme(
        data: Get.theme.copyWith(dividerColor: Colors.transparent),
        child: ListTileTheme(
          dense: true,
          contentPadding: EdgeInsets.zero,
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 8),
            childrenPadding: const EdgeInsets.only(bottom: 8),
            title: Text('Costs'),
            children: List.generate(
                laundry.laundryCosts.lineItems.length,
                (int index) => _laundryCostItemCard(
                    item: laundry.laundryCosts.lineItems[index])),
          ),
        ));
  }

  Widget _laundryCostItemCard({
    required LaundryCostLineItem item,
  }) {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Theme(
      data: Get.theme,
      child: Container(
        // margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(width: 1, color: Colors.grey.shade200))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name[userLanguage] ?? "",
                    style: Get.textTheme.bodyText1),
                Text(
                  "\$${item.cost.round()} /KG",
                  style: Get.textTheme.bodyText1!.copyWith(color: keyAppColor),
                )
              ],
            ),
            // Divider(),
          ],
        ),
      ),
    );
  }
}
