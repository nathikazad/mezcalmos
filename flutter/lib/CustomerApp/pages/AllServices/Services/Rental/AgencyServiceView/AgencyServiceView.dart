import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyInfoTab.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyStoreTab.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/CustomAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/AgencyController.dart';

class AgencyServiceView extends StatefulWidget {
  const AgencyServiceView({super.key});

  @override
  State<AgencyServiceView> createState() => _AgencyServiceViewState();

  static Future<void> navigate({
    required String businessId,
  }) {
    return MezRouter.toPath(RentalRoutes.homeServiceRoute, arguments: {
      "businessId": businessId,
    });
  }
}

class _AgencyServiceViewState extends State<AgencyServiceView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late String businessId;
  AgencyController agencyController = AgencyController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    businessId = MezRouter.bodyArguments!["businessId"];
    agencyController.getAgencyStoreData(businessId);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final List<IconData> tabs = [
    Icons.store,
    Icons.info_outline,
  ];
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomAppBar(),
            ];
          },
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: TabBar(
                  tabs: [
                    for (int index = 0; index < tabs.length; index++)
                      Tab(
                        icon: Icon(tabs[index]),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    AgencyStoreTab(
                      agencyController: agencyController,
                    ),
                    AgencyInfoTab(
                      agencyController: agencyController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
