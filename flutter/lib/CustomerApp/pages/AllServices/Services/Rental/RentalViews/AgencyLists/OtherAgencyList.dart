import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/OtherRentalController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyListTile.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AgencyServiceView/AgencyServiceView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class OtherAgencyList extends StatefulWidget {
  const OtherAgencyList({
    super.key,
    required this.otherRentalController,
  });

  final OtherRentalController otherRentalController;

  @override
  State<OtherAgencyList> createState() => _OtherAgencyListState();
}

class _OtherAgencyListState extends State<OtherAgencyList> {
  late OtherRentalController otherRentalController;
  LanguageController languageController = Get.find<LanguageController>();
  @override
  void initState() {
    super.initState();
    otherRentalController = widget.otherRentalController;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: otherRentalController.agencyRentalData.isEmpty
              ? const Center(
                  child: Text("Empty"),
                )
              : ListView.builder(
                  controller: otherRentalController.agencyScrollController,
                  itemCount: otherRentalController.agencyRentalData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String image =
                        otherRentalController.agencyRentalData[index].image;
                    return AgencyListTile(
                      onClick: () {
                        AgencyServiceView.navigate(
                          businessId: otherRentalController
                              .agencyRentalData[index].id
                              .toString(),
                        );
                      },
                      titleText:
                          otherRentalController.agencyRentalData[index].name,
                      rating: otherRentalController
                              .agencyRentalData[index].avgRating ??
                          0.0,
                      reviewCount: otherRentalController
                              .agencyRentalData[index].reviewCount ??
                          0,
                      imageUrl: image,
                      iconsList: otherRentalController
                          .agencyRentalData[index].acceptedPayments,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
