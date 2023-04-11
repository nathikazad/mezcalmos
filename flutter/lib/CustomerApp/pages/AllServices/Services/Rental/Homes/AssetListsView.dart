import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalServicesView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/RentalController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/AppBarActionButton.dart';
import 'AssetListView/AssetListView.dart';
import '../components/ButtonSwitcher.dart';
import 'controller/AssetController.dart';
import 'AgencyListView/AgencyListView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'dart:developer';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class AssetListsView extends StatefulWidget {
  const AssetListsView({super.key});

  @override
  State<AssetListsView> createState() => _AssetListsViewState();

  static Future<void> navigate({required RentalViewEnum viewEnum}) {
    return MezRouter.toPath(RentalRoutes.rentalServiceRoute, arguments: {
      "viewEnum": viewEnum,
    });
  }
}

class _AssetListsViewState extends State<AssetListsView> {
  late AssetController assetController;
  late AllServiceListViewController allServiceListViewController;

  @override
  void initState() {
    super.initState();
    final RentalViewEnum viewName =
        MezRouter.bodyArguments!["viewEnum"] as RentalViewEnum;
    log("viewName $viewName ${viewName.runtimeType}");
    Get.put(AssetController());
    allServiceListViewController = Get.find<AllServiceListViewController>();
    assetController = Get.find<AssetController>();
    assetController.init(viewEnum: viewName);
    fetchRentals();
  }

  void fetchRentals() async {
    final List<Rental> _rental = await get_rental_by_category(
        category1: RentalCategory1.Home,
        distance: 100000,
        fromLocation: Location(lat: 15.8, lng: -97),
        withCache: true);
    mezDbgPrint("Rentals: ${_rental}");
  }

  @override
  void dispose() {
    assetController.dispose();
    super.dispose();
  }

  bool doesNeedButtonSwitcher() {
    if (allServiceListViewController.currentSelectedService.value.name ==
            RentalViewEnum.Wellness.name ||
        allServiceListViewController.currentSelectedService.value.name ==
            RentalViewEnum.Volunteer.name ||
        assetController.viewName.name == RentalViewEnum.Activities.name ||
        assetController.viewName.name == RentalViewEnum.Tour.name ||
        assetController.viewName.name == RentalViewEnum.Parties.name ||
        assetController.viewName.name == RentalViewEnum.Dance.name ||
        assetController.viewName.name == RentalViewEnum.GetTogether.name) {
      return false;
    }
    return true;
  }

  bool isNoSubService() {
    if (allServiceListViewController.currentSelectedService.value.name ==
            RentalViewEnum.Wellness.name ||
        allServiceListViewController.currentSelectedService.value.name ==
            RentalViewEnum.Volunteer.name) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        titleWidget: Text(isNoSubService()
            ? _i18n()[allServiceListViewController
                    .currentSelectedService.value.name
                    .toLowerCase()]["title"]
                .toString()
            : _i18n()[allServiceListViewController
                    .currentSelectedService.value.name
                    .toLowerCase()][assetController.getViewNameString]["title"]
                .toString()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
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
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: MezCard(
                      radius: 5,
                      content: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Icon(
                          Icons.location_on,
                          size: 24,
                          color: primaryBlueColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          !doesNeedButtonSwitcher()
              ? const Offstage()
              : Padding(
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
          Obx(
            () => assetController.currentSelectedView.value ==
                    assetController.currentSelectedViewList.first
                ? AssetListView()
                : AgencyListView(),
          ),
        ],
      ),
    );
  }
}
