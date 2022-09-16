import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/helpers/NumHelper.dart';
import 'package:mez_services_web_app/helpers/StringHelper.dart';
import 'package:mez_services_web_app/models/Services/Laundry.dart';
import 'package:qlevar_router/qlevar_router.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Laundry"]
        ["LaundriesListView"]["components"]["CustomerLaundrySelectCard"];

class LaundryListViewCardForMobileComponent extends StatelessWidget {
  const LaundryListViewCardForMobileComponent({
    Key? key,
    required this.laundry,
  }) : super(key: key);
  final Laundry laundry;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            var xPath = getCurrentPath();
            QR.to("${xPath[0]}/${laundry.info.id}${xPath[1]}");
          },
          child: Container(
            child: _laundryInfoHeader(),
          ),
        ));
  }

  Widget _laundryInfoHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 10),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 23,
            backgroundImage: CachedNetworkImageProvider(laundry.info.image),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  laundry.info.name,
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(50.toPriceString(),
                              style: Get.textTheme.bodyText2),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.watch_later,
                            size: 18,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Flexible(
                              child: Text(
                                  '${laundry.averageNumberOfDays} ${_i18n()["days"]}',
                                  style: Get.textTheme.bodyText2)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Row(
                        children: [
                          Icon(
                            Icons.north_east,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(" \$${laundry.getCheapestCategory}/kg",
                              style: Get.textTheme.bodyText2),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getDollarsSign() {
    if (laundry.getAverageCost <= 80) {
      return "\$";
    }
    if (laundry.getAverageCost > 80 && laundry.getAverageCost <= 140) {
      return "\$\$";
    }
    if (laundry.getAverageCost > 140) {
      return "\$\$\$";
    } else {
      return "";
    }
  }
}
