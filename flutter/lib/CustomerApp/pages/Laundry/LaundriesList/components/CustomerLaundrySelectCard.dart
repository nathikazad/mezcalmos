import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Laundry"]
        ["LaundriesListView"]["components"]["CustomerLaundrySelectCard"];

class CustomerLaundrySelectCard extends StatelessWidget {
  const CustomerLaundrySelectCard({Key? key, required this.laundry})
      : super(key: key);
  final Laundry laundry;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Get.toNamed(getSingleLaundryRoute(laundry.info.id));
      },
      child: Container(
        child: Column(
          children: [
            _laundryInfoHeader(),

            // Divider(),
            //   _costsExpandableComponent()
          ],
        ),
      ),
    ));
  }

  Widget _laundryInfoHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 3, left: 3, bottom: 8),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(laundry.info.image),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  laundry.info.name,
                  style: Get.textTheme.bodyText1,
                ),
                Divider(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            size: 17,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text('\$50', style: Get.textTheme.bodyText2),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              size: 17,
                              color: Colors.grey.shade800,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Flexible(
                                child: Text('2 ${_i18n()["days"]}',
                                    style: Get.textTheme.bodyText2)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        flex: 3,
                        fit: FlexFit.loose,
                        child: Text(
                            "${_i18n()["startingFrom"]} \$${laundry.getCheapestCategory}",
                            style: Get.textTheme.bodyText2),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
