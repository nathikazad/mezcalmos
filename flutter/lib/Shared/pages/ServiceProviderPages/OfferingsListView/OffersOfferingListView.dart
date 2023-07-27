import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/OfferingsListView/controller/OffersOfferingListViewController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/controllers/ServiceOfferEditViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class OffersOfferingListView extends StatefulWidget {
  const OffersOfferingListView({super.key});

  @override
  State<OffersOfferingListView> createState() => _OffersOfferingListViewState();

  static Future<List<OfferingData>> navigate({
    List<OfferingData>? selectedOfferingData,
  }) async {
    await MezRouter.toPath(
      SharedServiceProviderRoutes.kServiceOfferingListView,
      arguments: {
        "selectedOfferingData": selectedOfferingData,
      },
    );
    return MezRouter.backResult;
  }
}

class _OffersOfferingListViewState extends State<OffersOfferingListView> {
  OffersOfferingListViewController viewController =
      OffersOfferingListViewController();
  LanguageController languageController = Get.find<LanguageController>();

  @override
  void initState() {
    super.initState();
    final List<OfferingData>? selectedOfferingData =
        MezRouter.bodyArguments!["selectedOfferingData"] as List<OfferingData>?;
    viewController.init(
      selectedOfferingData: selectedOfferingData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: MezcalmosAppBar(
          AppBarLeftButtonType.Back,
          onClick: () async {
            await MezRouter.back(
              backResult: viewController.allOfferings,
            );
          },
          title: "Offerings",
        ),
        bottomNavigationBar: MezButton(
          label: "Save",
          onClick: () async {
            await MezRouter.back(
              backResult: viewController.allOfferings,
            );
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              viewController.allOfferings.length,
              (index) {
                return MezCard(
                  content: CheckboxListTile(
                    onChanged: (value) {
                      viewController.changeOfferingSelection(
                        offeringData: viewController.allOfferings[index],
                        value: value!,
                      );
                    },
                    value: viewController.allOfferings[index].value,
                    title: Text(
                      viewController.allOfferings[index].name.getTranslation(
                              Get.find<LanguageController>().userLanguageKey) ??
                          "",
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
