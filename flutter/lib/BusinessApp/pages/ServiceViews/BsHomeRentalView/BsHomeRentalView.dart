import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/controllers/BsHomeRentalViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServiceImagesGrid.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServicePriceCard.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpTimeUnitSelectorSheet.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';

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
    int? id = MezRouter.urlArguments["id"]?.asInt;
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
        children: [_primaryTab(context), _secondaryTab(context)],
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
            ? "${viewController.rental!.details.name[userLanguage] ?? ""}"
            : "Home rental")));
  }

  Widget _secondaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
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
              hintText: "Enter a description for your item",
            ),
          ),
        ],
      ),
    );
  }

  Widget _primaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: viewController.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => MezItemAvSwitcher(
                value: viewController.isAvailable.value,
                onAvalableTap: () {
                  viewController.isAvailable.value = true;
                },
                onUnavalableTap: () {
                  viewController.isAvailable.value = false;
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
                  viewController.detailsController.descriptionController,
              decoration: InputDecoration(
                hintText: "Enter a description for your item",
              ),
            ),
            bigSeperator,
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    "Prices",
                    style: context.textTheme.bodyLarge,
                  ),
                ),
                InkWell(
                    onTap: () async {
                      if (viewController.units.length > 1) {
                        TimeUnit? newUnit = await bsOpTimeUnitSelectorSheet(
                            context: context, units: viewController.units);
                        if (newUnit != null) {
                          viewController.detailsController
                              .addPriceTimeUnit(newUnit);
                        }
                      } else if (viewController.units.length == 1) {
                        viewController.detailsController
                            .addPriceTimeUnit(viewController.units.first);
                      }
                    },
                    child: Ink(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            size: 20,
                            color: primaryBlueColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Add price",
                            style: context.textTheme.bodyLarge
                                ?.copyWith(color: primaryBlueColor),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            smallSepartor,
            Obx(
              () => Column(
                  children: List.generate(
                      viewController.priceTimeUnitMap.length, (int index) {
                final TimeUnit timeUnit = viewController
                    .priceTimeUnitMap.entries
                    .toList()[index]
                    .value;
                final TextEditingController textEditingController =
                    viewController.priceTimeUnitMap.entries.toList()[index].key;
                return BsOpServicePriceCard(
                  textEditingController: textEditingController,
                  timeUnit: timeUnit,
                  onRemoveTimeUnit: () {
                    viewController.detailsController.removeTimeUnit(timeUnit);
                  },
                );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
