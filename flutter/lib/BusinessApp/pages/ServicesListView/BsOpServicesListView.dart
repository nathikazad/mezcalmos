// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/Components/BsProductCard.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsEventCard.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsHomeRentalCard.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsRentalCard.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsServiceCard.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/EventHelper.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/RentalHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/env.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpServicesListView extends StatefulWidget {
  final int? businessId;
  final int? businessDetailsId;
  final BusinessProfile? businessProfile;
  const BsOpServicesListView(
      {Key? key, this.businessId, this.businessProfile, this.businessDetailsId})
      : super(key: key);
  static Future<void> navigate(
      {required int id,
      required BusinessProfile profile,
      required int detailsId}) async {
    final String route =
        BusinessOpRoutes.kBusniessOpServiceList.replaceFirst(":id", "$id");
    return MezRouter.toPath(route,
        arguments: {"profile": profile, "detailsId": detailsId});
  }

  @override
  _BsOpServicesListViewState createState() => _BsOpServicesListViewState();
}

class _BsOpServicesListViewState extends State<BsOpServicesListView> {
  BsServicesListViewController viewController = BsServicesListViewController();
  BusinessProfile? _businessProfile;
  int? _id;
  int? _detailsId;
  @override
  void initState() {
    _detailsId = widget.businessDetailsId ??
        MezRouter.bodyArguments?["detailsId"] as int?;

    _businessProfile = widget.businessProfile ??
        MezRouter.bodyArguments?["profile"] as BusinessProfile?;
    _id =
        widget.businessId ?? int.parse(MezRouter.urlArguments["id"].toString());
    if (_businessProfile != null && _id != null && _detailsId != null) {
      viewController.init(
          profile: _businessProfile!, id: _id!, businessDetailsId: _detailsId!);
    } else {
      throw Exception("Missing arguments");
    }
    super.initState();
  }

