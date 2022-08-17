import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Laundry"]
        ["LaundriesListView"]["components"]["CustomerLaundrySelectCard"];

class CustomerLaundrySelectCard extends StatelessWidget {
  const CustomerLaundrySelectCard(
      {Key? key, required this.laundry, required this.shippingPrice})
      : super(key: key);
  final Laundry laundry;
  final int shippingPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Get.toNamed(getSingleLaundryRoute(laundry.info.id));
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
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 6,
                      fit: FlexFit.loose,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            color: Colors.grey.shade800,
                          ),
                          Flexible(
                            child: ShippingCostComponent(
                              shippingCost: shippingPrice,
                              alignment: MainAxisAlignment.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.watch_later,
                            size: 18,
                            color: Colors.grey.shade800,
                          ),
                          Flexible(
                              child: Text(
                                  ' ${laundry.averageNumberOfDays} ${_i18n()["days"]}${(laundry.averageNumberOfDays > 1) ? "s" : ""}',
                                  style: Get.textTheme.bodyText2)),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.north_east_sharp,
                            size: 18,
                            color: Colors.grey.shade800,
                          ),
                          Flexible(
                              child: Text(
                                  '${laundry.getCheapestCategory.toPriceString()}/kg',
                                  style: Get.textTheme.bodyText2)),
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
