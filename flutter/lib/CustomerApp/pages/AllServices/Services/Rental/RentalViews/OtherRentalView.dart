import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/ClassesService/components/ClassCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/ClassesService/controller/ClassesController.dart';
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
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/components/VehicleFilterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/components/ClassFilterCard.dart';

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
  late RentalViewEnum viewName;

  late ClassesController classesController;

  @override
  void initState() {
    super.initState();
    viewName = MezRouter.bodyArguments!["viewEnum"] as RentalViewEnum;
    log("viewName $viewName ${viewName.runtimeType}");
    assetController.init(viewEnum: viewName);
    fetchDataForCurrentView();
  }

  void fetchDataForCurrentView() {
    switch (viewName) {
      case RentalViewEnum.Surf:
      case RentalViewEnum.Vehicle:
      case RentalViewEnum.Homes:
      case RentalViewEnum.Classes:
        otherRentalController = OtherRentalController(viewName: viewName);
        otherRentalController.init();
        classesController = ClassesController();
        classesController.init();
        break;
      case RentalViewEnum.Wellness:
        // TODO: Handle this case.
        break;
      case RentalViewEnum.Volunteer:
        // TODO: Handle this case.
        break;
      case RentalViewEnum.Tour:
        // TODO: Handle this case.
        break;
      case RentalViewEnum.Activities:
        // TODO: Handle this case.
        break;
      case RentalViewEnum.Parties:
        // TODO: Handle this case.
        break;
      case RentalViewEnum.Dance:
        // TODO: Handle this case.
        break;
      case RentalViewEnum.GetTogether:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  void dispose() {
    assetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
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

                /// Filter card switch logic
                Builder(builder: (context) {
                  switch (assetController.viewName) {
                    case RentalViewEnum.Vehicle:
                      return VehicleFilterCard(
                        assetController: assetController,
                        viewName: viewName,
                        otherRentalController: otherRentalController,
                        allServiceListViewController:
                            allServiceListViewController,
                      );
                    case RentalViewEnum.Classes:
                      return ClassFilterCard(
                        classesController: classesController,
                      );
                    case RentalViewEnum.Surf:
                    case RentalViewEnum.Homes:
                    case RentalViewEnum.Wellness:
                    case RentalViewEnum.Volunteer:
                    case RentalViewEnum.Tour:
                    case RentalViewEnum.Activities:
                    case RentalViewEnum.Parties:
                    case RentalViewEnum.Dance:
                    case RentalViewEnum.GetTogether:
                      return Offstage();
                  }
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
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
          Builder(
            builder: (context) {
              switch (assetController.viewName) {
                /// Handling all three cases for Rentals Service
                case RentalViewEnum.Surf:
                case RentalViewEnum.Vehicle:
                case RentalViewEnum.Homes:
                  return Obx(
                    () => assetController.currentSelectedView.value ==
                            assetController.currentSelectedViewList.first
                        ? OtherAssetList(
                            otherRentalController: otherRentalController,
                          )
                        : OtherAgencyList(
                            otherRentalController: otherRentalController,
                          ),
                  );

                /// Handling case of Classes Service
                case RentalViewEnum.Classes:
                  var tempSchedule = {
                    "Friday": {
                      "from": "10am",
                      "to": "10pm",
                    },
                    "Saturday": {
                      "from": "9am",
                      "to": "9pm",
                    },
                    "Sunday": {
                      "from": "11am",
                      "to": "8pm",
                    },
                  };
                  return Obx(
                    () => assetController.currentSelectedView.value ==
                            assetController.currentSelectedViewList.first
                        ? Expanded(
                            child: ListView(
                              children: [
                                ClassCard(
                                  cardType: ScheduleType.Scheduled,
                                  title: "Scheduled Card",
                                  imageUrl: customImageUrl,
                                  groupName: "groupName",
                                  price: 100,
                                  priceUnit: null,
                                  needAgencyName: true,
                                  agencyName: "Puetro Class",
                                  schedule: tempSchedule,
                                ),
                                ClassCard(
                                  cardType: ScheduleType.OnDemand,
                                  title: "On Demand Card",
                                  imageUrl: customImageUrl,
                                  groupName: "groupName",
                                  price: 100,
                                  priceUnit: "hour",
                                  agencyName: "Puetro Class",
                                  needAgencyName: true,
                                ),
                                ClassCard(
                                  cardType: ScheduleType.OneTime,
                                  title: "On Time Card",
                                  imageUrl: customImageUrl,
                                  groupName: "groupName",
                                  price: 100,
                                  priceUnit: null,
                                  agencyName: "Puetro Class",
                                  needAgencyName: true,
                                  schedule: Map<String,
                                          Map<String, String>>.fromEntries(
                                      [tempSchedule.entries.first]),
                                ),
                              ],
                            ),
                          )
                        : OtherAgencyList(
                            otherRentalController: otherRentalController,
                          ),
                  );

                ///
                case RentalViewEnum.Wellness:
                  return Offstage();

                case RentalViewEnum.Volunteer:
                  return Offstage();

                case RentalViewEnum.Tour:
                  return Offstage();

                case RentalViewEnum.Activities:
                  return Offstage();

                case RentalViewEnum.Parties:
                  return Offstage();

                case RentalViewEnum.Dance:
                  return Offstage();

                case RentalViewEnum.GetTogether:
                  return Offstage();
              }
            },
          ),
        ],
      ),
    );
  }
}
