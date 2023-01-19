import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/old/customerApp/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/controllers/RequestTaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RidePriceControllHint.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/CustomFlatButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/MezToolTip.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/widgets/OrderTimeBar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Taxi']['RequestTaxiScreen'];

class RequestTaxiScreenWidgets {
  final RequestTaxiController requestTaxiController;

  RequestTaxiScreenWidgets({
    required this.requestTaxiController,
  });

  /// the hints  [MezToolTipHint] that are related to this view !
  List<MezToolTipHint> getHints() {
    return <MezToolTipHint>[
      MezToolTipHint(
        hintWidget: RidePriceControllHint(
          hintText: _i18n()['taxiRequestPriceTooltip'],
        ),
        left: 80.1,
        bottom: 150.5,
        bodyLeft: 20,
        bodyRight: 20,
        bodyBottom: 150.5,
      ),
    ];
  }

  Widget getToolTip() {
    if (requestTaxiController.controller.numOfTimesToolTipShownToUser() <=
        nMaxTimesToShowTTipsOnCustomerApp)
      return MezToolTip(
        hintWidgetsList: getHints(),
        applyCacheIncrementing: false,
      );
    else
      return SizedBox();
  }

  Widget topTimeBar({required void Function() onTap}) {
    return Positioned(
      top: 101,
      left: 10,
      right: 10,
      child: InkWell(
        onTap: onTap,
        child: OrderTimeTopBar(
          withArrowIcon: true,
          barText: requestTaxiController.taxiRequest.value.scheduledTime != null
              ? DateFormat('EEEE dd / MM / y').format(
                    requestTaxiController.taxiRequest.value.scheduledTime!,
                  ) +
                  ' at ' +
                  DateFormat('hh:mm a').format(
                    requestTaxiController.taxiRequest.value.scheduledTime!,
                  )
              : 'Schedule for later',
        ),
      ),
    );
  }

  Widget getScheduleTimeBottomSheet(
    BuildContext context, {
    required void Function() onCancelTap,
    required void Function() onConfirmTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
              Row(
                children: <Widget>[
                  Text(
                    "From: ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      requestTaxiController.taxiRequest.value.from!.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "To: ",
                    style: TextStyle(
                      // height: 1.22,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      requestTaxiController.taxiRequest.value.to!.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        // height: 1.22,
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 29,
              ),
              // date button
              InkWell(
                onTap: () async {
                  final DateTime? _dtime = await getDatePicker(
                    context,
                    initialDate: requestTaxiController.scheduleTime(),
                    firstDate: DateTime.now().add(Duration(minutes: 15)),
                    lastDate: DateTime.now().add(Duration(hours: 24)),
                  );
                  if (_dtime != null)
                    requestTaxiController.setScheduleTime(
                      requestTaxiController.scheduleTime().copyWithDate(_dtime),
                    );
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
                        getFormattedDate(),
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
                  final TimeOfDay _tmpInitialTime = TimeOfDay(
                    hour: requestTaxiController.scheduleTime().hour,
                    minute: requestTaxiController.scheduleTime().minute,
                  );

                  final TimeOfDay? _t = await getTimePicker(
                    context,
                    initialTime: _tmpInitialTime,
                  );
                  if (_t != null) {
                    mezDbgPrint("Picked time : ${_t.hour}:${_t.minute}");
                    final DateTime _dt = requestTaxiController
                        .scheduleTime()
                        .copyWithTimeOfDay(_t);

                    mezDbgPrint("Picked time : ${_dt.hour}:${_dt.minute}");

                    if (!_dt
                        .difference(requestTaxiController
                            .scheduleTime()
                            .copyWithTimeOfDay(_tmpInitialTime))
                        .isNegative) {
                      requestTaxiController.setScheduleTime(_dt);
                    } else {
                      MezSnackbar(
                          "Wrong time picked!", "Should be Now+15 or more!",
                          position: SnackPosition.TOP);
                    }
                  }
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
                        getFormattedTime(),
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
                onTap: onConfirmTap,
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
                onTap: onCancelTap,
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
      ),
    );
  }

  String getFormattedDate() {
    return DateFormat('MM / d / y')
        .format(requestTaxiController.scheduleTime());
  }

  String getFormattedTime() {
    return DateFormat(
      'hh:mm a',
    ).format(requestTaxiController.scheduleTime());
  }
}
