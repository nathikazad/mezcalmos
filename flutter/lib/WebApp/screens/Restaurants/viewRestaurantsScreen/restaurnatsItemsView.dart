import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/AuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/viewRestaurantsScreen/components/viewRestaurantScreenFroDesktop.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/viewRestaurantsScreen/components/viewRestaurantScreenFroMobile.dart';
import 'package:mezcalmos/WebApp/screens/components/WebAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/widgets/SideWebBarWidget/SideWebBarWidget.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/StringHelper.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';

import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

class RestaurantsItemsView extends StatefulWidget {
  RestaurantsItemsView({Key? key}) : super(key: key);

  @override
  State<RestaurantsItemsView> createState() => _RestaurantsItemsViewState();
}

class _RestaurantsItemsViewState extends State<RestaurantsItemsView> {
  @override
  void initState() {
    Get.put<LanguageController>(LanguageController());

    super.initState();
  }

  final List<bool> _selectedFruits = <bool>[true, false, false];
  final MezWebSideBarController mezWebSideBarController =
      MezWebSideBarController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //  return Scaffold();
    return FutureBuilder<bool>(
        future: setupFirebase(launchMode: typeMode.toLaunchMode()),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();
            final AuthController _authcontroller = Get.find<AuthController>();
            var xLang = QR.params["lang"].toString().contains("es")
                ? LanguageType.ES
                : LanguageType.EN;
            mezDbgPrint("xLang is now ${xLang}");
            if (mounted) {
              Future.delayed(Duration(seconds: 1)).then((value) {
                Lcontroller.changeLangForWeb(xLang);
              });
            }

            return Scaffold(
              appBar: InstallAppBarComponent(),
              bottomNavigationBar: MezBottomBar(),
              key: mezWebSideBarController.drawerKey,
              drawer: mezWebSideBarController.frontDrawerContent,
              endDrawer: mezWebSideBarController.endDrawerContent,
              body: LayoutBuilder(
                builder: (context, constraints) {
                  if (MezCalmosResizer.isMobile(context) ||
                      MezCalmosResizer.isSmallMobile(context)) {
                    return ViewRestaurantScreenFroMobile();
                  } else {
                    return Obx(
                      () => Scaffold(
                          appBar: WebAppBarComponent(
                            mezWebSideBarController: mezWebSideBarController,
                            automaticallyGetBack:
                                (MezCalmosResizer.isMobile(context) ||
                                        MezCalmosResizer.isSmallMobile(context))
                                    ? false
                                    : true,
                            type: _authcontroller.fireAuthUser?.uid != null
                                ? WebAppBarType.WithCartActionButton.obs
                                : WebAppBarType.WithSignInActionButton.obs,
                          ),
                          body: ViewRestaurantScreenFroDesktop()),
                    );
                  }
                },
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: MezLoaderWidget(),
              ),
            );
          }
        });
  }
}

class ToggleButtonItemComponent extends StatelessWidget {
  ToggleButtonItemComponent(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);
  final String title;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Text(
        '$title',
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: isActive
                ? Color.fromRGBO(103, 121, 254, 1)
                : Color.fromRGBO(73, 73, 73, 1)),
      ),
    );
  }
}

class ItemCardComponnent extends StatelessWidget {
  const ItemCardComponnent(
      {Key? key,
      required this.id,
      required this.title,
      this.imageUrl,
      required this.price})
      : super(key: key);
  final String? imageUrl;
  final String title;
  final String price;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          var xPath = getCurrentPath();
          var param = getLangParam();
          QR.to("${xPath[0]}/$id${xPath[1]}");
        },
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  child: ClipOval(
                    child: Container(
                      height: SizeOfOvalImage(context),
                      width: SizeOfOvalImage(context),
                      child: Image.network(
                        "$imageUrl",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "$title",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$$price",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCardWithoutImageComponent extends StatelessWidget {
  ItemCardWithoutImageComponent(
      {Key? key,
      required this.id,
      required this.title,
      this.imageUrl,
      required this.price})
      : super(key: key);
  final String? imageUrl;
  final String title;
  final String price;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          var xPath = getCurrentPath();
          var param = getLangParam();
          QR.to("${xPath[0]}/$id${xPath[1]}${getLangParam()}");
        },
        child: Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // if we have  image
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // check if image not null
                    (imageUrl != null && imageUrl!.isNotEmpty)
                        ? Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: ClipOval(
                              child: Container(
                                height: SizeOfOvalImageTwo(context),
                                width: SizeOfOvalImageTwo(context),
                                child: Image.network(
                                  "$imageUrl",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 0,
                            width: 0,
                          ),
                    // title
                    Container(
                      child: Text(
                        "$title",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                // price
                Container(
                  child: Text(
                    "\$$price",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

double SizeOfOvalImage(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context) ||
      MezCalmosResizer.isSmallDesktop(context)) {
    return 12.w;
  } else if (MezCalmosResizer.isTablet(context)) {
    return 9.5.w;
  } else {
    return 9.5.w;
  }
}

double SizeOfOvalImageTwo(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context) ||
      MezCalmosResizer.isSmallDesktop(context)) {
    return 5.w;
  } else if (MezCalmosResizer.isTablet(context)) {
    return 2.5.w;
  } else {
    return 7.5.w;
  }
}
