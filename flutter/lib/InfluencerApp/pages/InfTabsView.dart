import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/controllers/influencerAuthController.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfDealsView/InfDealsView.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfEarningsView/InfEarningsView.dart';
import 'package:mezcalmos/InfluencerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['InfluencerApp']
    ['Pages']['InfTabsView'];

class InfTabsView extends StatefulWidget {
  const InfTabsView({super.key});

  static void navigate() {
    MezRouter.toPath(InfluencerAppRoutes.tabsView);
  }

  @override
  State<InfTabsView> createState() => _InfTabsViewState();
}

class _InfTabsViewState extends State<InfTabsView> {
  InfluencerAuthController _authController =
      Get.find<InfluencerAuthController>();

  RxInt _index = RxInt(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navBar(),
      body: Obx(() {
        if (_authController.influencer != null) {
          return _getBody();
        } else {
          return MezLogoAnimation(
            centered: true,
          );
        }
      }),
    );
  }

  Widget _getBody() {
    switch (_index.value) {
      case 0:
        return InfDealsView();

      case 1:
        return InfEarningsView();

      default:
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text("Error"),
          ),
        );
    }
  }

  Widget _navBar() {
    return Obx(() => BottomNavigationBar(
            selectedLabelStyle: context.textTheme.bodyLarge,
            unselectedLabelStyle: context.textTheme.bodyMedium,
            currentIndex: _index.value,
            onTap: (int v) {
              _index.value = v;
            },
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.discount_rounded),
                label: '${_i18n()["deals"]}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.price_check),
                label: '${_i18n()["earnings"]}',
              ),
            ]));
  }
}
