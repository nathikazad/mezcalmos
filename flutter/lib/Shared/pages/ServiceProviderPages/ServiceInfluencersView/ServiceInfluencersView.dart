import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfluencersView/components/ServiceInfluencerCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfluencersView/controllers/ServiceInfluencersViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

class ServiceInfluencersView extends StatefulWidget {
  const ServiceInfluencersView({super.key});

  static void navigate(
      {required int serviceId, required ServiceProviderType type}) {
    MezRouter.toPath(SharedServiceProviderRoutes.kServiceInfluencersView,
        arguments: {
          "serviceId": serviceId,
          "ServiceProviderType": type,
        });
  }

  @override
  State<ServiceInfluencersView> createState() => _ServiceInfluencersViewState();
}

class _ServiceInfluencersViewState extends State<ServiceInfluencersView>
    with TickerProviderStateMixin {
  ServiceInfluencersViewController viewController =
      ServiceInfluencersViewController();
  @override
  void initState() {
    int? serviceId = MezRouter.bodyArguments?["serviceId"] as int?;
    ServiceProviderType? type =
        MezRouter.bodyArguments?["ServiceProviderType"] as ServiceProviderType?;
    if (serviceId != null && type != null) {
      viewController.init(serviceId: serviceId, type: type, vsync: this);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          title: "Influencers",
          tabBar: TabBar(controller: viewController.tabController, tabs: [
            Tab(
              text: "Partners",
            ),
            Tab(
              text: "Discover",
            ),
            Tab(
              text: "Requests",
            ),
          ])),
      body: TabBarView(
        controller: viewController.tabController,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        viewController.partners.length,
                        (int index) => ServiceInfluencerCard(
                            influencer: viewController.partners[index])),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        viewController.discoverInfluencers.length,
                        (int index) => ServiceInfluencerCard(
                            influencer:
                                viewController.discoverInfluencers[index])),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        viewController.requests.length,
                        (int index) => ServiceInfluencerCard(
                            influencer: viewController.requests[index])),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
