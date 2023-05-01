import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessRentalCost.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

class CustRentalView extends StatefulWidget {
  const CustRentalView({super.key});
  static Future<void> navigate({required int rentalId}) async {
    final String route =
        CustBusinessRoutes.custRentalRoute.replaceFirst(":id", "$rentalId");
    return MezRouter.toPath(route);
  }

  @override
  State<CustRentalView> createState() => _CustRentalViewState();
}

class _CustRentalViewState extends State<CustRentalView> {
  CustRentalViewController viewController = CustRentalViewController();
  int? rentalId;
  @override
  void initState() {
    rentalId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init rental view with id => $rentalId");
    if (rentalId != null) {
      viewController.fetchData(rentalId: rentalId!);
    } else {
      showErrorSnackBar(errorText: "Error: Rental ID $rentalId not found");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (viewController.rental != null) {
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.rental!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewController.rental!.details.name[userLanguage] ??
                            _i18n()['noTitle'],
                        style: context.textTheme.displayMedium,
                      ),
                      _CustBusinessAdditionalData(
                        rental: viewController.rental!,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _i18n()['price'],
                        style: context.textTheme.bodyLarge,
                      ),
                      CustBusinessRentalCost(
                        cost: viewController.rental!.details.cost,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        _i18n()['description'],
                        style: context.textTheme.bodyLarge,
                      ),
                      Text(
                        viewController
                                .rental!.details.description?[userLanguage] ??
                            _i18n()['noDescription'],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      viewController.rental!.gpsLocation == null
                          ? const SizedBox.shrink()
                          : ServiceLocationCard(
                              height: 20.h,
                              location: MezLocation(
                                viewController.rental!.gpsLocation?.address ??
                                    "",
                                MezLocation.buildLocationData(
                                  viewController.rental!.gpsLocation!.lat
                                      .toDouble(),
                                  viewController.rental!.gpsLocation!.lng
                                      .toDouble(),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        _i18n()['store'],
                        style: context.textTheme.bodyLarge,
                      ),
                      CustBusinessMessageCard(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
                        business: viewController.rental!.business,
                        offeringName: viewController.rental!.details.name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustBusinessNoOrderBanner(),
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return CustCircularLoader();
        }
      }),
    );
  }
}

class _CustBusinessAdditionalData extends StatelessWidget {
  const _CustBusinessAdditionalData({
    required this.rental,
  });

  final RentalWithBusinessCard? rental;

  @override
  Widget build(BuildContext context) {
    String wholeAdditionalParamString() {
      final String circle = "•";

      final Map<String, String> additionalValues = rental
              ?.details.additionalParameters
              ?.map((key, value) => MapEntry(key, value.toString())) ??
          {};

      final StringBuffer wholeString = StringBuffer();
      additionalValues.map(
        (key, value) {
          wholeString.write("$circle $value ");
          return MapEntry(key, value);
        },
      );
      return wholeString.toString();
    }

    final String addtionalData = wholeAdditionalParamString();
    return addtionalData.isEmpty
        ? const SizedBox.shrink()
        : Text(
            addtionalData,
            style: context.textTheme.bodyLarge!.copyWith(
              color: primaryBlueColor,
              fontWeight: FontWeight.w600,
            ),
          );
  }
}
