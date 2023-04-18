import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyListTile.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/AgencyController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/CartViewPage/cart_view_page.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/CustomAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/OrderViewPage/order_view_page.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/AssetDetailsController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';

class AssetServiceView extends StatefulWidget {
  const AssetServiceView({super.key});

  @override
  State<AssetServiceView> createState() => _AssetServiceViewState();

  static Future<void> navigate({required String serviceId}) {
    return MezRouter.toPath(RentalRoutes.assetServiceRoute, arguments: {
      "serviceId": serviceId,
    });
  }
}

class _AssetServiceViewState extends State<AssetServiceView> {
  final AssetDetailsController assetDetailsController =
      AssetDetailsController();
  final LanguageController languageController = Get.find<LanguageController>();
  late String serviceId;

  @override
  void initState() {
    super.initState();
    serviceId = MezRouter.bodyArguments!["serviceId"];
    assetDetailsController.getAssetById(serviceId);
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Obx(() {
        var rentalData = assetDetailsController.assetData.value;

        String getAppBarImage() {
          if (assetDetailsController.assetData.value?.details.image == null) {
            return customImageUrl;
          }
          if (assetDetailsController.assetData.value!.details.image!.isEmpty) {
            return customImageUrl;
          }
          mezDbgPrint(
              "getAppBarImage: ${assetDetailsController.assetData.value!.details.image}");
          return assetDetailsController.assetData.value!.details.image!.first;
        }

        List<Map<String, dynamic>> generateCosetData() {
          String removePerFromUnit(TimeUnit unit) {
            return unit.name.toLowerCase().replaceAll("per", "");
          }

          List<Map<String, dynamic>> data = [];
          var allCost = rentalData?.details.cost ?? {};
          allCost.map((key, value) {
            switch (key) {
              case TimeUnit.PerHour:
                data.add({
                  "cost": double.parse("$value"),
                  "unit": removePerFromUnit(key),
                  "icon": Icons.hourglass_top,
                });
                break;
              case TimeUnit.PerDay:
                data.add({
                  "cost": double.parse("$value"),
                  "unit": removePerFromUnit(key),
                  "icon": Icons.event,
                });
                break;
              case TimeUnit.PerWeek:
                data.add({
                  "cost": double.parse("$value"),
                  "unit": removePerFromUnit(key),
                  "icon": Icons.date_range,
                });
                break;
              case TimeUnit.PerMonth:
                data.add({
                  "cost": double.parse("$value"),
                  "unit": removePerFromUnit(key),
                  "icon": Icons.calendar_month,
                });
                break;
              case TimeUnit.Total:
                data.add({
                  "cost": double.parse("$value"),
                  "unit": removePerFromUnit(key),
                  "icon": Icons.equalizer,
                });
                break;
              case TimeUnit.PerPerson:
                data.add({
                  "cost": double.parse("$value"),
                  "unit": removePerFromUnit(key),
                  "icon": Icons.person,
                });
                break;
            }
            return MapEntry(key, value);
          });
          return data;
        }

        final String appBarImage = getAppBarImage();
        final List<Map<String, dynamic>> costData = generateCosetData();

        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  assetDetailsController.assetData.value == null
                      ? const SliverToBoxAdapter()
                      : CustomAppBar(
                          title: " ",
                          imageUrl: appBarImage,
                        ),
                  SliverPadding(
                    padding: EdgeInsets.all(8),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          // Title
                          Text(
                            rentalData?.details
                                    .name[languageController.userLanguageKey] ??
                                "",
                            style: style.headlineSmall,
                          ),
                          // Area + Bedrooms
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                blueText("null"),
                                smallCircle(),
                                blueText("null"),
                              ],
                            ),
                          ),
                          // Additional Info
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                blueText("null"),
                                smallCircle(),
                                blueText("null"),
                                smallCircle(),
                                blueText("null"),
                              ],
                            ),
                          ),
                          // Price Text +  Price Range Widget
                          title("Price"),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int index = 0;
                                    index < costData.length;
                                    index++)
                                  Column(
                                    children: [
                                      Icon(
                                        costData[index]["icon"],
                                      ),
                                      Text(
                                        "${(costData[index]["cost"] as double).toStringAsFixed(2)}/${costData[index]["unit"]}",
                                      ),
                                    ],
                                  )
                              ],
                            ),
                          ),
                          // Description title + text
                          title("Description"),
                          subTitle(
                            rentalData?.details.description?[
                                    languageController.userLanguageKey] ??
                                rentalData?.details.description![Language.EN]
                                    .toString() ??
                                "null",
                          ),
                          // Localtion title + text
                          title("Location"),
                          subTitle(
                            "null",
                            // "Rinconada, 71980 Puerto Escondido, Oaxaca, Mexico, South America",
                          ),
                          // Google map location view
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Placeholder(),
                          ),
                          // Agency title + agency list tile
                          title("Agency"),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: AgencyListTile(
                              titleText: rentalData?.business.name ?? "",
                              rating: 0.0,
                              reviewCount: 0,
                              onClick: () {},
                              iconsList: {
                                PaymentType.Card: true,
                              },
                              needMessageButton: true,
                              onMessageClick: () {},
                              imageUrl: customImageUrl,
                            ),
                          ),
                          // Online Booking not available text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: primaryBlueColor,
                                  ),
                                ),
                                Expanded(
                                  child: blueText(
                                    "Online booking is not available, you can message the business for any inquiries.",
                                  ),
                                ),
                              ],
                            ),
                          )
                          // // Start date title + picker
                          // title("Start Date"),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 8.0),
                          //   child: MezCard(
                          //     content: Text("Select Time"),
                          //   ),
                          // ),
                          // // Duration title + picker
                          // title("Duration"),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 8.0),
                          //   child: MezCard(
                          //     content: Text("Duration"),
                          //   ),
                          // ),
                          // // Payment method title + card details
                          // title("Payment Method"),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 8.0),
                          //   child: MezCard(
                          //     content: Text("Visa ************4470"),
                          //   ),
                          // ),
                          // // Notes
                          // title("Notes"),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 8.0),
                          //   child: MezCard(
                          //     contentPadding: EdgeInsets.all(4.0),
                          //     content: SizedBox(
                          //       height: MediaQuery.of(context).size.height * 0.1,
                          //       child: TextField(
                          //         decoration: InputDecoration(
                          //           contentPadding: EdgeInsets.zero,
                          //           hintText: "Write your notes here.",
                          //           fillColor: Colors.transparent,
                          //         ),
                          //         keyboardType: TextInputType.multiline,
                          //         textInputAction: TextInputAction.newline,
                          //         minLines: 1,
                          //         maxLines: 5,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // MezButton(
            //   label: "Add to cart",
            //   withGradient: true,
            //   borderRadius: 0,
            //   onClick: () async {
            //     await CartViewPage.navigate();
            //     return;
            //   },
            // ),
          ],
        );
      }),
    );
  }

  Widget title(String text) {
    final style = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        );
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget subTitle(String text) {
    final style = Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        );
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget blueText(String text) {
    final style = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: primaryBlueColor,
          fontWeight: FontWeight.w600,
        );
    return Text(
      text,
      style: style,
      maxLines: 3,
      textAlign: TextAlign.start,
    );
  }

  Widget smallCircle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(
        Icons.circle,
        color: primaryBlueColor,
        size: 8,
      ),
    );
  }
}
