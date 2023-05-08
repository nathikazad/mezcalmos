import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/controllers/BsRentalViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpDropDown.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingPricesList.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServiceImagesGrid.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

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
        label: "Save",
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
                text: "English",
              ),
              Tab(
                text: "Spanish",
              )
            ], controller: viewController.tabController)),
        titleWidget: Obx(() => Text(viewController.rental != null
            ? "${viewController.rental!.details.name.getTranslation(userLanguage)}"
            : "Rental")));
  }

  Widget _secondaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.detailsController.scNameController,
            decoration: InputDecoration(
              hintText: "Add rental name",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter name";
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            "Description",
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            maxLines: 7,
            minLines: 5,
            controller:
                viewController.detailsController.scDescriptionController,
            decoration: InputDecoration(
              hintText: "Enter a description for your rental",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter description";
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
                      "Types of vehicle",
                      style: context.textTheme.bodyLarge,
                    ),
                    smallSepartor,
                    FormField(validator: (value) {
                      if (viewController.rentalCategory2.value == null) {
                        return "Please select category";
                      }
                      return null;
                    }, builder: (state) {
                      return Column(
                        children: [
                          Obx(
                            () => BsOpDropdown(
                              labelText: "Select your vehicle type",
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
                          Container(
                            padding: const EdgeInsets.only(top: 5, left: 12),
                            child: Text(state.errorText ?? "",
                                style: context
                                    .theme.inputDecorationTheme.errorStyle),
                          ),
                        ],
                      );
                    }),
                    smallSepartor,
                  ],
                )
              : SizedBox.shrink(),
          Text(
            "Images",
            style: context.textTheme.bodyLarge,
          ),
          Text(
            "You can only upload up to five images.",
          ),
          smallSepartor,
          BsOpServiceImagesGrid(
            detailsController: viewController.detailsController,
          ),
          bigSeperator,
          Text(
            "Name",
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.detailsController.nameController,
            decoration: InputDecoration(
              hintText: "Add rental name",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter name";
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            "Description",
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            maxLines: 7,
            minLines: 5,
            controller: viewController.detailsController.descriptionController,
            decoration: InputDecoration(
              hintText: "Enter a description for your rental",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter description";
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
                        "Rental Details",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Text(
                        "Motorcycle Type",
                        style: context.textTheme.bodySmall,
                      ),
                      smallSepartor,
                      FormField(validator: (value) {
                        if (viewController.rentalCategory3.value == null) {
                          return "Please select category";
                        }
                        return null;
                      }, builder: (state) {
                        return Column(
                          children: [
                            BsOpDropdown(
                              labelText: "Select your motorcycle type",
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
                            Container(
                              padding: const EdgeInsets.only(top: 5, left: 12),
                              child: Text(state.errorText ?? "",
                                  style: context
                                      .theme.inputDecorationTheme.errorStyle),
                            ),
                          ],
                        );
                      }),
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
                      "Rental Details",
                      style: context.textTheme.bodyLarge,
                    ),
                    smallSepartor,
                    Text(
                      "Length",
                      style: context.textTheme.bodySmall,
                    ),
                    smallSepartor,
                    TextFormField(
                      controller: viewController.surfBoardLengthController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Surf board Length",
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
                          return "Please board length";
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
