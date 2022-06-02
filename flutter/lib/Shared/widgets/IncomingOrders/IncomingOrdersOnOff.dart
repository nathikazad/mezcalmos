import 'package:flutter/material.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/MezSwitch.dart';

class IncomingOrdersOnOff extends StatelessWidget {
  final bool initialSwitcherValue;
  final Function onTurnedOn;
  final Function onTurnedOff;
  const IncomingOrdersOnOff({
    this.initialSwitcherValue = false,
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
          Text(
            "Incoming Orders",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          _onOffSwitcher()
        ],
      ),
    );
  }

  Widget _onOffSwitcher() {
    return Flexible(
      child: Container(
        height: 50, // 50, //46.47,
        width: 60 * 2,
        child: MezSwitch(
          buttonSize: Size(63, 50),
          initialPosition:
              initialSwitcherValue, //_taxiAuthController.taxiState?.isLooking ?? false,
          values: <String>['ON', 'OFF'],
          onToggleCallback: (int v) {
            // turn ut ON
            if (v == 0) {
              onTurnedOn();
              // _taxiAuthController.turnOn();
            } else {
              // _taxiAuthController.turnOff();
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
      ),
    );
  }
}
