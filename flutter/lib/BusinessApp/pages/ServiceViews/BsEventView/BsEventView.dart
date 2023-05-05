import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpScheduleTypeSelector.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/controllers/BsEventViewController.dart';
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

class BsOpEventView extends StatefulWidget {
  const BsOpEventView({Key? key}) : super(key: key);
  static Future<bool?> navigate(
      {required int? id, required bool isClass}) async {
    String route = BusinessOpRoutes.kBsOpEvent;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(
      route,
      arguments: {"class": isClass},
    );
    return MezRouter.backResult;
  }

  @override
  _BsOpEventViewState createState() => _BsOpEventViewState();
}

class _BsOpEventViewState extends State<BsOpEventView>
    with TickerProviderStateMixin {
  BsEventViewController viewController = BsEventViewController();
  @override
  void initState() {
    viewController.init(
        thickerProvider: this,
        isClass: MezRouter.bodyArguments?["class"] ?? false);
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
        titleWidget: Obx(() => Text(getAppbartitle())));
  }

  String getAppbartitle() {
    return viewController.event != null
        ? "${viewController.event!.details.name.getTranslation(userLanguage)}"
        : (viewController.isClass == false)
            ? "Event"
            : "Class";
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
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter a name";
              }
              return null;
            },
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
              hintText: "Enter a description for your event",
            ),
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
          Obx(
            () => BsOpScheduleTypeSelector(
              items: viewController.getScheduleType(),
              label: "Select event type",
              value: viewController.getScheduleType().firstWhereOrNull(
                  (ScheduleTypeInput element) =>
                      element.type == viewController.scheduleType.value),
              validator: (ScheduleTypeInput? v) {
                if (v == null) {
                  return "Please select a schedule type";
                }
                return null;
              },
              onChanged: (ScheduleTypeInput? v) {
                if (v != null) {
                  viewController.switchScheduleType(v.type);
                }
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
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter a name";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Add event name",
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
              hintText: "Enter a description for your event",
            ),
          ),
          bigSeperator,
          BsOpOfferingPricesList(
            availbleUnits: [],
            onAddPrice: (TimeUnit unit) {
              viewController.detailsController.addPriceTimeUnit(timeUnit: unit);
            },
            onRemovePrice: (TimeUnit unit) {
              viewController.detailsController.removeTimeUnit(unit);
            },
            seletedPrices: viewController.detailsController.priceTimeUnitMap,
          ),
          bigSeperator,
          Obx(
            () => BsOpOfferingLocationCard(
              onLocationSelected: (Location v) {
                viewController.setLocation(v);
              },
              location: viewController.location.value,
              validator: (Location? loc) {
                if (loc == null) {
                  return "Please select a location";
                }
                return null;
              },
            ),
          ),
          bigSeperator,
          Obx(() => viewController.getScheduleWidget()),
        ],
      ),
    );
  }
}
