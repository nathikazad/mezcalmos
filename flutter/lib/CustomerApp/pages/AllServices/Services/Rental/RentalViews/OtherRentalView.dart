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
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

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

  @override
  void initState() {
    super.initState();
    viewName = MezRouter.bodyArguments!["viewEnum"] as RentalViewEnum;
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

  void openFilterModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final Map<RentalCategory2, bool> checkBoxListValue = {
            RentalCategory2.Motorcycle:
                otherRentalController.category2[RentalCategory2.Motorcycle] ??
                    false,
            RentalCategory2.Car:
                otherRentalController.category2[RentalCategory2.Car] ?? false,
          };
          final style = Theme.of(context).textTheme;
          return SizedBox(
            height: 250,
            child: StatefulBuilder(builder: (context, setState) {
              return Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Filter",
                            style: style.titleMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        _i18n()[allServiceListViewController
                                    .currentSelectedService.value.name
                                    .toLowerCase()]
                                [assetController.getViewNameString]["title"]
                            .toString(),
                        style: style.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: checkBoxListValue.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            activeColor: primaryBlueColor,
                            onChanged: (value) {
                              setState(() {
                                checkBoxListValue[checkBoxListValue.keys
                                    .toList()[index]] = value ?? false;
                                mezDbgPrint(
                                    "CheckboxListTile: $value $checkBoxListValue");
                              });
                            },
                            value: checkBoxListValue[
                                checkBoxListValue.keys.toList()[index]],
                            title: Text(
                                checkBoxListValue.keys.toList()[index].name),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: MezButton(
                                  label: "Cancel",
                                  onClick: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: MezButton(
                                  label: "Confirm",
                                  withGradient: true,
                                  onClick: () async {
                                    if (checkBoxListValue.values
                                        .contains(true)) {
                                      otherRentalController.changeVehicleFilter(
                                        value: checkBoxListValue,
                                      );
                                      Navigator.pop(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text("Add atleast 1 filter"),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        });
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
                Obx(
                  () => assetController.currentSelectedView.value ==
                              assetController.currentSelectedViewList.first &&
                          viewName == RentalViewEnum.Vehicle
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: MezCard(
                            onClick: () {
                              openFilterModalSheet();
                            },
                            content: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.filter_alt,
                                ),
                                Text("Filter: "),
                                Obx(
                                  () => Text(
                                    otherRentalController.filterString.value,
                                    style: style.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Offstage(),
                ),
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
