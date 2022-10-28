import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpEditInfoWidgets.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpDashboardPage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpInfoPage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpPaymentsPage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpSchedulePage.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpTabsViewView/controllers/ROpTabsViewViewController.dart';
import 'package:mezcalmos/RestaurantApp/pages/ReviewsView/ROpReviewsView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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
  final String? restID;
  final bool canGoBack;
  final ROpTabsViewViewController? tabsViewViewController;
  @override
  State<ROpDashboardView> createState() => _ROpDashboardViewState();
}

class _ROpDashboardViewState extends State<ROpDashboardView> {
  // LaundryInfoController laundryInfoController =
  //     Get.find<LaundryInfoController>();
  AnimatedSliderController animatedSliderController =
      AnimatedSliderController();
  ROpEditInfoController editInfoController = ROpEditInfoController();
  late ROpEditInfoWidgets viewWidgets;
  String? restaurantID;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    restaurantID =
        restaurantID = widget.restID ?? Get.arguments["restaurantId"];
    if (restaurantID != null) {
      editInfoController.init(
          restaurantId: restaurantID!,
          tabsViewViewController: widget.tabsViewViewController);

      viewWidgets = ROpEditInfoWidgets(
          editInfoController: editInfoController, context: context);
    } else
      Get.back();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return widget.canGoBack || _pageController.page == 0;
      },
      child: Obx(() {
        if (editInfoController.restaurant.value != null) {
          return Scaffold(
            //  backgroundColor: Colors.white,

            appBar: (editInfoController.showStripe.isTrue)
                ? null
                : PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: Obx(
                      () => LaundryAppAppBar(
                        leftBtnType: AppBarLeftButtonType.Back,
                        canGoBack: widget.canGoBack ||
                            editInfoController.cuurentPage.value != 0,
                        onClick: () {
                          if (_pageController.page != 0) {
                            _pageController.animateToPage(0,
                                duration: Duration(milliseconds: 1),
                                curve: Curves.easeIn);
                            editInfoController.cuurentPage.value = 0;
                            editInfoController
                                .tabsViewViewController?.showTabs.value = true;
                          } else {
                            Get.back();
                          }
                        },
                        title: editInfoController.getPageTitle(),
                        showOrders: true,
                      ),
                    ),
                  ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                ROpDashboardPage(
                  viewController: editInfoController,
                  pageController: _pageController,
                ),
                ROpInfoPage(editInfoController: editInfoController),
                ROpSchedulePage(
                    editInfoController: editInfoController,
                    viewWidgets: viewWidgets),
                ROpPaymentPage(
                  editInfoController: editInfoController,
                ),
                ROpReviewsView(restId: widget.restID!),
                // ROpAcceptedPayments(viewController: editInfoController)
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
}
