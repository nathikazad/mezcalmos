import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/components/CustomerLaundrySelectCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/controllers/CustLaundriesListViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["LaundriesListView"];

class CustLaundriesListView extends StatefulWidget {
  const CustLaundriesListView({Key? key}) : super(key: key);

  @override
  State<CustLaundriesListView> createState() => _CustLaundriesListViewState();
}

class _CustLaundriesListViewState extends State<CustLaundriesListView> {
  CustLaundriesListViewController viewController =
      CustLaundriesListViewController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: '${_i18n()["laundries"]}',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 8,
            // ),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            //   child: Text(
            //     "${_i18n()["title"]}",
            //     style: Get.textTheme.displaySmall?.copyWith(
            //       fontWeight: FontWeight.w700,
            //     ),
            //     textAlign: TextAlign.start,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              if (viewController.hasData) {
                return _buildLaundries();
              } else {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(15),
                  child: CircularProgressIndicator(),
                );
              }
            })
          ],
        ),
      ),
    );
  }

  Widget _buildLaundries() {
    if (viewController.laundries.value!.isNotEmpty) {
      return Column(
        children: List.generate(
          viewController.laundries.value!.length,
          (int index) => CustomerLaundrySelectCard(
            laundry: viewController.laundries.value![index],
            customerLocation: viewController.customerCurrentLocation.value!,
          ),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(15),
        child: Text(
          "${_i18n()["noLaundaryFound"]}",
          textAlign: TextAlign.center,
          style: Get.textTheme.titleSmall,
        ),
      );
    }
  }
}
