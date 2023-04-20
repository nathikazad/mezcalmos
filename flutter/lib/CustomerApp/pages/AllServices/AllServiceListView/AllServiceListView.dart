import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalServicesView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalViews/HomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalViews/OtherRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/CustEventsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/DeliveryServiceView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

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
    Get.put(AssetController());
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
        RentalView.navigate();
        return;
      case AllServiceViewEnum.Class:
        OtherAssetListsView.navigate(viewEnum: RentalViewEnum.Classes);
        return;
      case AllServiceViewEnum.Wellness:
        HomeAssetListsView.navigate(viewEnum: RentalViewEnum.Wellness);
        return;
      case AllServiceViewEnum.Event:
        CustEventsListView.navigate();
        return;
      case AllServiceViewEnum.Volunteer:
        HomeAssetListsView.navigate(viewEnum: RentalViewEnum.Volunteer);
        return;
      case AllServiceViewEnum.Adventure:
        RentalView.navigate();
        return;
    }
  }

  bool noTabsONNextScreen(int index) {
    if (AllServiceViewEnum.values[index] == AllServiceViewEnum.Wellness ||
        AllServiceViewEnum.values[index] == AllServiceViewEnum.Volunteer) {
      return true;
    }
    return false;
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
                  Obx(
                    () => Text(
                      noTabsONNextScreen(index)
                          ? _i18n()[AllServiceViewEnum.values[index].name
                                  .toLowerCase()]["title"]
                              .toString()
                          : _i18n()[serviceListData[index]["title"]].toString(),
                      style: txt.headlineSmall,
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
