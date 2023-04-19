import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/controllers/CustEventsListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/MezSearch.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (viewController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // search bar
                  MezSearch(
                    margin: const EdgeInsets.only(bottom: 15),
                    onChanged: (String value) {
                      viewController.filter(value);
                      // viewController.searchEvents(value);
                    },
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: MezButton(
                          label: "Events",
                          height: 40,
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
                      Flexible(
                        child: MezButton(
                          label: "Organizers",
                          height: 40,
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
                  ),

                  // filter bar
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    color: Colors.grey.shade300,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        showModalBottomSheet(
                            isDismissible: false,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Filter"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Obx(
                                      () => Column(
                                        children: List.generate(
                                            viewController.filterCategories
                                                .length, (int index) {
                                          return CheckboxListTile(
                                            //    checkColor: primaryBlueColor,
                                            activeColor: primaryBlueColor,
                                            title: Text(viewController
                                                .filterCategories[index].name),
                                            value: viewController
                                                .selectedCategories
                                                .contains(viewController
                                                    .filterCategories[index]),
                                            onChanged: (bool? value) {
                                              if (value == true) {
                                                viewController
                                                    .selectedCategories
                                                    .add(viewController
                                                            .filterCategories[
                                                        index]);
                                              } else {
                                                viewController
                                                    .selectedCategories
                                                    .remove(viewController
                                                            .filterCategories[
                                                        index]);
                                              }
                                              // viewController
                                              //     .eventCategories[index]
                                              //     .selected = value ?? false;
                                              // viewController.filterEvents();
                                              // setState(() {});
                                            },
                                          );
                                        }),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                            child: MezButton(
                                                label: "Cancel",
                                                backgroundColor: offRedColor,
                                                textColor: redAccentColor,
                                                onClick: () async {
                                                  viewController
                                                      .selectedCategories.value
                                                      .clear();
                                                  viewController
                                                      .selectedCategories
                                                      .addAll(viewController
                                                          .filterCategories);
                                                  Navigator.pop(context);
                                                })),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                            child: MezButton(
                                                label: "Confirm",
                                                onClick: () async {
                                                  await viewController
                                                      .filterEvents();
                                                  Navigator.pop(context);
                                                })),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
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
                            Text(
                              (viewController.filterCategories.length == 1)
                                  ? "${viewController.filterCategories.first.name}"
                                  : "${viewController.filterCategories.length}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: (viewController.showBusiness.isTrue)
                        ? _buildBusinesses()
                        : _buildEvents(),
                  ),
                ],
              ),
            );
          }
        }),
      ),
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

  Widget _buildEvents() {
    if (viewController.events.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.events.length,
        (int index) => MezCard(
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
