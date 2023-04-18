import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/OrderViewPage/order_view_page.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/cartRoute.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper']['orders'];

class CartViewPage extends StatefulWidget {
  const CartViewPage({super.key});

  @override
  State<CartViewPage> createState() => _CartViewPageState();

  static Future<void> navigate() {
    return MezRouter.toPath(CartRoute.cartViewRoute);
  }
}

class _CartViewPageState extends State<CartViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        titleWidget: Text(
          _i18n()["myCart"],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Orders",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        MezIconButton(
                          onTap: () {},
                          icon: Icons.delete_outline,
                          backgroundColor: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          shape: BoxShape.rectangle,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      "Item ${index + 1}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  InkWell(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete_outline,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "Remove",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                AssetCard(
                                  title: "Home for rent in Av Juan...",
                                  image: NetworkImage(customImageUrl),
                                  needLeadingImage: true,
                                  needTrailingImage: false,
                                  needCustomSubtitle: true,
                                  lBottomText: "13 Apr, 08:00 AM",
                                  subtitleWidget: Row(
                                    children: [
                                      Icon(Icons.person),
                                      Text("${index + 1}"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset(aPriceCheck),
                                      Text("\$528 x 1 day = \$528")
                                    ],
                                  ),
                                  leftBottomIcon: Icon(
                                    Icons.access_time_filled,
                                  ),
                                  onClick: () {},
                                ),
                                Positioned(
                                  right: 5,
                                  top: 5,
                                  child: MezIconButton(
                                    onTap: () {},
                                    icon: Icons.edit,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    childCount: 6,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text("Payment Method"),
                )
              ],
            ),
          ),
          MezButton(
            label: "Book Now",
            withGradient: true,
            onClick: () async {
              await OrderViewPage.navigate();
              return;
            },
          ),
        ],
      ),
    );
  }
}
