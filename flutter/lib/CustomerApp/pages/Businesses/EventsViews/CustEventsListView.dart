import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/controllers/CustEventsListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
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
          } else if (viewController.events.isEmpty) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              child: const Text("No events found"),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // search bar
                  // filter bar
                  Column(
                      children: List.generate(
                    viewController.events.length,
                    (int index) => MezCard(
                        firstAvatarBgImage: CachedNetworkImageProvider(
                            viewController.events[index].details.firstImage ??
                                ""),
                        content: Text(viewController
                                .events[index].details.name[userLanguage] ??
                            "")),
                  )),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
