import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/CustEventsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/DeliveryServiceView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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

  void navigateToServices(AllServiceViewEnum value) {
    cServiceController.setCurrentSelectedService(value);
    switch (value) {
      case AllServiceViewEnum.Delivery:
        DeliveryServiceView.navigate();
        return;
      case AllServiceViewEnum.Rental:
        // CustRentalsListView.navigate(category: RentalCategory1.Vehicle);
        CustRentalWrapper.navigate();
        //  RentalView.navigate();
        return;
      case AllServiceViewEnum.Class:
        CustClassesListView.navigate();
        return;
      case AllServiceViewEnum.Therapy:
        CustTherapyListView.navigate();
        return;
      case AllServiceViewEnum.Event:
        CustEventsListView.navigate();
        return;
      case AllServiceViewEnum.Volunteer:
        CustVolunteerListView.navigate();
        return;
      case AllServiceViewEnum.Adventure:
        CustAdventureListView.navigate();
        return;
      case AllServiceViewEnum.Service:
        CustServicesWrapper.navigate();
        return;
      case AllServiceViewEnum.LocallyMade:
        CustLocallyMadeWrapper.navigate();
        return;
      case AllServiceViewEnum.Food:
        CustFoodWrapper.navigate();
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final RxList<Map<String, String>> serviceListData =
        cServiceController.deliveryServiceListData;
    final TextTheme txt = Theme.of(context).textTheme;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 14.0, crossAxisSpacing: 14.0),
          itemCount: serviceListData.length,
          itemBuilder: (BuildContext context, int index) {
            return MezCard(
              radius: 10,
              borderRadius: 15,
              contentPadding: EdgeInsets.zero,
              onClick: () {
                navigateToServices(AllServiceViewEnum.values[index]);
              },
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    serviceListData[index]["icon"].toString(),
                    height: 85.mezSp,
                    width: 85.mezSp,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Obx(
                      () => FittedBox(
                        child: Text(
                          _i18n()[serviceListData[index]["title"]].toString(),
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
  }
}
