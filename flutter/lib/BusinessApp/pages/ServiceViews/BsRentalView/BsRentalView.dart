import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/controllers/BsRentalViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServiceImagesGrid.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';

class BsOpRentalView extends StatefulWidget {
  const BsOpRentalView({Key? key}) : super(key: key);
  static Future<bool?> navigate({required int? id}) async {
    String route = BusinessOpRoutes.kBsOpRental;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(route);
    return MezRouter.backResult;
  }

  @override
  _BsOpRentalViewState createState() => _BsOpRentalViewState();
}

class _BsOpRentalViewState extends State<BsOpRentalView>
    with TickerProviderStateMixin {
  BsRentalViewController viewController = BsRentalViewController();
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
        onClick: () async {},
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
                viewController.detailsController.scDescriptionController,
            decoration: InputDecoration(
              hintText: "Enter a description for your rental",
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
                hintText: "Add rental name",
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
                hintText: "Enter a description for your rental",
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
              ],
            ),
            smallSepartor,
          ],
        ),
      ),
    );
  }
}
