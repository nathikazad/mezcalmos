import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServiceFeedPostCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPostsFound.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPromotionsFound.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFeedView/components/FeedPromotionCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFeedView/controllers/CustFeedViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustFeedView']['CustFeedView'];

class CustFeedView extends StatefulWidget {
  final bool asTab;
  const CustFeedView({super.key, this.asTab = false});

  static Future<void> navigate() {
    return MezRouter.toPath(CustomerRoutes.customerOrdersRoute);
  }

  @override
  State<CustFeedView> createState() => _CustFeedViewState();
}

class _CustFeedViewState extends State<CustFeedView> {
  CustFeedViewController _viewController = CustFeedViewController();
  @override
  void initState() {
    super.initState();
    _viewController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      appBar: MezcalmosAppBar(
          widget.asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
          onClick: widget.asTab ? null : MezRouter.back,
          title: '${_i18n()["title"]}'),
      body: Obx(() {
        if (_viewController.isInitalized.isFalse) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitDualRing(
                  color: primaryBlueColor,
                ),
                smallSepartor,
                Text(
                  "Fetching posts and promotions...",
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: primaryBlueColor),
                )
              ],
            ),
          );
        }
        return _buildBody(context);
      }),
    );
  }

  DefaultTabController _buildBody(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          TabBar(
              labelColor: primaryBlueColor,
              unselectedLabelColor: Colors.grey.shade400,
              tabs: [
                Tab(text: '${_i18n()['posts']}'),
                Tab(text: '${_i18n()['promotions']}')
              ]),
          Expanded(
              child: TabBarView(children: <Widget>[
            Obx(() => Column(
                  children: [
                    if (_viewController.isFetching) LinearProgressIndicator(),
                    ListTile(
                      title: Text(
                        '${_i18n()['postSwitch']}',
                        style:
                            context.textTheme.bodyLarge?.copyWith(fontSize: 15),
                      ),
                      trailing: Switch(
                        activeColor: primaryBlueColor,
                        value: _viewController.postSwitch,
                        onChanged: (bool value) {
                          _viewController.setPostSwitch(value);
                        },
                      ),
                    ),
                    _buildPosts(),
                  ],
                )),
            Obx(() => Column(
                  children: [
                    if (_viewController.isFetching) LinearProgressIndicator(),
                    ListTile(
                      title: Text(
                        '${_i18n()['promotionSwitch']}',
                        style:
                            context.textTheme.bodyLarge?.copyWith(fontSize: 15),
                      ),
                      trailing: Switch(
                        activeColor: primaryBlueColor,
                        value: _viewController.promotionSwitch,
                        onChanged: (bool value) {
                          _viewController.setPromotionSwitch(value);
                        },
                      ),
                    ),
                    Expanded(
                      child: _viewController.promotions.isEmpty &&
                              !_viewController.isFetching
                          ? NoPromotionsFound()
                          : ListView.builder(
                              controller: _viewController.promoScrollController,
                              itemCount: _viewController.promotions.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  FeedPromotionCard(
                                promotion: _viewController.promotions[index],
                              ),
                            ),
                    )
                  ],
                )),
          ]))
        ]));
  }

  Widget _buildPosts() {
    return Expanded(
        child: _viewController.posts.isEmpty && !_viewController.isFetching
            ? NoPostsFound()
            : ListView.builder(
                controller: _viewController.postScrollController,
                itemCount: _viewController.posts.length,
                itemBuilder: (BuildContext context, int index) =>
                    ServiceFeedPostCard(
                      //  controller: _viewController,
                      post: _viewController.posts[index],
                      onPostComment: (int postId, String comment) async {
                        return await _viewController.writeComment(
                            postId: postId, comment: comment);
                      },
                      onLike: (int postId) async {
                        return await _viewController.likePost(postId);
                      },
                    )));
  }
}
