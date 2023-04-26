import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/controllers/CustRentalsListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/LocallyMadeView/controllers/CustLocallyMadeListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/MezSearch.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustProductView.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

class CustLocallyMadeListView extends StatefulWidget {
  const CustLocallyMadeListView({super.key});
  static Future<void> navigate({required ProductCategory1 productCategory}) {
    final String route = CustBusinessRoutes.custLocallyMadeRoute;
    return MezRouter.toPath(route, arguments: {
      "productCategory": productCategory,
    });
  }

  @override
  State<CustLocallyMadeListView> createState() =>
      _CustLocallyMadeListViewState();
}

class _CustLocallyMadeListViewState extends State<CustLocallyMadeListView> {
  CustLocallyMadeListViewController viewController =
      CustLocallyMadeListViewController();

  @override
  void initState() {
    ProductCategory1? serviceCategory =
        MezRouter.bodyArguments?["productCategory"] as ProductCategory1?;
    if (serviceCategory != null) {
      viewController.init(serviceCategory: serviceCategory);
    } else {
      showErrorSnackBar(
          errorText: "Product Category not found : $serviceCategory");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        titleWidget: Text(viewController.productsCategory.first.name),
      ),
      body: Obx(() {
        if (viewController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(
            margin: const EdgeInsets.all(16),
            child: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              controller: viewController.scrollController,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // search bar

                      _viewBusinessesSwitcher(),

                      // filter bar
                      // if (viewController.showFilter) _filterButton(context),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildProducts(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _viewBusinessesSwitcher() {
    return Row(
      children: [
        Flexible(
          child: MezButton(
            label: viewController.productsCategory.first.name,
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: Icons.local_offer,
            borderRadius: 35,
            backgroundColor: viewController.showBusiness.isTrue
                ? Colors.grey.shade300
                : null,
            textColor: viewController.showBusiness.isTrue
                ? Colors.grey.shade800
                : null,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: MezButton(
            label: "Store",
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = true;
            },
            icon: Icons.local_activity,
            borderRadius: 35,
            backgroundColor: viewController.showBusiness.isFalse
                ? Colors.grey.shade300
                : null,
            textColor: viewController.showBusiness.isFalse
                ? Colors.grey.shade800
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildBusinesses() {
    if (viewController.businesses.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.businesses.length,
        (int index) => MezCard(
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.businesses[index].image),
            content: Text(viewController.businesses[index].name)),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text("No businesses found"));
  }

  Widget _buildProducts() {
    if (viewController.products.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.products.length,
        (int index) => MezCard(
            onClick: () {
              CustProductView.navigate(
                productId: viewController.products[index].details.id.toInt(),
              );
            },
            firstAvatarBgImage:
                (viewController.products[index].details.firstImage != null)
                    ? CachedNetworkImageProvider(
                        viewController.products[index].details.firstImage!)
                    : CachedNetworkImageProvider(customImageUrl),
            content: Text(
                viewController.products[index].details.name[userLanguage] ??
                    viewController
                        .products[index].details.name.entries.first.value)),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text("No services found"));
  }
}
