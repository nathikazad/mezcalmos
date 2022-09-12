import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/models/Services/Laundry.dart';
import 'package:mez_services_web_app/screens/Laundries/laundryListView/components/laundryListViewCardForDesktopComponent.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';

class LaundryListViewForDesktop extends StatelessWidget {
  const LaundryListViewForDesktop(
      {Key? key, required this.laundries, required this.shipingPrice})
      : super(key: key);
  final List<Laundry> laundries;
  final num shipingPrice;

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
              alignment: Alignment.centerLeft,
              child: Text(
                "Find your closest laundries or dry cleaners",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                )),
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
                    // QR.to(
                    //   "/restaurants/${viewController.filteredRestaurants[index].info.id}",
                    // );
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
