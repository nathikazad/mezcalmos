import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/controllers/BsHomeRentalViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingLocationCard.dart';
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

class BsOpHomeRentalView extends StatefulWidget {
  const BsOpHomeRentalView({Key? key}) : super(key: key);
  static Future<bool?> navigate({required int? id}) async {
    String route = BusinessOpRoutes.kBsOpHomeRental;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(route);
    return MezRouter.backResult;
  }

  @override
  _BsOpHomeRentalViewState createState() => _BsOpHomeRentalViewState();
}

class _BsOpHomeRentalViewState extends State<BsOpHomeRentalView>
    with TickerProviderStateMixin {
  BsHomeRentalViewController viewController = BsHomeRentalViewController();
  @override
  void initState() {
    viewController.init(thickerProvider: this);
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
    return Obx(
      () => Scaffold(
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
            : _i18n()["homeRental"]["rentalTitle"])));
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
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["nameError"];
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: _i18n()["nameHint"],
            ),
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
          Obx(
            () => BsOpOfferingPricesList(
              availbleUnits: viewController.avalbleUnits,
              onAddPrice: (TimeUnit unit) {
                viewController.detailsController
                    .addPriceTimeUnit(timeUnit: unit);
              },
              onRemovePrice: (TimeUnit unit) {
                viewController.detailsController.removeTimeUnit(unit);
              },
              seletedPrices: viewController.detailsController.priceTimeUnitMap,
            ),
          ),
          bigSeperator,
          Text(
            _i18n()["homeRental"]["rentalDetails"],
            style: context.textTheme.bodyLarge,
          ),
          meduimSeperator,
          Text(
            "Home type",
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          Obx(
            () => MezStringDropDown(
              validator: (value) {
                if (viewController.homeType.value == null) {
                  return _i18n()["homeRental"]["homeTypeError"];
                }
                return null;
              },
              langPath: _i18n()["homeRental"],
              items: HomeType.values
                  .map((HomeType e) => e.toFirebaseFormatString())
                  .toList(),
              value: viewController.homeType.value?.toFirebaseFormatString(),
              onChanged: (String? newHomeType) {
                if (newHomeType != null) {
                  viewController.homeType.value = newHomeType.toHomeType();
                }
              },
              labelText: _i18n()["homeRental"]["homeType"],
            ),
          ),
          bigSeperator,
          Obx(
            () => BsOpOfferingLocationCard(
              location: viewController.homeLocation.value,
              label: _i18n()["homeRental"]["homeLocation"],
              onLocationSelected: (Location loc) {
                viewController.homeLocation.value = loc;
              },
              validator: (Location? loc) {
                if (loc == null) {
                  return _i18n()["homeRental"]["homeLocationError"];
                }
                return null;
              },
            ),
          ),
          bigSeperator,
          Text(
            _i18n()["homeRental"]["bedrooms"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.bedroomsController,
            decoration: InputDecoration(
              hintText: _i18n()["homeRental"]["bedroomsHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["homeRental"]["bedroomsError"];
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            _i18n()["homeRental"]["bathrooms"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.bathroomsController,
            decoration: InputDecoration(
              hintText: _i18n()["homeRental"]["bathroomsHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["homeRental"]["bathroomsError"];
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
