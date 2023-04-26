import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/controllers/CustEventsListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustEventsListView extends StatefulWidget {
  const CustEventsListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custEventsListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustEventsListView> createState() => _CustEventsListViewState();
}

class _CustEventsListViewState extends State<CustEventsListView> {
  CustEventsListViewController viewController = CustEventsListViewController();

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
        title: "Events",
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
                      if (viewController.showBusiness.isFalse)
                        _filterButton(context),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildEvents(),
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
            label: "Events",
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
            label: "Organizers",
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

  Widget _filterButton(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 15),
      color: Colors.grey.shade300,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          // _showFilterSheet(context);
          FilterInput? data = await cusShowBusinessFilerSheet(
              context: context,
              filterInput: viewController.filterInput,
              defaultFilterInput: viewController.defaultFilters());
          if (data != null) {
            viewController.filter(data);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.filter_alt,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Filter:",
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                child: Text(
                  (viewController.selectedCategories.length == 1)
                      ? "${viewController.selectedCategories.first.name}"
                      : "${viewController.selectedCategories.length}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusinesses() {
    if (viewController.businesses.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.businesses.length,
        (int index) => MezCard(
            onClick: () {
              CustBusinessView.navigate(
                businessId: viewController.businesses[index].id,
              );
            },
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

  Widget _buildEvents() {
    if (viewController.events.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.events.length,
        (int index) => MezCard(
            onClick: () {
              CustEventView.navigate(
                eventId: viewController.events[index].details.id.toInt(),
              );
            },
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.events[index].details.image?.first ?? ""),
            content: Text(
                viewController.events[index].details.name[userLanguage] ?? "")),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text("No events found"));
  }
}
