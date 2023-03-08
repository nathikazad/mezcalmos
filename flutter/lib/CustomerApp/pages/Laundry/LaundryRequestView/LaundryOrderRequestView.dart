import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/CustLaundryOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryRequestView/controllers/CustLaundryOrderRequestViewController.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/pickLocationRoutes.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Laundry']['LaundryRequestView']['LaundryOrderRequestView'];

class CustLaundryOrderRequestView extends StatefulWidget {
  const CustLaundryOrderRequestView({Key? key}) : super(key: key);

  static Future<void> navigate({required int laundryId}) {
    return MezRouter.toPath<void>(LaundryRoutes.laundryOrderRequestRoute
        .replaceAll(":laundryId", laundryId.toString()));
  }

  @override
  State<CustLaundryOrderRequestView> createState() =>
      _CustLaundryOrderRequestViewState();
}

class _CustLaundryOrderRequestViewState
    extends State<CustLaundryOrderRequestView> {
  CustLaundryOrderRequestViewController viewController =
      CustLaundryOrderRequestViewController();

  late final Laundry? _laundry;

  @override
  void initState() {
    final int? laundryId =
        int.tryParse(MezRouter.urlArguments["laundryId"].toString());

    if (laundryId != null) {
      Future(() async {
        _laundry = await get_laundry_store_by_id(id: laundryId);
        await viewController.init(laundry: _laundry!);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MezcalmosAppBar(
          AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          titleWidget: Obx(() => Text(
                viewController.laundry.value?.info.name ?? "",
                style: Get.textTheme.headline3,
              )),
        ),
        body: Obx(
          () {
            if (viewController.laundry.value != null) {
              return Column(children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                                width: double.infinity,
                                height: 20.h,
                                fit: BoxFit.cover,
                                imageUrl:
                                    viewController.laundry.value!.info.image),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(viewController.laundry.value!.info.name,
                              style: Get.textTheme.headlineSmall),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                child: Icon(
                                  Icons.place,
                                  size: 18,
                                  color: primaryBlueColor,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Flexible(
                                child: Text(
                                  viewController
                                      .laundry.value!.info.location.address,
                                  maxLines: 2,
                                  style: Get.textTheme.titleSmall,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Text(
                              '${_i18n()["deliveryLocation"]}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Obx(
                            () => viewController.authController.user != null
                                ? DropDownLocationList(
                                    onValueChangeCallback: (
                                        {MezLocation? location}) {
                                      if (location != null &&
                                          location.isValidLocation()) {
                                        viewController.switchLocation(location);

                                        // ignore: unawaited_futures
                                      }
                                    },
                                    bgColor: Colors.white,
                                    checkDistance: true,
                                    serviceProviderLocation: viewController
                                        .laundry.value!.info.location,
                                  )
                                : pickFromMapComponent(context),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _orderNoteComponent(),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    child: Text(
                                      "${_i18n()["summaryText"]}",
                                      style: Get.textTheme.bodyText1,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                    padding: EdgeInsets.only(
                                      bottom: 4,
                                    ),
                                    width: Get.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                                "${_i18n()["deliveryCost"]}",
                                                style: Get.textTheme.bodyText2),
                                          ),
                                        ),
                                        (viewController.shippingCost.value !=
                                                null)
                                            ? Text(
                                                "${(viewController.shippingCost.value! * 2).toPriceString()}",
                                                style: Get.textTheme.bodyText2,
                                              )
                                            : Text(
                                                "_",
                                                style: Get.textTheme.bodyText2,
                                              ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 8,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                bottomButton(context)
              ]);
            } else {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget _orderNoteComponent() {
    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_i18n()["notes"], style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
            height: 8,
          ),
          Card(
            child: TextField(
              style: Get.textTheme.titleMedium?.copyWith(
                color: blackColor,
              ),
              controller: viewController.orderNote,
              maxLines: 5,
              minLines: 3,
              decoration: InputDecoration(
                hintText: "${_i18n()["noteHint"]}",
                hintStyle:
                    Get.textTheme.titleMedium?.copyWith(color: blackColor),
                filled: true,
                fillColor: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget pickFromMapComponent(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          final MezLocation? currentLoc =
              await MezRouter.toNamed(PickLocationRoutes.pickLocationNotAuth)
                  as MezLocation?;
          if (currentLoc != null) {
            viewController.switchLocation(currentLoc);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.place_rounded,
                color: primaryBlueColor,
                //size: 14,
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  viewController.customerLoc.value?.address ??
                      "${_i18n()['pickLocation']}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Obx bottomButton(BuildContext context) {
    return Obx(
      () => MezButton(
        borderRadius: 0,
        height: 75,
        label: viewController.isUserSignedIn
            ? "Order now"
            : "${_i18n()["signInToMakeOrder"]}",
        enabled: viewController.isUserSignedIn ? viewController.canOrder : true,
        onClick: () async {
          if (viewController.isUserSignedIn) {
            final num? res = await viewController.createLaundryOrder();
            if (res != null) {
              MezRouter.popEverythingAndNavigateTo(
                  CustLaundryOrderView.navigate(orderId: res.toInt()));
            }
          } else {
            Get.find<AuthController>().preserveNavigationStackAfterSignIn =
                true;
            await MezRouter.toNamed<void>(SharedRoutes.kSignInRouteOptional);
          }
        },
      ),
    );
  }

  Widget _laundryCostCard({required LaundryCostLineItem item}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              item.name[userLanguage]?.toString().inCaps ?? "",
              style: Get.textTheme.bodyMedium,
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "${item.cost.toPriceString()}/KG",
            style: Get.textTheme.bodyLarge?.copyWith(color: primaryBlueColor),
          )
        ],
      ),
    );
  }
}
