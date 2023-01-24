import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/ROpAppBar.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpDashboardPage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpInfoPage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpReviewsPage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpSchedulePage.dart';
import 'package:mezcalmos/RestaurantApp/pages/TabsView/controllers/ROpTabsViewViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['ROpEditInfoView'];

class ROpDashboardView extends StatefulWidget {
  const ROpDashboardView(
      {Key? key,
      this.restID,
      this.canGoBack = true,
      this.tabsViewViewController})
      : super(key: key);
  final int? restID;
  final bool canGoBack;
  final ROpTabsViewViewController? tabsViewViewController;
  @override
  State<ROpDashboardView> createState() => _ROpDashboardViewState();
}

class _ROpDashboardViewState extends State<ROpDashboardView> {
  AnimatedSliderController animatedSliderController =
      AnimatedSliderController();
  ROpEditInfoController editInfoController = ROpEditInfoController();

  int? restaurantID;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    restaurantID = widget.restID ?? int.parse(Get.parameters["restaurantId"]!);
    if (restaurantID != null) {
      editInfoController.init(
          restaurantId: restaurantID!,
          tabsViewViewController: widget.tabsViewViewController);
    } else
      MezRouter.back();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return widget.canGoBack || _pageController.page != 0;
      },
      child: Obx(() {
        if (editInfoController.restaurant.value != null) {
          return Scaffold(
            appBar: _getAppBar(),
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            drawer: ROpDrawer(),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                ROpDashboardPage(
                  viewController: editInfoController,
                  pageController: _pageController,
                ),
                //
                ROpInfoPage(editInfoController: editInfoController),
                //
                ROpSchedulePage(
                  editInfoController: editInfoController,
                ),
                //

                ROpReviewsView(restId: restaurantID!),
              ],
            ),
            // bottomNavigationBar: _editInfoSaveButton(),
          );
        } else {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: MezLogoAnimation(
              centered: true,
            ),
          );
        }
      }),
    );
  }

  PreferredSize _getAppBar() {
    return PreferredSize(
      preferredSize: (editInfoController.isApproved.isTrue)
          ? Size.fromHeight(kToolbarHeight)
          : Size.fromHeight(kToolbarHeight * 2),
      child: Obx(
        () => ROpAppBar(
          leftBtnType:
              !widget.canGoBack && editInfoController.cuurentPage.value == 0
                  ? AppBarLeftButtonType.Menu
                  : AppBarLeftButtonType.Back,
          canGoBack: true,
          onClick: !widget.canGoBack &&
                  editInfoController.cuurentPage.value == 0
              ? null
              : () {
                  if (_pageController.page != 0) {
                    _pageController.animateToPage(0,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                    editInfoController.cuurentPage.value = 0;
                    editInfoController.tabsViewViewController?.showTabs.value =
                        true;
                  } else {
                    MezRouter.back();
                  }
                },
          title: editInfoController.getPageTitle(),
          bottom: (editInfoController.isApproved.isFalse)
              ? PreferredSize(
                  preferredSize: Size(double.infinity, kToolbarHeight),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.amber.shade200,
                    child: Text(
                      "Your restaurant is under review, you’ll be notifiedonce it’s approved.",
                      style: Get.textTheme.bodyText1
                          ?.copyWith(color: Colors.amber.shade700),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
