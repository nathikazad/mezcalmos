import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/components/SaveLocationDailog.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/PickLocationView.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["SavedLocations"]["components"]["SavedLocationComponent"];

class SavedLocationComponent extends StatelessWidget {
  const SavedLocationComponent({
    required this.savelocation,
    Key? key,
  }) : super(key: key);

  final SavedLocation savelocation;

  // final GestureTapCallback onPress;
  /// CustomerAuthController
  static final CustomerAuthController _customerAuthController =
      Get.find<CustomerAuthController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 5, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.place,
                  color: primaryBlueColor,
                  size: 18,
                ),
                SizedBox(
                  width: 4,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(savelocation.name.capitalizeFirst.toString(),
                      style: context.txt.headlineMedium),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: (savelocation.defaultLocation)
                            ? primaryBlueColor
                            : backgroundShadeColor,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4.25),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size.zero),
                    onPressed: () {
                      Get.find<CustomerAuthController>()
                          .setAsDefaultLocation(savelocation);
                    },
                    child: Text(
                      '${_i18n()["defaultAddressText"]}',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: (savelocation.defaultLocation)
                            ? Colors.white
                            : Color(0xFF787878),
                        fontWeight: FontWeight.w600,
                        fontSize: 11.mezSp,
                      ),
                    )),
                // InkWell(
                //   onTap: () {
                //     Get.find<CustomerAuthController>()
                //         .setAsDefaultLocation(savelocation);
                //   },
                //   //borderRadius: BorderRadius.circular(16),
                //   child: Ink(
                //     height: 3.2.h,
                //     //width: 59.sp,
                //     // width: Get.find<LanguageController>().userLanguageKey ==
                //     //         LanguageType.EN
                //     //     ? 20.w
                //     //     : 28.w,
                //     padding: EdgeInsets.symmetric(horizontal: 12),
                //     decoration: BoxDecoration(
                //         color: (savelocation.defaultLocation)
                //             ? primaryBlueColor
                //             : backgroundShadeColor,
                //         borderRadius: BorderRadius.all(Radius.circular(50))),
                //     child: Center(
                //       child: Text(
                //         '${_i18n()["defaultAddressText"]}',
                //         style: TextStyle(
                //           fontFamily: "Montserrat",
                //           color: (savelocation.defaultLocation)
                //               ? Colors.white
                //               : Color(0xFF787878),
                //           fontWeight: FontWeight.w600,
                //           fontSize: 11.sp,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: 11,
                ),
                InkWell(
                  onTap: () async {
                    MezLocation? newLoc = await PickLocationView.navigate(
                      initialLocation: savelocation.location.toLatLng(),
                      onSaveLocation: ({MezLocation? location}) async {
                        if (location != null) {
                          await savedLocationDailog(
                              context: context,
                              loc: location,
                              savedLoc: savelocation,
                              skippable: false);
                        }
                      },
                    );
                  },
                  customBorder: CircleBorder(),
                  child: Ink(
                      height: 3.h,
                      width: 3.h,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: backgroundShadeColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.edit_outlined,
                          color: Color(0xFF787878),
                          size: 2.h,
                        ),
                      )),
                ),
                SizedBox(
                  width: 11,
                ),
                InkWell(
                  onTap: () {
                    _customerAuthController.deleteLocation(savelocation);
                  },
                  customBorder: CircleBorder(),
                  child: Ink(
                      height: 3.h,
                      width: 3.h,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: offRedColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.delete_outline,
                          color: Color(0xFFE21132),
                          size: 2.h,
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              child: Text(
                savelocation.location.address,
                style: context.txt.titleMedium?.copyWith(
                  color: offShadeGreyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconSavedLocationButton extends StatelessWidget {
  const IconSavedLocationButton({
    required this.iCon,
    required this.ontap,
    required this.title,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  final Widget iCon;
  final String title;
  final Color iconColor;
  final GestureTapCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
        ),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: iCon,
            ),
            const SizedBox(width: 5),
            Flexible(
              //width: Get.width * 0.25,
              child: Text(
                "$title",
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      onTap: ontap,
    );
  }
}
