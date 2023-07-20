import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPostsFound.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPromotionsFound.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFeedView/components/FeedCardPost.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFeedView/controllers/CustFeedViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezExpandableCard.dart';
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
                            onChanged: _viewController.setPostSwitch),
                      ),
                      Expanded(
                          child: _viewController.posts.isEmpty
                              ? NoPostsFound()
                              : ListView.builder(
                                  controller: _viewController.scrollController,
                                  itemCount: _viewController.posts.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      FeedCardPost(
                                          controller: _viewController,
                                          post: _viewController.posts[index])))
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
                            onChanged: _viewController.setPromotionSwitch),
                      ),
                      Expanded(
                          child: _viewController.promotions.isEmpty
                              ? NoPromotionsFound()
                              : ListView.builder(
                                  itemCount: _viewController.promotions.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      MezExpandableCard(
                                        elevation: 0,
                                        marging: EdgeInsets.only(
                                            left: 16, right: 16, bottom: 10),
                                        imageUrl:
                                            'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=826&t=st=1689760974~exp=1689761574~hmac=7dd12d67a92c9c9a0b8a3a2372a0bac260b5e74849a275f3a625bca8ce96c87a',
                                        imageShape: BoxShape.circle,
                                        headerImageRadius: 40,
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                                textAlign: TextAlign.center,
                                                style: context
                                                    .textTheme.bodyLarge
                                                    ?.copyWith(fontSize: 15),
                                                TextSpan(
                                                    text: 'Bello Puerto',
                                                    children: [
                                                      WidgetSpan(
                                                          child:
                                                              hSmallSepartor),
                                                      TextSpan(
                                                          text: '●',
                                                          style: TextStyle(
                                                              fontSize: 10)),
                                                      WidgetSpan(
                                                          child:
                                                              hSmallSepartor),
                                                      TextSpan(
                                                          text: 'Bello Puerto')
                                                    ])),
                                            Text(
                                              '27 May, 09:00 AM - 30 May, 7:00 PM',
                                              style: context
                                                  .textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color:
                                                          Colors.grey.shade400,
                                                      fontSize: 13),
                                            )
                                          ],
                                        ),
                                        expandableWidget: [
                                          Text(
                                            'Promotional items',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          smallSepartor,
                                          Text(
                                            'Tuna Sashimi, Mixed Salad, Fetuccini Dorado, Vegeterian pasta, Tuna and pineapple toast.',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          Divider(),
                                          Text(
                                            'Discounted items',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          smallSepartor,
                                          Text(
                                            'Red Chili Water.',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          )
                                        ],
                                      )))
                    ],
                  )),
            ]))
          ])),
    );
  }
}
