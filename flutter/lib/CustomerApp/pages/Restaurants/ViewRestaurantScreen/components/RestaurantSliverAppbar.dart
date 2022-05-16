import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Menu/MenuComponent.dart';
import 'package:mezcalmos/CustomerApp/components/MyCartAppBarIcon.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart'
    show TwoLettersGenerator;
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class RestaurantSliverAppBar extends StatelessWidget {
  RestaurantSliverAppBar(
      {Key? key,
      required this.restaurant,
      required this.scrollController,
      required this.tabController,
      required this.onTap,
      required this.onInfoTap,
      required this.showInfo})
      : super(key: key);

  final Restaurant restaurant;
  final AutoScrollController scrollController;
  final TabController tabController;

  final void Function(int index) onTap;
  final void Function() onInfoTap;
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      expandedHeight: 220,
      automaticallyImplyLeading: false,
      bottom:
          (restaurant.getCategories.length > 1 && !showInfo) ? bottom : null,
      // titleSpacing: 16,
      // titleTextStyle: Get.textTheme.headline3?.copyWith(color: Colors.white),
      // title: Text(restaurant.info.name),
      leading: IconButton(
        onPressed: (showInfo) ? onInfoTap : Get.back,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        MyCartAppBarIcon(iconColor: Colors.white),
        MenuComponent(padding: 2),
      ],
      pinned: true,
      //  floating: true,

      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double top = constraints.constrainHeight();
        final double collapsedHight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight + 60;
        // WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        //   onCollapsed(collapsedHight != top);
        // });

        return FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(
              bottom:
                  (restaurant.getCategories.length > 1 && !showInfo) ? 60 : 12),
          // centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                restaurant.info.name,
                style: Get.textTheme.headline3
                    ?.copyWith(color: Colors.white, fontSize: 14.sp),
              ),
              SizedBox(
                width: 5,
              ),
              if (!showInfo)
                InkWell(
                    onTap: onInfoTap,
                    child: Icon(
                      Icons.info_outline_rounded,
                      size: 14.sp,
                      color: Colors.white,
                    ))
            ],
          ),
          background: CachedNetworkImage(
            imageUrl: restaurant.info.image,
            fit: BoxFit.cover,
            imageBuilder: (BuildContext context, ImageProvider<Object> image) =>
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withOpacity(0.8),
                    const Color(0x00000000).withOpacity(0.1),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            placeholder: (_, __) {
              return Shimmer.fromColors(
                child: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: double.infinity,
                ),
                highlightColor: Colors.grey[400]!,
                enabled: true,
                //   period: Duration(milliseconds: 100),
                baseColor: Colors.grey[300]!,
                direction: ShimmerDirection.ltr,
              );
            },
            errorWidget: (_, __, ___) {
              return Container(
                height: 63,
                width: 63,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  restaurant.info.name.generateTwoFirstLetters(),
                  style: const TextStyle(
                    color: Color.fromRGBO(172, 89, 252, 0.8),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  PreferredSizeWidget? get bottom {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          indicatorColor: Get.theme.primaryColorLight,
          indicatorWeight: 3,
          labelColor: Colors.black,
          tabs: restaurant.getCategories.map((Category e) {
            return Tab(text: e.name?[userLanguage] ?? "");
          }).toList(),
          onTap: onTap,
        ),
      ),
    );
  }
}
