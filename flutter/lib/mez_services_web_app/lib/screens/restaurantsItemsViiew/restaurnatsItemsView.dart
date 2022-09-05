import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/screens/components/installAppBarComponent.dart';
import 'package:mez_services_web_app/screens/resturentListView/components/restaurantItemsBodyComponent.dart';
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
                  return RestaurantItemsBodyComponent();
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
  final bool isActive;

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
  const ItemCardComponnent({Key? key}) : super(key: key);
  // final String imageUrl;
  // final String title;
  // final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      "https://cdn.pixabay.com/photo/2014/02/12/18/11/lettuce-264826_1280.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "test",
                style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "\$150",
                style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
              )
            ],
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
