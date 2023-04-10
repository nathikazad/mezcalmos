import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Courrier/CustCourierServiceView/controllers/CustCourierViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Courrier/CustRequestCourrierView/CustRequestCourierView.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/DialogRequiredSignIn.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSliverAppbar.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["courrier"]["CustCourierServiceView"];

class CustCourierServiceView extends StatefulWidget {
  const CustCourierServiceView({super.key});
  static Future<void> navigate({required int companyId}) {
    return MezRouter.toPath(CourierRoutes.kCourierServiceRoute
        .replaceFirst(":companyId", "$companyId"));
  }

  @override
  State<CustCourierServiceView> createState() => _CustCourierServiceViewState();
}

class _CustCourierServiceViewState extends State<CustCourierServiceView> {
  CustCourierServiceViewController _viewController =
      CustCourierServiceViewController();
  int? companyId;
  @override
  void initState() {
    companyId = int.tryParse(MezRouter.urlArguments['companyId'].toString());
    if (companyId != null) {
      _viewController.init(companyId: companyId!);
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MezButton(
        withGradient: true,
        borderRadius: 0,
        height: 75,
        label: '${_i18n()["orderNow"]}',
        onClick: () async {
          if (Get.find<AuthController>().isUserSignedIn) {
            await CustRequestCourierView.navigate(
                _viewController.company.info.hasuraId);
          } else {
            dialogRequiredSignIn();
          }
        },
      ),
      body: Obx(() {
        if (_viewController.hasData) {
          // view
          return CustomScrollView(
            slivers: [
              MezSliverAppBar(
                image: _viewController.company.info.image,
                title: _viewController.company.info.name,
                ordersRoute: CustomerRoutes.customerOrdersRoute,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // __headerButtons(),
                      Row(
                        children: [
                          RawChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              label: Text(
                                '${_i18n()["minimumCost"]} ${_viewController.company.deliveryCost?.minimumCost.toPriceString()}',
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          RawChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              label: Text(
                                '${_viewController.company.deliveryCost?.costPerKm.toPriceString()}/km',
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      ),
                      if (_viewController
                              .company.info.description?[userLanguage] !=
                          null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${_i18n()['description']}',
                              style: context.txt.bodyLarge,
                            ),
                            Text(_viewController
                                .company.info.description![userLanguage]!),
                          ],
                        ),
                      ServiceLocationCard(
                          location: _viewController.company.info.location),
                      /*OrderPaymentMethod(
                    stripeOrderPaymentInfo:
                        null,
                    paymentType: ,
                  ),*/
                      if (_viewController.company.showReviews)
                        _reviewsList(context)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                ),
              )
            ],
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  Widget _reviewsList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              '${_i18n()["reviews"]}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.star,
              color: primaryBlueColor,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              _viewController.company.rate!.toStringAsFixed(1),
              style: context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text(
                "(${_viewController.company.reviews.length})",
                style: context.txt.titleSmall
                    ?.copyWith(color: offLightShadeGreyColor),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Ink(
                color: Colors.transparent,
                padding: const EdgeInsets.all(10),
                child: Text(
                  '${_i18n()["viewAll"]}',
                  style:
                      context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
                ),
              ),
            )
          ],
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _viewController.company.reviews.length,
            itemBuilder: (BuildContext ctx, int index) {
              return ReviewCard(
                review: _viewController.company.reviews[index],
                showUserImage: false,
              );
            }),
      ],
    );
  }

  Widget __headerButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: RawChip(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shape: StadiumBorder(side: BorderSide(color: primaryBlueColor)),
            label: InkWell(
              onTap: () {},
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.message_rounded,
                            color: primaryBlueColor,
                          )),
                      TextSpan(
                        text: '${_i18n()["chatWithUs"]}',
                        style: context.txt.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: RawChip(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shape: StadiumBorder(side: BorderSide(color: primaryBlueColor)),
            label: InkWell(
              onTap: () {},
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.phone,
                            color: primaryBlueColor,
                          )),
                      TextSpan(
                        text: '${_i18n()["contactUs"]}',
                        style: context.txt.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
