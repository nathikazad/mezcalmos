import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezSwitch.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["RestaurantApp"]["pages"]
        ["ROpEditInfoView"]["ROpEditInfoView"]["components"]["ROpOpenClose"];

class ROpOpenClose extends StatelessWidget {
  final bool initialSwitcherValue;
  String title;
  String? subtitle;
  final Function onTurnedOn;
  final Function onTurnedOff;
  ROpOpenClose({
    required this.title,
    this.initialSwitcherValue = false,
    this.subtitle,
    required this.onTurnedOn,
    required this.onTurnedOff,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (subtitle != null)
              ? Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          subtitle!,
                          style: Get.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp,
                  ),
                ),
          SizedBox(
            width: 10,
          ),
          Transform.scale(scale: 0.9, child: _onOffSwitcher())
        ],
      ),
    );
  }

  Widget _onOffSwitcher() {
    return Container(
      height: 50, // 50, //46.47,
      width: 73 * 2,
      child: MezSwitch(
        buttonSize: Size(73, 50),
        initialPosition:
            initialSwitcherValue, //_taxiAuthController.taxiState?.isLooking ?? false,
        values: <String>['${_i18n()["open"]}', ' ${_i18n()["closed"]}'],
        onToggleCallback: (int v) {
          // turn ut ON
          if (v == 0) {
            onTurnedOn();
          } else {
            onTurnedOff();
          }
        },
        buttonColor:
            initialSwitcherValue //_taxiAuthController.taxiState?.isLooking == true
                ? Colors.green
                : Colors.red,
        backgroundColor: Colors.transparent,
        textColor: const Color(0xFFFFFFFF),
      ),
    );
  }
}
