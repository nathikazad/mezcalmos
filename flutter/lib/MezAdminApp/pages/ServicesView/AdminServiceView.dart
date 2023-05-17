import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminBsServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminDeliveryCompanyServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminLaundryServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminRestaurantServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/controllers/AdminServiceViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["MezAdmin"]["pages"]
    ["AdminServicesView"]["AdminServicesView"];

class AdminServicesView extends StatefulWidget {
  const AdminServicesView({super.key, required this.adminTabsViewController});
  final AdminTabsViewController adminTabsViewController;
  @override
  State<AdminServicesView> createState() => _AdminServicesViewState();
}

class _AdminServicesViewState extends State<AdminServicesView> {
  AdminServicesViewController viewController = AdminServicesViewController();
  @override
  void initState() {
    viewController.init(
        adminTabsViewController: widget.adminTabsViewController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: viewController.scrollController,
      child: Column(
        children: [
          Obx(() => Column(
                children: [
                  _searchInput(),
                  viewController.hasData
                      ? _buildRestaurants()
                      : Container(
                          alignment: Alignment.center,
                          child: Center(child: CircularProgressIndicator())),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildServices() {
    switch (viewController.currentService) {
      case ServiceProviderType.Restaurant:
        return _buildRestaurants();
      case ServiceProviderType.Laundry:
        return _buildLaundries();
      case ServiceProviderType.DeliveryCompany:
        return _buildCompanies();
      case ServiceProviderType.Business:
        return _buildBusiness();
      default:
        throw Exception("Service type not found");
    }
  }

  Widget _buildRestaurants() {
    // viewController.scrollController.addListener(() {
    //   if (viewController.scrollController.position.maxScrollExtent ==
    //       viewController.scrollController.position.pixels) {
    //     viewController.fetchCurrent(increaseLimit: 10);
    //   }
    // });
    return ListView.builder(
        itemCount: viewController.currentServiceLength,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
              child: _getServiceCard(index),
            ));

    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Column(
    //         children: List.generate(
    //             viewController.restaurants!.length,
    //             (int index) => AdminRestaurantServiceCard(
    //                 viewController: viewController,
    //                 restaurant: viewController.restaurants![index]))),
    //     if (viewController.restaurants!.length ==
    //         viewController.restLimit.value)
    //       MezButton(
    //         label: "View more",
    //         backgroundColor: secondaryLightBlueColor,
    //         textColor: primaryBlueColor,
    //         onClick: () async {
    //           viewController.restLimit.value += 5;
    //           await viewController.fetchRestaurants();
    //         },
    //       )
    //   ],
    // );
  }

  Widget _getServiceCard(int index) {
    switch (viewController.currentService) {
      case ServiceProviderType.Restaurant:
        return AdminRestaurantServiceCard(
            viewController: viewController,
            restaurant: viewController.restaurants![index]);

      case ServiceProviderType.Laundry:
        return AdminLaundryServiceCard(
            viewController: viewController,
            laundry: viewController.laundries![index]);

      case ServiceProviderType.DeliveryCompany:
        return AdminDeliveryCompanyServiceCard(
            viewController: viewController,
            company: viewController.companies![index]);
      case ServiceProviderType.Business:
        return AdminBsServiceCard(
            viewController: viewController,
            business: viewController.businesses![index]);

      default:
        return SizedBox();
    }
  }

  Column _buildLaundries() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
            children: List.generate(
                viewController.laundries!.length,
                (int index) => AdminLaundryServiceCard(
                    viewController: viewController,
                    laundry: viewController.laundries![index]))),
        if (viewController.restaurants!.length ==
            viewController.restLimit.value)
          MezButton(
            label: "View more",
            backgroundColor: secondaryLightBlueColor,
            textColor: primaryBlueColor,
            onClick: () async {
              viewController.laundryLimit.value += 5;
              await viewController.fetchLaundries();
            },
          )
      ],
    );
  }

  Column _buildBusiness() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Column(
        //     children: List.generate(
        //         viewController.businesses!.length,
        //         (int index) => AdminLaundryServiceCard(
        //             viewController: viewController,
        //             laundry: viewController.businesses![index]))),
        if (viewController.businesses!.length == viewController.bsLimit.value)
          MezButton(
            label: "View more",
            backgroundColor: secondaryLightBlueColor,
            textColor: primaryBlueColor,
            onClick: () async {
              viewController.bsLimit.value += 5;
              await viewController.fetchBusiness();
            },
          )
      ],
    );
  }

  Column _buildCompanies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
            children: List.generate(
                viewController.companies!.length,
                (int index) => AdminDeliveryCompanyServiceCard(
                    viewController: viewController,
                    company: viewController.companies![index]))),
        if (viewController.companies!.length == viewController.dvLimit.value)
          MezButton(
            label: "View more",
            backgroundColor: secondaryLightBlueColor,
            textColor: primaryBlueColor,
            onClick: () async {
              viewController.dvLimit.value += 5;
              await viewController.fetchCompanies();
            },
          )
      ],
    );
  }

  Widget _searchInput() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: context.txt.bodyLarge,
        onChanged: (String value) {
          // viewController.searchQuery.value = value;
          // viewController.filter();
          //    mezDbgPrint(viewController.searchQuery);
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
            ),
            hintText: "${_i18n()['search']}"),
      ),
    );
  }
}
