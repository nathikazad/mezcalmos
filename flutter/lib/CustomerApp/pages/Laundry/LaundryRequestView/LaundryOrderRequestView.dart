import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/models/LaundryRequest.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart' as sharedRoute;
import 'package:sizer/sizer.dart';

class LaundryOrderRequestView extends StatefulWidget {
  const LaundryOrderRequestView({Key? key}) : super(key: key);

  @override
  State<LaundryOrderRequestView> createState() =>
      _LaundryOrderRequestViewState();
}

class _LaundryOrderRequestViewState extends State<LaundryOrderRequestView> {
  /// TextEditingController
  TextEditingController _orderNote = TextEditingController();

  /// LocationPickerController
  final LocationPickerController locationPickerController =
      LocationPickerController();

  /// AuthController
  final AuthController authController = Get.find<AuthController>();

  /// LaundryController
  LaundryController laundryController = Get.find<LaundryController>();

  /// LanguageController
  /// CustomerApp.pages.Laundry.LaundryRequestView.LaundryOrderRequestView
  /// CustomerApp.pages.Laundry.LaundriesListView.LaundryRequestView.LaundryOrderRequestView
  dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
      ['pages']['Laundry']['LaundryRequestView']['LaundryOrderRequestView'];

  late Laundry selectedLaundry;

  /// Customer's Location
  Location? customerLoc;

  /// RxBool clicked
  RxBool clicked = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    selectedLaundry = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomerAppBar(
          title: selectedLaundry.info.name,
        ),
        //  bottomNavigationBar: bottomButton(context),
        body: Column(children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                        width: double.infinity,
                        height: 20.h,
                        fit: BoxFit.cover,
                        imageUrl: selectedLaundry.info.image),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      selectedLaundry.info.name,
                      style: Get.textTheme.headline3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.place,
                            size: 20,
                            color: primaryBlueColor,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Flexible(
                            child: Text(
                          selectedLaundry.info.location.address,
                          maxLines: 2,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      //  margin: const EdgeInsets.all(8),
                      child: Text(
                        '${_i18n()["deliveryLocation"]} :',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Card(
                        child: authController.user != null
                            ? DropDownLocationList(
                                bgColor: secondaryLightBlueColor,
                                passedInLocation: customerLoc,
                                onValueChangeCallback: ({Location? location}) {
                                  setState(() {
                                    customerLoc = location;
                                  });
                                },
                              )
                            : pickFromMapComponent(context),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    _orderNoteComponent(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomButton(context)
        ]));
  }

  Widget _orderNoteComponent() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_i18n()["notes"], style: Theme.of(context).textTheme.headline3),
          const SizedBox(height: 10),
          TextField(
            controller: _orderNote,
            maxLines: 5,
            minLines: 3,
            decoration: InputDecoration(
              hintText: "${_i18n()["noteHint"]}",
              hintStyle: Get.textTheme.bodyText2,
              filled: true,
              fillColor: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }

  InkWell pickFromMapComponent(BuildContext context) {
    return InkWell(
      onTap: () async {
        // ignore: prefer_final_locals
        Location? currentLoc =
            await Get.toNamed(kPickLocationNotAuth) as Location?;
        if (currentLoc != null) {
          setState(() {
            customerLoc = currentLoc;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: (customerLoc == null)
                ? Colors.red
                : Theme.of(context).primaryColorLight,
          ),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.place_rounded,
              color: Theme.of(context).primaryColorLight,
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                customerLoc?.address ?? _i18n()['pickLocation'],
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx bottomButton(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,

        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.purple, primaryBlueColor])),
        //  padding: const EdgeInsets.all(5),
        child: (authController.user != null)
            ? makeOrderButton(context)
            : TextButton(
                onPressed: () async {
                  Get.find<AuthController>()
                      .preserveNavigationStackAfterSignIn = true;
                  await Get.toNamed<void>(sharedRoute.kSignInRouteOptional);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    _i18n()["signInToMakeOrder"],
                  ),
                ),
              ),
      ),
    );
  }

  Widget makeOrderButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor:
            (customerLoc != null) ? Colors.transparent : Colors.grey,
      ),
      onPressed: (customerLoc == null)
          ? null
          : () async {
              await _createLaundryOrder();
            },
      child: (clicked.value)
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _i18n()['orderNow'],
              ),
            ),
    );
  }

  Future<void> _createLaundryOrder() async {
    mezDbgPrint("GotRoute !!!!!!!");

    clicked.value = true;
    final LaundryRequest _laundryRequest =
        LaundryRequest(laundryId: selectedLaundry.info.id);
    // get route info first
    await MapHelper.getDurationAndDistance(
            selectedLaundry.info.location, customerLoc!)
        .then((MapHelper.Route? route) {
      mezDbgPrint("GotRoute !!!!!!!");
      if (route != null) {
        _laundryRequest.routeInformation = MapHelper.RouteInformation(
          polyline: route.encodedPolyLine,
          distance: route.distance,
          duration: route.duration,
        );
      }

      _laundryRequest.laundryId = selectedLaundry.info.id;
      _laundryRequest.from = selectedLaundry.info.location;
      _laundryRequest.to = customerLoc;
      _laundryRequest.notes = _orderNote.text;
      _laundryRequest.paymentType = PaymentType.Cash;

      // Since routeInformation is nullable, we have to handle it in other apps.
      _sendLaundryRequest(_laundryRequest);
    });
  }

  void _sendLaundryRequest(LaundryRequest request) {
    laundryController.requestLaundryService(request).then(
      (ServerResponse response) {
        mezDbgPrint("rrrrrrrrrrrrrrrrrrrr ===> ${response.errorMessage}");

        if (response.data['orderId'] != null) {
          sharedRoute.popEverythingAndNavigateTo(
            getLaundyOrderRoute(
              response.data['orderId'],
            ),
          );
        } else {
          Get.snackbar("${_i18n()["error"]}", "${_i18n()["errorText"]}");
        }
      },
    ).whenComplete(() {
      clicked.value = false;
    }).onError((Object? error, StackTrace stackTrace) {
      mezDbgPrint(
          "Erorrrr ---------<<<<<<<<<<<<<<<<<<<<<<<<<<<<<LAUNDRYREQ ============== $error");
      mezDbgPrint(
          "Erorrrr ---------<<<<<<<<<<<<<<<<<<<<<<<<<<<<<LAUNDRYREQ ============== $stackTrace");
    });
  }
}
