import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/controllers/cusBusinessViewController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustBusinessViewAppbar extends StatelessWidget {
  const CustBusinessViewAppbar({super.key, required this.viewController});
  final CustBusinessViewController viewController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      centerTitle: true,
      expandedHeight: 270,
      leadingWidth: 35,
      automaticallyImplyLeading: false,
      bottom: getBottom(context),
      // leading: _BackButtonAppBar(),
      // actions: <Widget>[
      //   getAppbarIconsButton(),
      // ],
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.6,
        //  titlePadding: EdgeInsets.only(bottom: _getBottomPadding()),
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        title: Container(
          alignment: Alignment.bottomCenter,
          width: 55.w,
          // padding: EdgeInsets.only(
          //     bottom: controller.showInfo.isTrue ? 5 : 12, left: 5, right: 5),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    //  margin: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      viewController.business!.details.name,
                      style: context.textTheme.displaySmall
                          ?.copyWith(color: Colors.white, fontSize: 14.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        background: _backgroundImageComponent(),
      ),
    );
  }

  PreferredSizeWidget? getBottom(BuildContext context) {
    // if (viewController.s == false) {
    //   return PreferredSize(
    //     preferredSize: Size.fromHeight(15),
    //     child: LinearProgressIndicator(color: primaryBlueColor),
    //   );
    // } else if (controller.showInfo.isFalse) {
    //   return bottomFilters(context);
    // }
    return null;
  }

  Widget _backgroundImageComponent() {
    return CachedNetworkImage(
      imageUrl: viewController.business!.details.image,
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
            viewController.business!.details.name.generateTwoFirstLetters(),
            style: const TextStyle(
              color: Color.fromRGBO(172, 89, 252, 0.8),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
