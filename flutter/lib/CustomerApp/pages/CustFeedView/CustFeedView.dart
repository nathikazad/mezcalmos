import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPostsFound.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFeedView/components/FeedCardPost.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFeedView/controllers/CustFeedViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustFeedView']['CustFeedView'];

class CustFeedView extends StatelessWidget {
  final bool asTab;
  CustFeedView({super.key, this.asTab = false});

  static Future<void> navigate() {
    return MezRouter.toPath(CustomerRoutes.customerOrdersRoute);
  }

  final CustFeedViewController _viewController = CustFeedViewController.init();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        appBar: MezcalmosAppBar(
            asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
            onClick: asTab ? null : MezRouter.back,
            title: '${_i18n()["title"]}'),
        body: Obx(() => _viewController.posts.isEmpty
            ? NoPostsFound()
            : SingleChildScrollView(
                controller: _viewController.scrollController,
                child: Column(
                  children: List.generate(
                      _viewController.posts.length,
                      (int index) => FeedCardPost(
                          controller: _viewController,
                          post: _viewController.posts[index])),
                ),
              )));
  }
}
