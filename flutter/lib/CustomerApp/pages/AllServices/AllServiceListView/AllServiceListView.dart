import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/AdevntureView/CustAdventureListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ClassView/CustClassesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/CustEventsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/FoodView/CustFoodWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/LocallyMadeView/CustLocallyMadeWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RealEstateView/CustRealEstateListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/CustServicesWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/TherapyView/CustTherapyListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/VolunteerView/CustVolunteerListView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustRequestCourrierView/CustRequestCourierView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/DeliveryServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiRequestOrderView/TaxiRequestOrderView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['AllServices']['AllServiceListView']['AllServiceListView'];

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

  Future<void> navigateToServices(
    MezService value,
    List<ServiceTree> childServiceTree,
  ) async {
    cServiceController.setCurrentSelectedService(value);
    switch (value) {
      case MezService.Deliveries:
        // ignore: unawaited_futures
        DeliveryServiceView.navigate(
          serviceTree: childServiceTree,
        );
        return;
      case MezService.Courier:
        await CustRequestCourierView.navigate();

        return;
      case MezService.Taxi:
        await TaxiRequestOrderView.navigate();

        return;
      case MezService.Rentals:
        // ignore: unawaited_futures
        CustRentalWrapper.navigate(
          serviceTree: childServiceTree,
        );
        return;
      case MezService.Classes:
        // ignore: unawaited_futures
        CustClassesListView.navigate();
        return;
      case MezService.Therapy:
        // ignore: unawaited_futures
        CustTherapyListView.navigate();
        return;
      case MezService.Events:
        // ignore: unawaited_futures
        CustEventsListView.navigate();
        return;
      case MezService.Volunteer:
        // ignore: unawaited_futures
        CustVolunteerListView.navigate();
        return;
      case MezService.Adventure:
        // ignore: unawaited_futures
        CustAdventureListView.navigate();
        return;
      case MezService.Services:
        // ignore: unawaited_futures
        CustServicesWrapper.navigate(
          serviceTree: childServiceTree,
        );
        return;
      case MezService.LocallyMade:
        // ignore: unawaited_futures
        CustLocallyMadeWrapper.navigate(
          serviceTree: childServiceTree,
        );
        return;
      case MezService.Food:
        // ignore: unawaited_futures
        CustFoodWrapper.navigate(
          serviceTree: childServiceTree,
        );
        return;
      case MezService.RealEstate:
        // ignore: unawaited_futures
        CustRealEstateListView.navigate();
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final RxMap<MezService, Map<String, String>> serviceListData =
        cServiceController.deliveryServiceListData;
    final TextTheme txt = Theme.of(context).textTheme;

    return Obx(() {
      if (cServiceController.serviceTreeData.value == null) {
        return Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Expanded(
          child: RefreshIndicator(
              onRefresh: () async {
                await cServiceController.fetchServiceTree();
              },
              child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14.0,
                          crossAxisSpacing: 14.0),
                      itemCount: cServiceController
                          .serviceTreeData.value!.children.length,
                      itemBuilder: (BuildContext context, int index) {
                        final MezService currentMezService = cServiceController
                            .serviceTreeData.value!.children[index].name;

                        return Material(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          shadowColor: Colors.grey.shade500,
                          elevation: .5,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () => navigateToServices(
                              currentMezService,
                              cServiceController.serviceTreeData.value!
                                  .children[index].children,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10.mezW),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(cServiceController
                                                .deliveryServiceListData[
                                                    currentMezService]!["icon"]
                                                .toString()))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Obx(
                                    () => FittedBox(
                                      child: Text(
                                        '${_i18n()[cServiceController.deliveryServiceListData[currentMezService]!['title']]}',
                                        style: context.textTheme.headlineSmall,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))));
    });
  }
}
