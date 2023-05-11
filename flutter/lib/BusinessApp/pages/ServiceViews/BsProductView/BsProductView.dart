import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsProductView/controllers/BsProductViewController.dart';
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

class BsOpProductView extends StatefulWidget {
  const BsOpProductView({Key? key}) : super(key: key);
  static Future<bool?> navigate({required int? id}) async {
    String route = BusinessOpRoutes.kBsOpProduct;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(route);
    return MezRouter.backResult;
  }

  @override
  _BsOpProductViewState createState() => _BsOpProductViewState();
}

class _BsOpProductViewState extends State<BsOpProductView>
    with TickerProviderStateMixin {
  BsProductViewController viewController = BsProductViewController();
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
        titleWidget: Obx(() => Text(viewController.product != null
            ? "${viewController.product!.details.name.getTranslation(userLanguage)}"
            : "Product")));
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
              hintText: "Add item name",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter item name";
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
              hintText: "Enter a description for your product",
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
              hintText: "Add item name",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter item name";
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
              hintText: "Enter a description for your product",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter description";
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            "Category",
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          Obx(() {
            print(
                "productCategory ${viewController.productCategory.value?.toFirebaseFormatString()}");
            return MezStringDropDown(
              validator: (p0) {
                if (viewController.productCategory.value == null) {
                  return "Select category";
                }
                return null;
              },
              labelText: "Select category",
              langPath: _i18n()["artisanalProduct"],
              items: ProductCategory1.values
                  .map((ProductCategory1 e) => e.toFirebaseFormatString())
                  .toList(),
              value: viewController.productCategory.value
                  ?.toFirebaseFormatString(),
              onChanged: (category) {
                viewController.productCategory.value =
                    category.toString().toProductCategory1();
              },
            );
          }),
          smallSepartor,
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
        ],
      ),
    );
  }
}