  bool get asTab => widget.businessDetailsId != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
          asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
          onClick: asTab ? null : MezRouter.back,
          title: '${_i18n()["services"]}'),
      drawer: MezSideMenu(),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      body: RefreshIndicator(
        onRefresh: () async {
          await viewController.fetchAllServices();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _addServiceButton(context),
                bigSeperator,
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          _i18n()["services"],
                          style: context.textTheme.bodyLarge,
                        )),
                    if (MezEnv.appLaunchMode == AppLaunchMode.stage)
                      Flexible(
                        child: MezButton(
                            label: "Change Profile",
                            onClick: () async {
                              mezDbgPrint(DateTime.now().toUtc().toString());
                              viewController.changeBusiness();
                            }),
                      ),
                  ],
                ),
                Divider(
                  height: 25,
                ),
                !viewController.noData
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _homeRentals(context),
                          _rentals(context),
                          _events(context),
                          _classes(context),
                          _services(context),
                          _products(context),
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Image.asset(
                                aNoServices,
                                height: 200.mezSp,
                                width: 200.mezSp,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${_i18n()['noServicesFound']}',
                              style: context.textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${_i18n()['bodyMessage']}',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _classes(BuildContext context) {
    final RxList<EventCard> scheduledClass = viewController.events
        .where((EventCard element) =>
            element.scheduleType == ScheduleType.Scheduled && element.isClass)
        .toList()
        .obs;
    final RxList<EventCard> oneTimeClass = viewController.events
        .where((EventCard element) =>
            element.scheduleType == ScheduleType.OneTime && element.isClass)
        .toList()
        .obs;
    final RxList<EventCard> onDemandClass = viewController.events
        .where((EventCard element) =>
            element.scheduleType == ScheduleType.OnDemand && element.isClass)
        .toList()
        .obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (scheduledClass.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["weeklyClass"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      scheduledClass.length,
                      (int index) => BsEventCard(
                          viewController: viewController,
                          event: scheduledClass[index],
                          onClick: () {
                            viewController.navigateToEvent(
                                isClass: scheduledClass[index].isClass,
                                id: scheduledClass[index].id!.toInt());
                          })),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (oneTimeClass.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["oneTimeClass"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      oneTimeClass.length,
                      (int index) => BsEventCard(
                          viewController: viewController,
                          event: oneTimeClass[index],
                          onClick: () {
                            viewController.navigateToEvent(
                                isClass: oneTimeClass[index].isClass,
                                id: oneTimeClass[index].id!.toInt());
                          })),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (onDemandClass.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["onDemandClass"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      onDemandClass.length,
                      (int index) => BsEventCard(
                          viewController: viewController,
                          event: onDemandClass[index],
                          onClick: () {
                            viewController.navigateToEvent(
                                isClass: onDemandClass[index].isClass,
                                id: onDemandClass[index].id!.toInt());
                          })),
                ),
              ),
              bigSeperator,
            ],
          ),
      ],
    );
  }

  Widget _products(BuildContext context) {
    final RxList<ProductCard> artProducts = viewController.product
        .where(
            (ProductCard element) => element.category1 == ProductCategory1.Art)
        .toList()
        .obs;
    final RxList<ProductCard> consumableProducts = viewController.product
        .where((ProductCard element) =>
            element.category1 == ProductCategory1.Consumable)
        .toList()
        .obs;
    final RxList<ProductCard> careProducts = viewController.product
        .where((ProductCard element) =>
            element.category1 == ProductCategory1.PersonalCare)
        .toList()
        .obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (artProducts.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["artProduct"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      artProducts.length,
                      (int index) => BsProductCard(
                            product: artProducts[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToProduct(
                                id: artProducts[index].id!.toInt(),
                              );
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (consumableProducts.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["consumableProduct"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      consumableProducts.length,
                      (int index) => BsProductCard(
                            product: consumableProducts[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToProduct(
                                id: consumableProducts[index].id!.toInt(),
                              );
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (careProducts.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["careProduct"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      careProducts.length,
                      (int index) => BsProductCard(
                            product: careProducts[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToProduct(
                                id: careProducts[index].id!.toInt(),
                              );
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
      ],
    );
  }

  Widget _services(BuildContext context) {
    final RxList<ServiceCard> cleaningService = viewController.services
        .where((ServiceCard element) =>
            element.category1 == ServiceCategory1.Cleaning)
        .toList()
        .obs;
    final RxList<ServiceCard> petSittingService = viewController.services
        .where((ServiceCard element) =>
            element.category1 == ServiceCategory1.PetSitting)
        .toList()
        .obs;
    final RxList<ServiceCard> mealPlanningService = viewController.services
        .where((ServiceCard element) =>
            element.category1 == ServiceCategory1.MealPlanning)
        .toList()
        .obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (cleaningService.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["cleaning"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      cleaningService.length,
                      (int index) => BsServiceCard(
                            service: cleaningService[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToService(
                                  serviceCategory: ServiceCategory1.Cleaning,
                                  id: cleaningService[index].id!.toInt());
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (petSittingService.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["petSittingService"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      petSittingService.length,
                      (int index) => BsServiceCard(
                            service: petSittingService[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToService(
                                  serviceCategory: ServiceCategory1.PetSitting,
                                  id: petSittingService[index].id!.toInt());
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (mealPlanningService.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["meal"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      mealPlanningService.length,
                      (int index) => BsServiceCard(
                            service: mealPlanningService[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToService(
                                  serviceCategory:
                                      ServiceCategory1.MealPlanning,
                                  id: mealPlanningService[index].id!.toInt());
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
      ],
    );
  }

  Column _events(BuildContext context) {
    final RxList<EventCard> scheduledEvents = viewController.events
        .where((EventCard element) =>
            element.scheduleType == ScheduleType.Scheduled && !element.isClass)
        .toList()
        .obs;
    final RxList<EventCard> oneTimeEvents = viewController.events
        .where((EventCard element) =>
            element.scheduleType == ScheduleType.OneTime && !element.isClass)
        .toList()
        .obs;
    final RxList<EventCard> onDemandEvents = viewController.events
        .where((EventCard element) =>
            element.scheduleType == ScheduleType.OnDemand &&
            !element.isClass &&
            !element.isAdventure &&
            !element.isTherapy)
        .toList()
        .obs;
    final RxList<EventCard> tourEvents = viewController.events
        .where((EventCard element) =>
            element.scheduleType == ScheduleType.OnDemand &&
            !element.isClass &&
            element.isAdventure &&
            !element.isTherapy)
        .toList()
        .obs;
    final RxList<EventCard> therapyEvents = viewController.events
        .where((EventCard element) =>
            element.scheduleType == ScheduleType.OnDemand && element.isTherapy)
        .toList()
        .obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (scheduledEvents.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["weeklyEvent"]}",
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      scheduledEvents.length,
                      (int index) => BsEventCard(
                            event: scheduledEvents[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToEvent(
                                  isClass: scheduledEvents[index].isClass,
                                  id: scheduledEvents[index].id!.toInt());
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (oneTimeEvents.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["oneTimeEvent"]}",
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      oneTimeEvents.length,
                      (int index) => BsEventCard(
                            event: oneTimeEvents[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToEvent(
                                  isClass: oneTimeEvents[index].isClass,
                                  id: oneTimeEvents[index].id!.toInt());
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (onDemandEvents.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["onDemandEvent"]}",
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      onDemandEvents.length,
                      (int index) => BsEventCard(
                            event: onDemandEvents[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToEvent(
                                  isClass: onDemandEvents[index].isClass,
                                  id: onDemandEvents[index].id!.toInt());
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (tourEvents.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["experiences"]}",
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      tourEvents.length,
                      (int index) => BsEventCard(
                            event: tourEvents[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToEvent(
                                  isClass: tourEvents[index].isClass,
                                  id: tourEvents[index].id!.toInt());
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (therapyEvents.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["therapyEvent"]}",
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      therapyEvents.length,
                      (int index) => BsEventCard(
                            event: therapyEvents[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToEvent(
                                  isClass: therapyEvents[index].isClass,
                                  id: therapyEvents[index].id!.toInt());
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          ),
      ],
    );
  }

  Column _rentals(BuildContext context) {
    final RxList<RentalCard> surfRentals = viewController.rentals
        .where((RentalCard element) => element.isSurf)
        .toList()
        .obs;
    final RxList<RentalCard> vehicleRentals = viewController.rentals
        .where((RentalCard element) => element.isVehicle)
        .toList()
        .obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (surfRentals.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["surfRentals"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      surfRentals.length,
                      (int index) => BsRentalCard(
                          viewController: viewController,
                          rental: surfRentals[index],
                          onClick: () {
                            viewController.navigateToRental(
                              id: surfRentals[index].id!.toInt(),
                              rentalCategory: surfRentals[index].category1,
                            );
                          })),
                ),
              ),
              bigSeperator,
            ],
          ),
        if (vehicleRentals.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["vehicleRentals"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      vehicleRentals.length,
                      (int index) => BsRentalCard(
                          viewController: viewController,
                          rental: vehicleRentals[index],
                          onClick: () {
                            viewController.navigateToRental(
                                id: vehicleRentals[index].id!.toInt(),
                                rentalCategory:
                                    vehicleRentals[index].category1);
                          })),
                ),
              ),
              bigSeperator,
            ],
          ),
      ],
    );
  }

  Widget _homeRentals(BuildContext context) {
    return viewController.homeRentals.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _i18n()["homeRental"]["rentalTitle"],
                style: context.textTheme.bodyLarge,
              ),
              // smallSepartor,
              Obx(
                () => Column(
                  children: List.generate(
                      viewController.homeRentals.length,
                      (int index) => BsHomeRentalCard(
                            rental: viewController.homeRentals[index],
                            viewController: viewController,
                            onClick: () {
                              viewController.navigateToHomeRental(
                                  id: viewController.homeRentals[index].id!
                                      .toInt());
                            },
                          )),
                ),
              ),
              bigSeperator,
            ],
          )
        : SizedBox.shrink();
  }

  MezButton _addServiceButton(BuildContext context) {
    return MezButton(
      label: _i18n()["addService"],
      onClick: () async {
        // ignore: inference_failure_on_function_invocation
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              BusinessProfileItem currentSelectedService =
                  viewController.currentBottomSheetData.first;

              void navigateToOfferingView() {
                currentSelectedService.route();
              }

              return StatefulBuilder(builder: (BuildContext context, setState) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${_i18n()['serviceType']}',
                            style: context.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ...viewController.currentBottomSheetData.map(
                          (BusinessProfileItem item) => Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${_i18n()[viewController.businessProfileFirebaseString][item.title]}",
                                        style: context.textTheme.bodyLarge,
                                      ),
                                      Text(
                                        "${_i18n()[viewController.businessProfileFirebaseString][item.subtitle]}",
                                      )
                                    ],
                                  ),
                                ),
                                radioCircleButton(
                                  onTap: (bool v) {
                                    setState(() {
                                      currentSelectedService = item;
                                    });
                                  },
                                  value: item == currentSelectedService,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                                child: MezButton(
                              label: '${_i18n()["cancel"]}',
                              backgroundColor: offRedColor,
                              textColor: redAccentColor,
                              onClick: () async {
                                Navigator.pop(context);
                              },
                            )),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                                child: MezButton(
                              label: '${_i18n()["add"]}',
                              onClick: () async {
                                mezDbgPrint(
                                    "added service: $currentSelectedService");
                                Navigator.pop(context);
                                navigateToOfferingView();
                                // bool? hasChanged =
                                //     await BsOpHomeRentalView.navigate(id: null);
                                // if (hasChanged == true) {
                                //   viewController.init();
                                // }
                              },
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
            });
      },
    );
  }
}
