import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustShowOnlyOpenService.dart';
import 'package:mezcalmos/CustomerApp/components/NoOpenServiceComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/components/CustomerLaundrySelectCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/controllers/CustLaundriesListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["LaundriesListView"];

class CustLaundriesListView extends StatefulWidget {
  const CustLaundriesListView({Key? key}) : super(key: key);

  static Future<void> navigate() {
    return MezRouter.toNamed(LaundryRoutes.laundriesListRoute);
  }

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
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: '${_i18n()["laundries"]}',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (viewController.isLoading.value == false) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchCoomponent(context),
        _sortingSwitcher(),
        (viewController.filteredServices.value.isNotEmpty)
            ? Column(
                children: List.generate(
                  viewController.filteredServices.value.length,
                  (int index) => CustomerLaundrySelectCard(
                    laundry: viewController.filteredServices[index],
                    customerLocation: viewController.customerLocation,
                  ),
                ),
              )
            : NoOpenServiceComponent(
                showOnlyOpen: viewController.showOnlyOpen.value,
                onClick: () {
                  viewController.changeAlwaysOpenSwitch(false);
                  viewController.filter();
                },
              ),
      ],
    );
  }

  Widget _sortingSwitcher() {
    return Obx(() => CustSwitchOpenService(
          showOnlyOpen: viewController.showOnlyOpen.value,
          onChange: (bool value) {
            viewController.changeAlwaysOpenSwitch(value);
            viewController.filter();
          },
        ));
  }

  Widget _searchCoomponent(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Material(
            elevation: 0.5,
            borderRadius: BorderRadius.circular(5),
            child: TextFormField(
              style: context.textTheme.bodyLarge,
              onChanged: (String value) {
                viewController.searchQuery.value = value;
                viewController.filter();
                // mezDbgPrint(_controller.searchQuery);
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Search...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: primaryBlueColor,
                  )),
            ),
          ),
        ),
        // SizedBox(
        //   width: 5,
        // ),
        // MezIconButton(
        //   icon: Icons.place,
        //   padding: const EdgeInsets.all(12),
        //   backgroundColor: Colors.white,
        //   shape: BoxShape.rectangle,
        //   borderRadius: BorderRadius.circular(5),
        //   onTap: () {},
        // )
      ],
    );
  }
}
