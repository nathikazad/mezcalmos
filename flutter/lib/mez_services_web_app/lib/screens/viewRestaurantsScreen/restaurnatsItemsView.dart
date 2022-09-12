import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/screens/components/installAppBarComponent.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreen/components/viewRestaurantScreenFroDesktop.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreen/components/viewRestaurantScreenFroMobile.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/setUpHelper.dart';

class RestaurantsItemsView extends StatefulWidget {
  RestaurantsItemsView({Key? key}) : super(key: key);

  @override
  State<RestaurantsItemsView> createState() => _RestaurantsItemsViewState();
}

class _RestaurantsItemsViewState extends State<RestaurantsItemsView> {
  final List<bool> _selectedFruits = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return FutureBuilder<bool>(
        future: setupFirebase(launchMode: typeMode.toLaunchMode()),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();

            return Scaffold(
              appBar: InstallAppBarComponent(),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  if (MezCalmosResizer.isMobile(context) ||
                      MezCalmosResizer.isSmallMobile(context)) {
                    return ViewRestaurantScreenFroMobile();
                  } else {
                    return ViewRestaurantScreenFroDesktop();
                  }
                },
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: () {
          QR.to("${QR.currentPath}/$id");
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
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$$price",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: () {
          print("the item id is $id");
          QR.to("${QR.currentPath}/$id");
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
                            fontSize: 12,
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
                        fontSize: 12,
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
    return 10.w;
  } else if (MezCalmosResizer.isTablet(context)) {
    return 7.5.w;
  } else {
    return 7.5.w;
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
