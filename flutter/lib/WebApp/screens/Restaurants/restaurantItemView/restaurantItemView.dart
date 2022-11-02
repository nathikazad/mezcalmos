// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/components/restauarntItemViewForDesktop.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/components/restaurantItemViewForMobile.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';

import 'package:qlevar_router/qlevar_router.dart';

import '../../../../Shared/controllers/restaurantsInfoController.dart';

class RestaurantItemView extends StatefulWidget {
  const RestaurantItemView({Key? key}) : super(key: key);

  @override
  State<RestaurantItemView> createState() => _RestaurantItemViewState();
}

class _RestaurantItemViewState extends State<RestaurantItemView> {
  Item? item;

  @override
  void didChangeDependencies() {
    _getRestaurant();
    super.didChangeDependencies();
  }

  void _getRestaurant() async {
    setupFirebase(launchMode: typeMode.toLaunchMode()).then((value) {
      Get.find<RestaurantsInfoController>()
          .getRestaurant(QR.params['id'].toString())
          .then((value) {
        if (value != null) {
          setState(() {
            item = value.findItemById(id: QR.params['itemId'].toString());
            if (item != null) {
              print("this is another test ${item?.toJson()}");
            } else {
              QR.to("/404");
            }
          });
        } else {
          QR.to("/404");
        }
      });
      var xLang = QR.params["lang"].toString().contains("es")
          ? LanguageType.ES
          : LanguageType.EN;
      print("xLang is now ${xLang}");
      if (mounted) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          Get.find<LanguageController>().changeLangForWeb(xLang);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("the restaurant id is ${QR.params['itemId'].toString()}");
    return FutureBuilder<bool>(
        future: setupFirebase(launchMode: typeMode.toLaunchMode()),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();
            return (item != null)
                ? Scaffold(
                    appBar: InstallAppBarComponent(
                      automaticallyGetBack:
                          (MezCalmosResizer.isMobile(context) ||
                                  MezCalmosResizer.isSmallMobile(context))
                              ? false
                              : true,
                    ),
                    bottomNavigationBar: MezBottomBar(),
                    body: LayoutBuilder(builder: (context, constraints) {
                      if (MezCalmosResizer.isMobile(context) ||
                          MezCalmosResizer.isSmallMobile(context)) {
                        return RestaurantItemViewForMobile(
                          item: item!,
                        );
                      } else {
                        return RestaurantItemViewForDesktop(
                          item: item!,
                        );
                      }
                    }),
                  )
                : Scaffold(
                    body: Center(
                      child: MezLoaderWidget(),
                    ),
                  );
          } else {
            return Scaffold();
          }
        });
  }
}
