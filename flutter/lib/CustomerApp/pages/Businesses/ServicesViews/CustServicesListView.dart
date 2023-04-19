import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/controllers/CustEventsListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/controllers/CustServicesListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/MezSearch.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustServicesListView extends StatefulWidget {
  const CustServicesListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custServicesListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustServicesListView> createState() => _CustServicesListViewState();
}

class _CustServicesListViewState extends State<CustServicesListView> {
  CustServiceListViewController viewController =
      CustServiceListViewController();

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
        title: "Services",
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (viewController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewController.services.isEmpty) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              child: const Text("No services found"),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  MezSearch(
                      margin: EdgeInsets.only(bottom: 15),
                      onChanged: (String v) {}),
                  Row(
                    children: [
                      Flexible(
                        child: MezButton(
                          label: "Services",
                          height: 40,
                          onClick: () async {},
                          icon: Icons.cleaning_services,
                          borderRadius: 35,
                          backgroundColor: Colors.grey.shade300,
                          textColor: Colors.grey.shade800,
                        ),
                      ),
                      Flexible(
                        child: MezButton(
                          label: "Stores",
                          height: 40,
                          onClick: () async {},
                          icon: Icons.store,
                          borderRadius: 35,
                          backgroundColor: Colors.grey.shade300,
                          textColor: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  // search bar
                  // filter bar
                  Column(
                      children: List.generate(
                    viewController.services.length,
                    (int index) => MezCard(
                        firstAvatarBgImage: CachedNetworkImageProvider(
                            viewController.services[index].details.image?.first ??
                                ""),
                        content: Text(viewController
                                .services[index].details.name[userLanguage] ??
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
