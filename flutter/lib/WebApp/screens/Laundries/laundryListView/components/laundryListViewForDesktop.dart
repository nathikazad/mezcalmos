import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/WebApp/screens/Laundries/laundryListView/components/laundryListViewCardForDesktopComponent.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/components/restaurantCardForDesktopAndTablet.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/webHelpers/StringHelper.dart';

import 'package:qlevar_router/qlevar_router.dart';

class LaundryListViewForDesktop extends StatelessWidget {
  LaundryListViewForDesktop(
      {Key? key, required this.laundries, required this.shipingPrice})
      : super(key: key);
  final List<Laundry> laundries;
  final num shipingPrice;
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Obx(
                () => Text(
                  "${lang.strings["CustomerApp"]["pages"]["Laundry"]["LaundriesListView"]["title2"]}",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: TitleSize(context),
                    fontWeight: FontWeight.w700,
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MezCalmosResizer.isSmallTablet(context) ||
                        MezCalmosResizer.isTablet(context))
                    ? 2
                    : 3,
                childAspectRatio: (MezCalmosResizer.isSmallTablet(context) ||
                        MezCalmosResizer.isTablet(context))
                    ? 1.3
                    : 1.6,
              ),
              itemCount: laundries.length,
              itemBuilder: (BuildContext context, int index) {
                return laundryListViewCardForDesktopComponent(
                  shippingPrice: shipingPrice,
                  onClick: () {
                    var xPath = getCurrentPath();
                    QR.to(
                      "${xPath[0]}/${laundries[index].info.id}${xPath[1]}",
                    );
                  },
                  laundry: laundries[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
