import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalViews/HomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalServicesView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/DeliveryServiceView.dart';

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
        RentalView.navigate();
        return;
      case AllServiceViewEnum.Class:
        HomeAssetListsView.navigate(viewEnum: RentalViewEnum.Classes);
        return;
      case AllServiceViewEnum.Wellness:
        HomeAssetListsView.navigate(viewEnum: RentalViewEnum.Wellness);
        return;
      case AllServiceViewEnum.Event:
        RentalView.navigate();
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
            crossAxisCount: 2,
            mainAxisSpacing: 14.0,
            crossAxisSpacing: 14.0,
            childAspectRatio: 1.2,
          ),
          itemCount: serviceListData.length,
          itemBuilder: (BuildContext context, int index) {
            return MezCard(
              onClick: () {
                navigateToServices(AllServiceViewEnum.values[index]);
              },
              content: Column(
                children: [
                  Image.asset(
                    serviceListData[index]["icon"].toString(),
                    height: 96,
                    width: 96,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Obx(
                      () => Text(
                        noTabsONNextScreen(index)
                            ? _i18n()[AllServiceViewEnum.values[index].name
                                    .toLowerCase()]["title"]
                                .toString()
                            : _i18n()[serviceListData[index]["title"]]
                                .toString(),
                        style: txt.headlineSmall,
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
