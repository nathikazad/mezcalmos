import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/OtherRentalController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class VehicleFilterCard extends StatefulWidget {
  const VehicleFilterCard({
    super.key,
    required this.assetController,
    required this.viewName,
    required this.otherRentalController,
    required this.allServiceListViewController,
  });

  final AssetController assetController;
  final RentalViewEnum viewName;
  final OtherRentalController otherRentalController;
  final AllServiceListViewController allServiceListViewController;

  @override
  State<VehicleFilterCard> createState() => _VehicleFilterCardState();
}

class _VehicleFilterCardState extends State<VehicleFilterCard> {
  late AssetController assetController;
  late OtherRentalController otherRentalController;
  late AllServiceListViewController allServiceListViewController;

  @override
  void initState() {
    super.initState();
    assetController = widget.assetController;
    otherRentalController = widget.otherRentalController;
    allServiceListViewController = widget.allServiceListViewController;
  }

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Obx(
      () => assetController.currentSelectedView.value ==
                  assetController.currentSelectedViewList.first &&
              widget.viewName == RentalViewEnum.Vehicle
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
    );
  }

  void openFilterModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final Map<RentalCategory2, bool> checkBoxListValue = {
            ...otherRentalController.category2
          };
          final style = Theme.of(context).textTheme;
          return DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
              maxChildSize: 0.5,
              expand: false,
              builder: (context, controller) {
                return StatefulBuilder(builder: (context, setState) {
                  return Scaffold(
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: CustomScrollView(
                            controller: controller,
                            slivers: [
                              SliverToBoxAdapter(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Filter",
                                        style: style.titleMedium!.copyWith(
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    _i18n()[
                                                allServiceListViewController
                                                    .currentSelectedService
                                                    .value
                                                    .name
                                                    .toLowerCase()][
                                            assetController
                                                .getViewNameString]["title"]
                                        .toString(),
                                    style: style.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    return CheckboxListTile(
                                      activeColor: primaryBlueColor,
                                      onChanged: (value) {
                                        setState(() {
                                          checkBoxListValue[checkBoxListValue
                                                  .keys
                                                  .toList()[index]] =
                                              value ?? false;
                                          mezDbgPrint(
                                              "CheckboxListTile: $value $checkBoxListValue");
                                        });
                                      },
                                      value: checkBoxListValue[
                                          checkBoxListValue.keys
                                              .toList()[index]],
                                      title: Text(checkBoxListValue.keys
                                          .toList()[index]
                                          .name),
                                    );
                                  },
                                  childCount: checkBoxListValue.length,
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4.0),
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
                                          padding: const EdgeInsets.only(
                                              left: 4.0),
                                          child: MezButton(
                                            label: "Confirm",
                                            withGradient: true,
                                            onClick: () async {
                                              if (checkBoxListValue.values
                                                  .contains(true)) {
                                                otherRentalController
                                                    .changeVehicleFilter(
                                                  value: checkBoxListValue,
                                                );
                                                Navigator.pop(context);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "Add atleast 1 filter"),
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
                        ),
                      ],
                    ),
                  );
                });
              });
        });
  }
}
