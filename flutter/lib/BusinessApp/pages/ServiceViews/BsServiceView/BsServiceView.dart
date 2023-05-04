import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/BsOpSchedulePickerView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsServiceView/controllers/BsServiceViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServiceImagesGrid.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpScheduleSelector.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingPricesList.dart';

class BsOpServiceView extends StatefulWidget {
  const BsOpServiceView({Key? key}) : super(key: key);
  static Future<bool?> navigate({required int? id}) async {
    String route = BusinessOpRoutes.kBsOpService;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(route);
    return MezRouter.backResult;
  }

  @override
  _BsOpServiceViewState createState() => _BsOpServiceViewState();
}

class _BsOpServiceViewState extends State<BsOpServiceView>
    with TickerProviderStateMixin {
  BsServiceViewController viewController = BsServiceViewController();
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
        titleWidget: Obx(() => Text(viewController.service != null
            ? "${viewController.service!.details.name[userLanguage] ?? ""}"
            : "Service")));
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
              hintText: "Enter a description for your service",
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
                hintText: "Add service name",
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
                hintText: "Enter a description for your service",
              ),
            ),
            bigSeperator,
            BsOpOfferingPricesList(
              availbleUnits: viewController.avalbleUnits,
              onAddPrice: (TimeUnit unit) {
                viewController.detailsController.addPriceTimeUnit(unit);
              },
              onRemovePrice: (TimeUnit unit) {
                viewController.detailsController.removeTimeUnit(unit);
              },
              seletedPrices: viewController.detailsController.priceTimeUnitMap,
            ),
            smallSepartor,
            Obx(
              () => BsOpScheduleSelector(
                onScheduleSelected: (schedule) {
                  viewController.changeSchedule(schedule);
                },
                schedule: viewController.serviceSchedule.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
