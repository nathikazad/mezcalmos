import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalServicesView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/OtherRentalController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/AppBarActionButton.dart';
import 'AssetList/OtherAssetList.dart';
import '../components/ButtonSwitcher.dart';
import '../../controller/AssetController.dart';
import 'AgencyLists/OtherAgencyList.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'dart:developer';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class OtherAssetListsView extends StatefulWidget {
  const OtherAssetListsView({super.key});

  @override
  State<OtherAssetListsView> createState() => _OtherAssetListsViewState();

  static Future<void> navigate({required RentalViewEnum viewEnum}) {
    return MezRouter.toPath(RentalRoutes.otherAssetRoute, arguments: {
      "viewEnum": viewEnum,
    });
  }
}

class _OtherAssetListsViewState extends State<OtherAssetListsView> {
  AllServiceListViewController allServiceListViewController =
      Get.find<AllServiceListViewController>();
  AssetController assetController = Get.find<AssetController>();
  MGoogleMapController mGoogleMapController = MGoogleMapController();
  late OtherRentalController otherRentalController;

  @override
  void initState() {
    super.initState();
    final RentalViewEnum viewName =
        MezRouter.bodyArguments!["viewEnum"] as RentalViewEnum;
    log("viewName $viewName ${viewName.runtimeType}");
    assetController.init(viewEnum: viewName);
    otherRentalController = OtherRentalController(viewName: viewName);
    otherRentalController.init();
  }

  @override
  void dispose() {
    assetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        titleWidget: Text(_i18n()[allServiceListViewController
                .currentSelectedService.value.name
                .toLowerCase()][assetController.getViewNameString]["title"]
            .toString()),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: MezCard(
                      contentPadding: EdgeInsets.zero,
                      radius: 5,
                      content: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            prefixIcon: Icon(Icons.search),
                            hintText: _i18n()["search"].toString()),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Obx(
                    () => ButtonSwitcher(
                      lButtonText: _i18n()[allServiceListViewController
                                      .currentSelectedService.value.name
                                      .toLowerCase()]
                                  [assetController.getViewNameString][
                              assetController.currentSelectedViewName.first
                                  .toLowerCase()]
                          .toString(),
                      rButtonText: _i18n()[allServiceListViewController
                                      .currentSelectedService.value.name
                                      .toLowerCase()]
                                  [assetController.getViewNameString][
                              assetController.currentSelectedViewName.last
                                  .toLowerCase()]
                          .toString(),
                      iconList: assetController.iconList,
                      values: assetController.currentSelectedViewList,
                      selectedValue: assetController.currentSelectedView.value,
                      onClick: (Enum value) {
                        assetController.toggleView(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => assetController.currentSelectedView.value ==
                    assetController.currentSelectedViewList.first
                ? OtherAssetList(
                    otherRentalController: otherRentalController,
                  )
                : OtherAgencyList(
                    otherRentalController: otherRentalController,
                  ),
          ),
        ],
      ),
    );
  }
}
