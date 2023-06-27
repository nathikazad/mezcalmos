import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessInquryBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

class CustRealestateView extends StatefulWidget {
  const CustRealestateView({super.key});
  static Future<void> navigate({
    required int realestateId,
  }) async {
    final String route = CustBusinessRoutes.custRealestateViewRoute
        .replaceFirst(":id", "$realestateId");
    return MezRouter.toPath(route);
  }

  @override
  State<CustRealestateView> createState() => _CustRealestateViewState();
}

class _CustRealestateViewState extends State<CustRealestateView> {
  CustRealestateViewController viewController = CustRealestateViewController();
  int? rentalId;
  @override
  void initState() {
    rentalId = int.tryParse(MezRouter.urlArguments["id"].toString());

    if (rentalId != null) {
      viewController.init(rentalId: rentalId!);
      // viewController.fetchData(rentalId: rentalId!);
    } else {
      showErrorSnackBar(
          errorText: "Error: Real estates ID $rentalId not found");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (viewController.realEstate != null) {
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.realEstate!.details),
              SliverToBoxAdapter(
                child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewController.realEstate!.details.name
                                .getTranslation(userLanguage)!
                                .inCaps,
                            style: context.textTheme.displayMedium,
                          ),
                          _CustBusinessAdditionalData(
                            homeRental: viewController.realEstate!,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            _i18n()['price'],
                            style: context.textTheme.bodyLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.hourglass_bottom),
                              Text(
                                  '\$${viewController.realEstate!.details.cost.values.first}')
                            ],
                          ),
                          _description(context),
                          if (viewController.realEstate?.location.location !=
                              null)
                            ServiceLocationCard(
                              height: 20.h,
                              location: MezLocation(
                                viewController
                                    .realEstate!.location.location.address,
                                MezLocation.buildLocationData(
                                  viewController
                                      .realEstate!.location.location.lat
                                      .toDouble(),
                                  viewController
                                      .realEstate!.location.location.lng
                                      .toDouble(),
                                ),
                              ),
                            ),
                          CustBusinessMessageCard(
                            margin: EdgeInsets.only(top: 15),
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            business: viewController.realEstate!.business,
                            offering: viewController.realEstate!.details,
                          ),
                          CustBusinessInquryBanner(),
                        ])),
              )
            ],
          );
        } else {
          return CustCircularLoader();
        }
      }),
    );
  }

  Column _description(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          _i18n()['description'],
          style: context.textTheme.bodyLarge,
        ),
        Text(
          viewController.realEstate!.details.description
                  ?.getTranslation(userLanguage)
                  ?.trim() ??
              _i18n()['noDescription'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _CustBusinessAdditionalData extends StatelessWidget {
  const _CustBusinessAdditionalData({
    required this.homeRental,
  });

  final HomeWithBusinessCard? homeRental;

  @override
  Widget build(BuildContext context) {
    String wholeAdditionalParamString() {
      final String circle = "•";
      final Map<String, String> additionalValues = {
        'bedRooms': '${homeRental?.bedrooms ?? 0} ${_i18n()['bedrooms']}',
        'bathRooms': '${homeRental?.bathrooms ?? 0} ${_i18n()['bathrooms']}',
        'houseType':
            '${_i18n()[homeRental?.category1.name.toLowerCase()] ?? ''}',
      };
      final Map<String, String> moreAdditionalValues = homeRental
              ?.details.additionalParameters
              ?.map((key, value) => MapEntry(key, value.toString())) ??
          {};

      additionalValues.addAll(
        moreAdditionalValues,
      );
      final StringBuffer wholeString = StringBuffer();
      additionalValues.map(
        (key, value) {
          if (additionalValues.keys.toList().indexOf(key) == 0) {
            wholeString.write("$value ");
          } else {
            wholeString.write("$circle $value ");
          }
          return MapEntry(key, value);
        },
      );
      return wholeString.toString();
    }

    return Text(
      wholeAdditionalParamString(),
      style: context.textTheme.bodyLarge!.copyWith(
        color: primaryBlueColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
