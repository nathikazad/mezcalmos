import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AssetServiceView/AssetServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyStoreTile.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/AgencyController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class AgencyStoreTab extends StatefulWidget {
  const AgencyStoreTab({super.key, required this.agencyController});

  final AgencyController agencyController;

  @override
  State<AgencyStoreTab> createState() => _AgencyStoreTabState();
}

class _AgencyStoreTabState extends State<AgencyStoreTab> {
  final AssetController assetController = Get.find<AssetController>();
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final agencyController = widget.agencyController;
    return Obx(
      () => agencyController.agencyStoreData.value == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        mezDbgPrint(
                          "agencyController ${agencyController.agencyStoreData.value?.profile}",
                        );
                        switch (
                            agencyController.agencyStoreData.value?.profile) {
                          case BusinessProfile.HomeRental:
                            final List<Rental>? rental =
                                agencyController.agencyStoreData.value?.rentals;
                            final String title = rental![index]
                                    .details
                                    .name[languageController.userLanguageKey] ??
                                rental[index]
                                    .details
                                    .name[Language.EN]
                                    .toString();
                            final double perDayPrice = rental[index]
                                .details
                                .cost[TimeUnit.PerDay]!
                                .toDouble();
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AssetCard(
                                title: title,
                                image: NetworkImage(
                                  rental[index].details.image?.first ??
                                      customImageUrl,
                                ),
                                onClick: () {
                                  AssetServiceView.navigate(
                                    serviceId:
                                        rental[index].details.id.toString(),
                                  );
                                },
                                needCustomSubtitle: false,
                                needLeadingImage: true,
                                needTrailingImage: false,
                                needDivider: false,
                                needBottomTitleText: false,
                                subtitleIconData: [
                                  aPriceCheck,
                                  aSingleBed,
                                  aHouseSliding,
                                ],
                                subtitleIconString: [
                                  perDayPrice.toStringAsFixed(2),
                                  "null",
                                  "null",
                                ],
                              ),
                            );
                          case BusinessProfile.SurfShop:
                            final List<Rental>? rental =
                                agencyController.agencyStoreData.value?.rentals;
                            final String title = rental![index]
                                    .details
                                    .name[languageController.userLanguageKey] ??
                                rental[index]
                                    .details
                                    .name[Language.EN]
                                    .toString();
                            final TimeUnit timeUnit =
                                rental[index].details.cost.keys.first;
                            final double perDayPrice = rental[index]
                                    .details
                                    .cost[timeUnit]
                                    ?.toDouble() ??
                                0.0;
                            final String serviceId =
                                rental[index].details.id.toString();
                            return AgencyStoreTile(
                              title: title,
                              image: NetworkImage(customImageUrl),
                              price: perDayPrice,
                              serviceId: serviceId,
                              unitTime: timeUnit.name
                                  .toLowerCase()
                                  .replaceAll("per", ""),
                            );
                          case BusinessProfile.VehicleRental:
                            final List<Rental>? rental =
                                agencyController.agencyStoreData.value?.rentals;
                            final String title = rental![index]
                                    .details
                                    .name[languageController.userLanguageKey] ??
                                rental[index]
                                    .details
                                    .name[Language.EN]
                                    .toString();
                            final double perDayPrice = rental[index]
                                .details
                                .cost[TimeUnit.PerDay]!
                                .toDouble();
                            final String serviceId =
                                rental[index].details.id.toString();
                            return AgencyStoreTile(
                              title: title,
                              image: NetworkImage(customImageUrl),
                              price: perDayPrice,
                              unitTime: "day",
                              serviceId: serviceId,
                            );
                          case BusinessProfile.WellnessClass:
                            return Offstage();
                          case BusinessProfile.Party:
                            // Wellness screen not going to navigate here thats why no UI needed
                            return Offstage();
                          case BusinessProfile.TourAgency:
                            // Volunteer screen not going to navigate here thats why no UI needed
                            return Offstage();
                          case BusinessProfile.Volunteer:
                            // Tour screen not going to navigate here thats why no UI needed
                            return Offstage();
                          case null:
                            // Activities screen not going to navigate here thats why no UI needed
                            return Offstage();
                          // case RentalViewEnum.Parties:
                          //   // Parties screen not going to navigate here thats why no UI needed
                          //   return Offstage();
                          // case RentalViewEnum.Dance:
                          //   // Dance screen not going to navigate here thats why no UI needed
                          //   return Offstage();
                          // case RentalViewEnum.GetTogether:
                          //   // GetTogether screen not going to navigate here thats why no UI needed
                          //   return Offstage();
                        }
                      },
                      childCount: agencyController
                              .agencyStoreData.value?.rentals?.length ??
                          2,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
