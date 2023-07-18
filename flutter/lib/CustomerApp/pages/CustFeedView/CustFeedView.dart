import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFeedView/components/FeedCardPost.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class CustFeedView extends StatelessWidget {
  final bool asTab;
  const CustFeedView({super.key, this.asTab = false});

  static Future<void> navigate() {
    return MezRouter.toPath(CustomerRoutes.customerOrdersRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        appBar: MezcalmosAppBar(
            asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
            onClick: asTab ? null : MezRouter.back,
            title: '${_i18n()["title"]}'),
        body: /*Obx(() => true == true ? CircularProgressIndicator() :*/
            ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FeedCardPost();
                }));
  }
}
