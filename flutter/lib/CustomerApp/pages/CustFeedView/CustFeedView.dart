import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPostsFound.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPromotionsFound.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFeedView/components/FeedPromotionCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFeedView/controllers/CustFeedViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/components/ServiceFeedPostCard.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';
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
      body: DefaultTabController(
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
                      ListTile(
                        title: Text(
                          '${_i18n()['postSwitch']}',
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontSize: 15),
                        ),
                        trailing: Switch(
                          activeColor: primaryBlueColor,
                          value: _viewController.postSwitch,
                          onChanged: (bool value) {
                            _viewController.setPostSwitch(value);
                          },
                        ),
                      ),
                      Expanded(
                          child: _viewController.posts.isEmpty
                              ? NoPostsFound()
                              : ListView.builder(
                                  controller:
                                      _viewController.postScrollController,
                                  itemCount: _viewController.posts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          ServiceFeedPostCard(
                                            //  controller: _viewController,
                                            post: _viewController.posts[index],
                                            onCommentPost:
                                                (Post post, String comment) {
                                              _viewController.writeComment(
                                                  postId: post.id,
                                                  comment: comment);
                                            },
                                            onLikePost: (Post post) {
                                              _viewController.likePost(post.id);
                                            },
                                          )))
                    ],
                  )),
              Obx(() => Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${_i18n()['promotionSwitch']}',
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontSize: 15),
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
                        child: _viewController.promotions.isEmpty
                            ? NoPromotionsFound()
                            : ListView.builder(
                                controller:
                                    _viewController.promoScrollController,
                                itemCount: _viewController.promotions.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        FeedPromotionCard(
                                  promotion: _viewController.promotions[index],
                                ),
                              ),
                      )
                    ],
                  )),
            ]))
          ])),
    );
  }
}
