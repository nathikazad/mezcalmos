import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpAcceptedPayments.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpEditInfoWidgets.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpEditLocationCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpImageEditComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpOpenClose.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROplanguageSelectorComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpDashboardPage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpInfoPage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpPaymentsPage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/pages/ROpSchedulePage.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpTabsViewView/controllers/ROpTabsViewViewController.dart';
import 'package:mezcalmos/RestaurantApp/pages/ReviewsView/ROpReviewsView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
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

  SingleChildScrollView _oldBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _restaurantInfoPage(),
          Text("${_i18n()["defaultLanguage"]}"),
          ROpLanguageSelectorComponent(
              languageValue: editInfoController.editablePrLang,
              oppositeLanguageValue: editInfoController.editableScLang,
              onChangeShouldUpdateLang: editInfoController.changePrimaryLang),
          SizedBox(
            height: 15,
          ),
          Text("${_i18n()["secondaryLanguage"]}"),
          SizedBox(
            height: 5,
          ),
          ROpLanguageSelectorComponent(
            languageValue: editInfoController.editableScLang,
            oppositeLanguageValue: editInfoController.editablePrLang,
            onChangeShouldUpdateLang:
                editInfoController.validateSecondaryLanguUpdate,
            isSecondary: true,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
              '${_i18n()["description"]} ${editInfoController.primaryLang.value!.toLanguageName()}'),
          SizedBox(
            height: 5,
          ),
          _prdescTextField(),
          SizedBox(
            height: 15,
          ),
          Text(
              '${_i18n()["description"]} ${editInfoController.secondaryLang.value!.toLanguageName()}'),
          SizedBox(
            height: 5,
          ),
          _scdescTextField(),
          SizedBox(
            height: 15,
          ),
          Text('${_i18n()["location"]}'),
          SizedBox(
            height: 5,
          ),
          ROpEditLocationCard(
            editInfoController: editInfoController,
          ),
          SizedBox(
            height: 15,
          ),
          ROpAcceptedPayments(viewController: editInfoController),
          Container(
            child: viewWidgets.editWorkingHoursComponent(),
          ),
          SizedBox(
            height: 25,
          ),
          ROpOpenClose(
              title: '${_i18n()["openTitle"]}',
              subtitle: '${_i18n()["openSubtitle"]}',
              onTurnedOn: () {
                editInfoController.switchAv(true);
              },
              onTurnedOff: () {
                editInfoController.switchAv(false);
              },
              initialSwitcherValue: editInfoController.isAvailable.value),
        ],
      ),
    );
  }

  Widget _restaurantInfoPage() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ROpImageEditComponent(editInfoController: editInfoController),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    editInfoController.restaurant.value?.info.name ?? "",
                    style: Get.textTheme.headline3,
                  ),
                )
                // Laundry name fiels
                ,
                SizedBox(
                  height: 25,
                ),
                Text('${_i18n()["restaurantName"]}'),
                SizedBox(
                  height: 5,
                ),
                _restNameTextField(),
                SizedBox(
                  height: 15,
                ),
                Text(
                    '${_i18n()["description"]} ${editInfoController.primaryLang.value!.toLanguageName()}'),
                SizedBox(
                  height: 5,
                ),
                _prdescTextField(),
                SizedBox(
                  height: 15,
                ),
                Text(
                    '${_i18n()["description"]} ${editInfoController.secondaryLang.value!.toLanguageName()}'),
                SizedBox(
                  height: 5,
                ),
                _scdescTextField(),
                SizedBox(
                  height: 15,
                ),
                Text("${_i18n()["defaultLanguage"]}"),
                SizedBox(
                  height: 5,
                ),
                ROpLanguageSelectorComponent(
                    languageValue: editInfoController.editablePrLang,
                    oppositeLanguageValue: editInfoController.editableScLang,
                    onChangeShouldUpdateLang:
                        editInfoController.changePrimaryLang),
                SizedBox(
                  height: 15,
                ),
                Text("${_i18n()["secondaryLanguage"]}"),
                SizedBox(
                  height: 5,
                ),
                ROpLanguageSelectorComponent(
                  languageValue: editInfoController.editableScLang,
                  oppositeLanguageValue: editInfoController.editablePrLang,
                  onChangeShouldUpdateLang:
                      editInfoController.validateSecondaryLanguUpdate,
                  isSecondary: true,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        _editInfoSaveButton()
      ],
    );
  }

  TextFormField _restNameTextField() {
    return TextFormField(
      controller: editInfoController.restaurantNameTxt,
      style: Get.textTheme.bodyText1,
    );
  }

  TextFormField _prdescTextField() {
    return TextFormField(
      controller: editInfoController.prRestaurantDescTxt,
      style: Get.textTheme.bodyText1,
      maxLines: 5,
      minLines: 3,
    );
  }

  TextFormField _scdescTextField() {
    return TextFormField(
      controller: editInfoController.scRestaurantDescTxt,
      style: Get.textTheme.bodyText1,
      maxLines: 5,
      minLines: 3,
    );
  }
  // SAVE BUTTON ON THE FOOTER OF SCREEN

  Widget _editInfoSaveButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(gradient: bluePurpleGradient),
      child: Obx(
        () => TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder()),
            onPressed: (editInfoController.btnClicked.value)
                ? null
                : () {
                    editInfoController.updateLaundryInfo().then((value) =>
                        Get.snackbar(
                            '${_i18n()["saved"]}', '${_i18n()["savedText"]}',
                            backgroundColor: Colors.black,
                            colorText: Colors.white,
                            shouldIconPulse: false,
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )));
                  },
            child: (editInfoController.btnClicked.value)
                ? Container(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Text('${_i18n()["saveInfo"]}'))),
      ),
    );
  }
}
