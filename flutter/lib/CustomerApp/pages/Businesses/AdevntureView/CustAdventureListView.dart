import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/AdevntureView/controllers/CustAdventureListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView.dart';

// todo @ChiragKr04 fix the cards and ui  of this page
class CustAdventureListView extends StatefulWidget {
  const CustAdventureListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custAdventureListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustAdventureListView> createState() => _CustAdventureListViewState();
}

class _CustAdventureListViewState extends State<CustAdventureListView> {
  CustAdventureListViewController viewController =
      CustAdventureListViewController();

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
        title: "Adventure",
      ),
      body: Obx(() {
        if (viewController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomScrollView(
            controller: viewController.scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _viewBusinessesSwitcher(),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildAdventure(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
            label: "Adventure",
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: Icons.hiking,
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
            label: "Organizer",
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

  Widget _buildAdventure() {
    if (viewController.adventure.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.adventure.length,
        (int index) => MezCard(
            onClick: () {
              CustEventView.navigate(
                eventId: viewController.adventure[index].details.id.toInt(),
              );
            },
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.adventure[index].details.image?.first ?? ""),
            content: Text(
                viewController.adventure[index].details.name[userLanguage] ??
                    "")),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text("No Adventures found"));
  }
}
