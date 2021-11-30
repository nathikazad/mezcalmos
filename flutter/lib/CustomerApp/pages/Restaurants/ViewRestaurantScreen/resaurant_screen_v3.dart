import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

import '../../../router.dart';

class Restaurant_screenV3 extends StatefulWidget {
  Restaurant_screenV3({Key? key}) : super(key: key);

  @override
  _Restaurant_screenV3State createState() => _Restaurant_screenV3State();
}

class _Restaurant_screenV3State extends State<Restaurant_screenV3> {
  late String restaurantId;
  Restaurant? restaurant;
  LanguageController lang = Get.find<LanguageController>();
  RestaurantsInfoController controller =
      Get.put<RestaurantsInfoController>(RestaurantsInfoController());

  @override
  void initState() {
    this.restaurantId = Get.parameters['restaurantId']!;
    mezDbgPrint("param rest_id ===> $restaurantId");
    controller.getRestaurant(restaurantId).then((value) {
      mezDbgPrint("Fetched ===> $value");
      setState(() {
        restaurant = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (restaurant?.items == null)
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SafeArea(
            child: Scaffold(
              backgroundColor: Color.fromRGBO(237, 237, 237, 1),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      width: Get.width,
                      height: 270,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          child: Image.network(
                            restaurant!.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Text(
                        restaurant!.name.capitalizeFirstofEach,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet in vitae, suscipit tellus. Ut fringilla turpis neque mattis eu eu enim pellentesque. Lobortis diam mi risus at maecenas. Malesuada nibh et quis morbi varius. Sit ante enim tempor lacinia donec vulputate.",
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Menu",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _buildResturantItems(restaurant!.items, restaurantId),
                  ],
                ),
              ),
            ),
          );
  }
}

Widget _buildResturantItems(List<Item> items, String restaurantId) {
  return Column(
    children: items.fold<List<Widget>>(<Widget>[], (children, item) {
      children.add(RestaurantsListItemsOfComponent(
          item: item,
          function: () {
            Get.toNamed(
              getItemRoute(restaurantId, item.id!),
              arguments: {"mode": ViewItemScreenMode.AddItemMode},
            );
          }));
      children.add(SizedBox(
        height: 20,
      ));
      return children;
    }),
  );
}

class RestaurantsListItemsOfComponent extends StatefulWidget {
  RestaurantsListItemsOfComponent({Key? key, required this.item, this.function})
      : super(key: key);
  final Item item;
  final GestureTapCallback? function;

  @override
  _RestaurantsListItemsOfComponentState createState() =>
      _RestaurantsListItemsOfComponentState();
}

class _RestaurantsListItemsOfComponentState
    extends State<RestaurantsListItemsOfComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        height: 79,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              height: 63,
              width: 63,
              child: ClipOval(
                child: Container(
                  child: Image.network(
                    "${widget.item.image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${widget.item.name!.capitalizeFirstofEach}",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.item.cost} \$",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromRGBO(172, 89, 252, 1)),
                            ),
                          ),
                          TextSpan(
                            text: '/ person',
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(172, 89, 252, 0.8),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        widget.function!();
      },
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
