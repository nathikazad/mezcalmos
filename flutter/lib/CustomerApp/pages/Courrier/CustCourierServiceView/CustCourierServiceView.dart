import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustCourierServiceView/controllers/CustCourierViewController.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSliverAppbar.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';

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
    companyId = int.parse(MezRouter.urlArguments['companyId'].toString());
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
        label: 'Order now',
        onClick: () async {},
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
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      __headerButtons(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RawChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              label: Text(
                                'Minimum cost \$50',
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          RawChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              label: Text(
                                '\$10/km',
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      ),
                      if (_viewController
                              .company.info.description?[userLanguage] !=
                          null)
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Description',
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
              'Reviews', //'${_i18n()["reviews"]}',
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
                  "View all",
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
      children: [
        Flexible(
          child: MezButton(
            label: "Chat with us",
            height: 32.5,
            backgroundColor: Colors.white,
            textColor: primaryBlueColor,
            onClick: () async {},
            icon: Icons.message,
            borderRadius: 20,
            border: Border.all(width: 1, color: primaryBlueColor),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Flexible(
          child: MezButton(
            label: "Contact us",
            height: 32.5,
            onClick: () async {},
            backgroundColor: Colors.white,
            textColor: primaryBlueColor,
            icon: Icons.phone,
            borderRadius: 20,
            border: Border.all(width: 1, color: primaryBlueColor),
          ),
        ),
      ],
    );
  }
}
