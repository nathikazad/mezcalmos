import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ScheduledOrdersNotifier extends StatelessWidget {
  final void Function(bool shouldNotify) onNotifyChange;
  final RxBool initialValue;

  const ScheduledOrdersNotifier(
      {required this.initialValue, required this.onNotifyChange, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: .5,
          color: Color.fromRGBO(236, 236, 236, 1),
        ),
      ),
      height: 50,
      child: FittedBox(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 7,
              ),
              Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(172, 89, 252, 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 14,
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Notify me about scheduled orders",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 22,
              ),
              Obx(
                () => Align(
                  alignment: Alignment.center,
                  child: Switch(
                    value: initialValue.value,
                    onChanged: (_) {
                      initialValue.value = _;
                      onNotifyChange(_);
                    },
                    activeColor: Color.fromRGBO(224, 197, 251, 1),
                    thumbColor: MaterialStateProperty.all(
                      initialValue.value
                          ? Color.fromRGBO(172, 89, 252, 1)
                          : Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
