import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/CustEventsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/DeliveryServiceView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ClassView/CustClassesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/TherapyView/CustTherapyListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/VolunteerView/CustVolunteerListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/AdevntureView/CustAdventureListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/CustServicesWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/LocallyMadeView/CustLocallyMadeWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/FoodView/CustFoodWrapper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class AllServiceListView extends StatefulWidget {
  const AllServiceListView({super.key});

  @override
  State<AllServiceListView> createState() => _AllServiceListViewState();
}

class _AllServiceListViewState extends State<AllServiceListView> {
  late AllServiceListViewController cServiceController;

  @override
  void initState() {
    super.initState();
    Get.put(AllServiceListViewController());
    cServiceController = Get.find<AllServiceListViewController>();
    cServiceController.init();
  }

  @override
  void dispose() {
    super.dispose();
    cServiceController.dispose();
  }

  void navigateToServices(MezService value) {
    cServiceController.setCurrentSelectedService(value);
    switch (value) {
      case MezService.Deliveries:
        DeliveryServiceView.navigate();
        return;
      case MezService.Rentals:
        // CustRentalsListView.navigate(category: RentalCategory1.Vehicle);
        CustRentalWrapper.navigate();
        //  RentalView.navigate();
        return;
      case MezService.Classes:
        CustClassesListView.navigate();
        return;
      case MezService.Therapy:
        CustTherapyListView.navigate();
        return;
      case MezService.Events:
        CustEventsListView.navigate();
        return;
      case MezService.Volunteer:
        CustVolunteerListView.navigate();
        return;
      case MezService.Adventure:
        CustAdventureListView.navigate();
        return;
      case MezService.Services:
        CustServicesWrapper.navigate();
        return;
      case MezService.LocallyMade:
        CustLocallyMadeWrapper.navigate();
        return;
      case MezService.Food:
        CustFoodWrapper.navigate();
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final RxMap<MezService, Map<String, String>> serviceListData =
        cServiceController.deliveryServiceListData;
    final TextTheme txt = Theme.of(context).textTheme;

    return Obx(
      () {
        if (cServiceController.serviceTreeData.value == null) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14.0,
                  crossAxisSpacing: 14.0),
              itemCount:
                  cServiceController.serviceTreeData.value!.children.length,
              itemBuilder: (BuildContext context, int index) {
                var currentMezService = cServiceController
                    .serviceTreeData.value!.children[index].name;
                return MezCard(
                  radius: 10,
                  borderRadius: 15,
                  contentPadding: EdgeInsets.zero,
                  onClick: () {
                    navigateToServices(currentMezService);
                  },
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        cServiceController
                            .deliveryServiceListData[currentMezService]!["icon"]
                            .toString(),
                        height: 85.mezSp,
                        width: 85.mezSp,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Obx(
                          () => FittedBox(
                            child: Text(
                              _i18n()[cServiceController
                                      .deliveryServiceListData[
                                          currentMezService]!["title"]
                                      .toString()]
                                  .toString(),
                              style: txt.headlineSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
