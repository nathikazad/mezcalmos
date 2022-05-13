import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/components/RequestTaxiScreenWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/controllers/RequestTaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/LocationSearchBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiReqBottomBar.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSlider.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

import 'package:intl/intl.dart';

enum FieldType { Date, Time, Neither }

class RequestTaxiScreen extends StatefulWidget {
  const RequestTaxiScreen({Key? key}) : super(key: key);

  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  /// RequestTaxiController
  final RequestTaxiController viewController = RequestTaxiController();

  /// RequestTaxiScreenWidgets
  late final RequestTaxiScreenWidgets viewWidgets;
  bool lockOnTaxiRequest = false;
  Rx<FieldType> type = FieldType.Neither.obs;

  final AnimatedSliderController _sliderController =
      AnimatedSliderController(maxSliderHeight: 52.h);

  late RxString _selectedDate;
  late RxString _selectedTime;

  @override
  void initState() {
    // If from or to not picked :
    //    - User is free to Wonder and move around the map.
    // If from and to are picked:
    //    - We Fit All everything.
    final DateTime _dt = DateTime.now().add(Duration(hours: 1));
    _selectedDate = DateFormat('MM / d / y').format(_dt).obs;
    _selectedTime = DateFormat('h:mm a').format(_dt).obs;
    customMapLock();
    viewWidgets =
        RequestTaxiScreenWidgets(requestTaxiController: viewController);

    if (Get.arguments != null) {
      // we re-create the TaxiRequest passed along args
      viewController.initiateTaxiOrderReCreation(Get.arguments as TaxiRequest);
    } else {
      // when no args passed we simply initialte the view and map with current user's loc.
      viewController.initMapAndStartFetchingOnlineDrivers();
    }
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: () => Get.back<void>(),
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => Container(
          color: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: LocationPicker(

                    /// [onSuccessSignIn] THIS WILL GETS EXECUTED IF USER GOT SIGNED IN SUCCESSFULY
                    // AFTER HE CREATED HIS TAXI REQUESTED WHILE HE WAS SIGNEDOUT
                    onSuccessSignIn:
                        viewController.onSuccessSignInUpdateUserMarker,
                    locationPickerMapController:
                        viewController.locationPickerController,
                    notifyParentOfLocationFinalized:
                        viewController.updateModelAndMaybeCalculateRoute,
                    notifyParentOfConfirm: (Location? _) async {
                      if (getAppLaunchMode() == AppLaunchMode.prod &&
                          Get.find<AuthController>().fireAuthUser?.uid ==
                              testUserIdInProd) {
                        MezSnackbar("Oops",
                            "This prod version is live and running , we can't let you do that :( !");
                      } else if (!lockOnTaxiRequest) {
                        // lock to avoid the user Fast button taps aka fast-taps .
                        lockOnTaxiRequest = true;
                        final bool res = await viewController.requestTaxi();
                        if (!res) {
                          lockOnTaxiRequest = false;
                        }
                      }
                    }),
              ),
              // --- <>
              LocationSearchBar(
                request: viewController.taxiRequest.value,
                locationSearchBarController:
                    viewController.locationSearchBarController,
                onClear: () {
                  // we set that back to false
                  viewController.locationPickerController.periodicRerendering
                      .value = false;
                },
                newLocationChosenEvent:
                    viewController.updateModelAndHandoffToLocationPicker,
              ),
              if (viewController.taxiRequest.value.isFromToSet())
                Positioned(
                  top: 60,
                  left: 10,
                  right: 10,
                  child: InkWell(
                    onTap: _scheduleClick,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0xAFAFAF).withOpacity(0.25),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(3, 3),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9.8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10),
                          Icon(
                            Icons.watch_later,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Now",
                            softWrap: false,
                            overflow: TextOverflow.visible,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 13,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              if (viewController.onlineDrivers.isNotEmpty &&
                  viewController.taxiRequest.value.isFromToSet())
                Positioned(
                  bottom: 140,
                  right: 15,
                  child: Container(
                    width: 76,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(2.47, 2.47),
                          blurRadius: 8.23,
                          color: Color.fromRGBO(175, 175, 175, 0.25),
                        )
                      ],
                      // border: Border.all(
                      //     width: 1, color: Theme.of(context).scaffoldBackgroundColor),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(33, 145, 37, 1),
                          ),
                        ),
                        Text(
                          viewController.onlineDrivers.length.toString(),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.local_taxi,
                          size: 21,
                        )
                      ],
                    ),
                  ),
                ),
              // from , to
              viewController.pickedFromTo.value
                  ? TaxiReqBottomBar(
                      taxiRequest: viewController.taxiRequest,
                      viewController: viewController)
                  : SizedBox(),
              if (viewController.pickedFromTo.value) viewWidgets.getToolTip(),
              if (viewController.pickedFromTo.value)
                AnimatedSlider(
                  isPositionedCoordinates:
                      AnimatedSliderCoordinates(left: 0, right: 0, bottom: 0),
                  animatedSliderController: _sliderController,
                  child: getRightContent(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> getDatePicker({bool isTime = false}) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(hours: 24),
        ),
        builder: (ctx, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Color.fromRGBO(103, 121, 254, 1),
              // accentColor: Color.fromRGBO(103, 121, 254, 1),
              colorScheme: ColorScheme.light(
                primary: Color.fromRGBO(103, 121, 254, 1),
              ),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: Transform.scale(scale: .9, child: child!),
          );
        });
  }

  Future<TimeOfDay?> getTimePicker() {
    final theme = ThemeData.light().copyWith(
      timePickerTheme: TimePickerThemeData(
        // backgroundColor: Colors.green.shade200,
        hourMinuteColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? Color.fromRGBO(103, 121, 254, 1)
              : Color.fromRGBO(236, 236, 236, 1),
        ),
        hourMinuteTextColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? Color.fromRGBO(236, 236, 236, 1)
              : Colors.black,
        ),
        dayPeriodColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? Color.fromRGBO(103, 121, 254, 1)
              : Color.fromRGBO(236, 236, 236, 1),
        ),
        dayPeriodTextColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? Colors.white
              : Colors.black,
        ),
        dialHandColor: Color.fromRGBO(103, 121, 254, 1),
        dialBackgroundColor: Color.fromRGBO(236, 236, 236, 1),
      ),
      textTheme: TextTheme(
        overline: TextStyle(
          color: Color.fromRGBO(120, 120, 120, 1),
          fontFamily: 'Nunito',
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateColor.resolveWith(
            (states) => Color.fromRGBO(103, 121, 254, 1),
          ),
        ),
      ),
    );
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext ctx, Widget? child) {
          return Theme(
            data: theme,
            child: Transform.scale(scale: .9, child: child!),
          );
        });
  }

  void customMapLock() {
    viewController.locationPickerController.myLocationButtonEnabled.value =
        false;
    viewController.locationPickerController.recenterButtonEnabled.value = false;
  }

  void _scheduleClick() {
    mezDbgPrint("Cliccccked slide up!");
    _sliderController.slideUp();
    setState(() {});
  }

  Widget getRightContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "Prebook your trip",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Set the schedule time so the order will start to show to drivers in that particular time",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                children: <Widget>[
                  Text(
                    "From: ",
                    style: TextStyle(
                      height: 1.22,
                      fontFamily: 'Montserrat',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    viewController.taxiRequest.value.from!.address,
                    maxLines: 1,
                    style: TextStyle(
                      height: 1.22,
                      fontFamily: 'Montserrat',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  children: <Widget>[
                    Text(
                      "To: ",
                      style: TextStyle(
                        height: 1.22,
                        fontFamily: 'Montserrat',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      viewController.taxiRequest.value.to!.address,
                      style: TextStyle(
                        height: 1.22,
                        fontFamily: 'Montserrat',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 29,
            ),
            // date button
            InkWell(
              onTap: () async {
                DateTime? dtime = await getDatePicker();
                if (dtime != null)
                  _selectedDate.value = DateFormat('MM / d / y').format(dtime);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0xAFAFAF).withOpacity(0.25),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(3, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9.8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text(
                      _selectedDate.value,
                      softWrap: false,
                      overflow: TextOverflow.visible,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 13,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 17),
            // time button
            InkWell(
              onTap: () async {
                TimeOfDay? dtime = await getTimePicker();
                if (dtime != null) _selectedTime.value = dtime.format(context);
                // " ${dtime.hour}: ${dtime.minute} ${dtime.}"; //  DateFormat('h:mm a').format(dtime);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0xAFAFAF).withOpacity(0.25),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(3, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9.8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Icon(
                      Icons.watch_later,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text(
                      _selectedTime.value,
                      softWrap: false,
                      overflow: TextOverflow.visible,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 13,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 9),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '*You can only prebook 24 hours in advance.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 30),
            CustomButton(
              buttonColor: <Color>[
                Color.fromARGB(255, 172, 89, 252),
                Color.fromARGB(255, 108, 119, 254),
              ],
              height: 48,
              onTap: () => mezDbgPrint("InkWell tapped!"),
              textAlignement: Alignment.center,
              text: Text(
                "Confirm",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 15),
            CustomButton(
              buttonColor: <Color>[Colors.red.shade100],
              height: 48,
              onTap: () {
                _sliderController.slideDown();
                setState(() {});
              },
              textAlignement: Alignment.center,
              text: Text(
                "Cancel",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.buttonColor,
    required this.onTap,
    required this.height,
    required this.text,
    this.textAlignement = Alignment.center,
    Key? key,
  }) : super(key: key);
  final Text text;
  final void Function() onTap;
  final List<Color> buttonColor;
  final double height;
  final Alignment textAlignement;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 48,
        decoration: BoxDecoration(
          color: buttonColor.length == 1 ? buttonColor.first : null,
          borderRadius: BorderRadius.circular(9.8),
          gradient: buttonColor.length > 1
              ? LinearGradient(colors: buttonColor)
              : null,
        ),
        child: Align(alignment: textAlignement, child: text),
      ),
    );
  }
}
