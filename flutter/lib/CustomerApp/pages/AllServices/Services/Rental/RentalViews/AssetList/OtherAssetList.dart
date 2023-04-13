import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/OtherRentalController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/HomeCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class OtherAssetList extends StatefulWidget {
  const OtherAssetList({super.key, required this.otherRentalController});
  @override
  State<OtherAssetList> createState() => _OtherAssetListState();
  final OtherRentalController otherRentalController;
}

class _OtherAssetListState extends State<OtherAssetList> {
  final AssetController assetController = Get.find<AssetController>();
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final OtherRentalController otherRentalController =
        widget.otherRentalController;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => otherRentalController.homeRentalData.isEmpty
              ? const Center(
                  child: Text("Empty"),
                )
              : ListView.builder(
                  controller: otherRentalController.assetScrollController,
                  itemCount: otherRentalController.homeRentalData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String title = otherRentalController
                            .homeRentalData[index]
                            .details
                            .name[languageController.userLanguageKey] ??
                        otherRentalController
                            .homeRentalData[index].details.name[Language.EN]
                            .toString();
                    final String agencyName = otherRentalController
                            .homeRentalData[index]
                            .details
                            .name[languageController.userLanguageKey] ??
                        otherRentalController
                            .homeRentalData[index].details.name[Language.EN]
                            .toString();
                    return HomeCard(
                      title: title,
                      agencyName: agencyName,
                      image: NetworkImage(customImageUrl),
                      perDayPrice: 234,
                      roomSpace: 330,
                      totalRooms: 3,
                      serviceId: otherRentalController
                          .homeRentalData[index].details.id
                          .toString(),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
