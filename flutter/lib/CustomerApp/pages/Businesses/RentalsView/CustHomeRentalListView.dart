import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/controllers/CustHomeRentalsListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

// todo @ChiragKr04 fix the cards ui and translations of this page
class CustHomeRentalListView extends StatefulWidget {
  const CustHomeRentalListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custHomeRentalsListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustHomeRentalListView> createState() => _CustHomeRentalListViewState();
}

class _CustHomeRentalListViewState extends State<CustHomeRentalListView> {
  CustHomeRentalsListViewController viewController =
      CustHomeRentalsListViewController();

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
        title: "Homes",
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

                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildHomeRentals(),
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
            label: "Home",
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: Icons.celebration,
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
            label: "Agency",
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

  Widget _buildHomeRentals() {
    if (viewController.rentals.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.rentals.length,
        (int index) => MezCard(
            firstAvatarBgImage:
                (viewController.rentals[index].details.firstImage != null)
                    ? CachedNetworkImageProvider(
                        viewController.rentals[index].details.firstImage!)
                    : null,
            content: Text(
                viewController.rentals[index].details.name[userLanguage] ??
                    "")),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text("No rentals found"));
  }
}
