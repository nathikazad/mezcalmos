import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/controllers/BsRentalViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingPricesList.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServiceImagesGrid.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpRentalView extends StatefulWidget {
  const BsOpRentalView({Key? key}) : super(key: key);
  static Future<bool?> navigate({
    required int? id,
    required RentalCategory1 rentalCategory,
  }) async {
    String route = BusinessOpRoutes.kBsOpRental;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(
      route,
      arguments: {
        "rentalCategory": rentalCategory,
      },
    );
    return MezRouter.backResult;
  }

  @override
  _BsOpRentalViewState createState() => _BsOpRentalViewState();
}

class _BsOpRentalViewState extends State<BsOpRentalView>
    with TickerProviderStateMixin {
  BsRentalViewController viewController = BsRentalViewController();
  late RentalCategory1 rentalCategory;
  @override
  void initState() {
    rentalCategory =
        MezRouter.bodyArguments!["rentalCategory"] as RentalCategory1;
    viewController.init(
      category1: rentalCategory,
      thickerProvider: this,
    );
    int? id = int.tryParse(MezRouter.urlArguments["id"].toString());
    if (id != null) {
      viewController.initEditMode(id: id);
    }

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      bottomNavigationBar: MezButton(
        label: _i18n()["save"],
        withGradient: true,
        borderRadius: 0,
        onClick: () async {
          await viewController.save();
        },
      ),
      body: TabBarView(
        controller: viewController.tabController,
        children: [
          Form(key: viewController.formKey, child: _primaryTab(context)),
          Form(key: viewController.scFormKey, child: _secondaryTab(context)),
        ],
      ),
    );
  }

  AppBar _appbar() {
    return MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back(backResult: viewController.shouldRefetch);
    },
        tabBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(tabs: [
              Tab(
                text: _i18n()["english"],
              ),
              Tab(
                text: _i18n()["spanish"],
              )
            ], controller: viewController.tabController)),
        titleWidget: Obx(() => Text(viewController.rental != null
            ? "${viewController.rental!.details.name.getTranslation(userLanguage)}"
            : _i18n()["vehicleRental"]["rentalTitle"])));
  }

  Widget _secondaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _i18n()["name"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.detailsController.scNameController,
            decoration: InputDecoration(
              hintText: _i18n()["nameHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["nameError"];
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            _i18n()["description"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            maxLines: 7,
            minLines: 5,
            controller:
                viewController.detailsController.scDescriptionController,
            decoration: InputDecoration(
              hintText: _i18n()["descriptionHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["descriptionError"];
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _primaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => MezItemAvSwitcher(
              value: viewController.detailsController.isAvailable.value,
              onAvalableTap: () {
                viewController.detailsController.isAvailable.value = true;
              },
              onUnavalableTap: () {
                viewController.detailsController.isAvailable.value = false;
              },
            ),
          ),
          bigSeperator,
          rentalCategory == RentalCategory1.Vehicle
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _i18n()["vehicleRental"]["vehicleType"],
                      style: context.textTheme.bodyLarge,
                    ),
                    smallSepartor,
                    Obx(
                      () => MezStringDropDown(
                        langPath: _i18n()["vehicleRental"],
                        validator: (p0) {
                          if (viewController.rentalCategory2.value == null) {
                            return _i18n()["categoryError"];
                          }
                          return null;
                        },
                        labelText: _i18n()["vehicleRental"]["vehicleTypeHint"],
                        value: viewController.rentalCategory2.value
                            ?.toFirebaseFormatString(),
                        items: RentalCategory2.values
                            .map((e) => e.toFirebaseFormatString())
                            .toList(),
                        onChanged: (value) {
                          viewController.rentalCategory2.value =
                              value.toString().toRentalCategory2();
                        },
                      ),
                    ),
                    smallSepartor,
                  ],
                )
              : SizedBox.shrink(),
          Text(
            _i18n()["image"],
            style: context.textTheme.bodyLarge,
          ),
          Text(
            _i18n()["imageInfo"],
          ),
          smallSepartor,
          BsOpServiceImagesGrid(
            detailsController: viewController.detailsController,
          ),
          bigSeperator,
          Text(
            _i18n()["name"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.detailsController.nameController,
            decoration: InputDecoration(
              hintText: _i18n()["nameHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["nameError"];
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            _i18n()["description"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            maxLines: 7,
            minLines: 5,
            controller: viewController.detailsController.descriptionController,
            decoration: InputDecoration(
              hintText: _i18n()["descriptionHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["descriptionError"];
              }
              return null;
            },
          ),
          bigSeperator,
          BsOpOfferingPricesList(
            availbleUnits: viewController.avalbleUnits,
            onAddPrice: (TimeUnit unit) {
              viewController.detailsController.addPriceTimeUnit(timeUnit: unit);
            },
            onRemovePrice: (TimeUnit unit) {
              viewController.detailsController.removeTimeUnit(unit);
            },
            seletedPrices: viewController.detailsController.priceTimeUnitMap,
          ),
          smallSepartor,

          /// This to show rental details only when rental is Motorcycle
          Obx(
            () => viewController.rentalCategory2.value ==
                        RentalCategory2.Motorcycle &&
                    rentalCategory == RentalCategory1.Vehicle
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bigSeperator,
                      Text(
                        _i18n()["vehicleRental"]["rentalDetails"],
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Text(
                        _i18n()["vehicleRental"]["motorcycleType"],
                        style: context.textTheme.bodySmall,
                      ),
                      smallSepartor,
                      MezStringDropDown(
                        langPath: _i18n()["vehicleRental"],
                        validator: (value) {
                          if (viewController.rentalCategory3.value == null) {
                            return _i18n()["categoryError"];
                          }
                          return null;
                        },
                        labelText:
                            "${_i18n()["vehicleRental"]["motorcycleTypeHint"]}",
                        value: viewController.rentalCategory3.value
                            ?.toFirebaseFormatString(),
                        items: RentalCategory3.values
                            .map((e) => e.toFirebaseFormatString())
                            .toList(),
                        onChanged: (value) {
                          viewController.rentalCategory3.value =
                              value.toString().toRentalCategory3();
                        },
                      ),
                      smallSepartor,
                    ],
                  )
                : SizedBox.shrink(),
          ),

          /// This to show rental details only when rental is Surf
          rentalCategory == RentalCategory1.Surf
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bigSeperator,
                    Text(
                      _i18n()["vehicleRental"]["rentalDetails"],
                      style: context.textTheme.bodyLarge,
                    ),
                    smallSepartor,
                    Text(
                      _i18n()["vehicleRental"]["length"],
                      style: context.textTheme.bodySmall,
                    ),
                    smallSepartor,
                    TextFormField(
                      controller: viewController.surfBoardLengthController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: _i18n()["vehicleRental"]["surfLength"],
                        suffixIconConstraints: BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ).tighten(width: 80),
                        suffixIcon: Text(
                          "feet",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return _i18n()["vehicleRental"]["surfLengthError"];
                        }
                        return null;
                      },
                    ),
                    smallSepartor,
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
