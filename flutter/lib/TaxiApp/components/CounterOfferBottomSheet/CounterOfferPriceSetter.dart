import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/IncrementalComponent.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/models/CounterOffer.dart';
import 'package:sizer/sizer.dart';

typedef void OnPriceChanged(int);
typedef void OnCounterOfferSent(num);

class CounterOfferPriceSetter extends StatefulWidget {
  final Rxn<CounterOffer> counterOffer;
  final IncomingOrdersController controller;
  final TaxiOrder order;
  final OnCounterOfferSent onCountOfferSent;
  final OnPriceChanged onPriceChanged;

  CounterOfferPriceSetter({
    required this.counterOffer,
    required this.controller,
    required this.order,
    required this.onCountOfferSent,
    required this.onPriceChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return _CounterOfferPriceSetterState();
  }
}

class _CounterOfferPriceSetterState extends State<CounterOfferPriceSetter> {
  late num _currentOfferPrice;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentOfferPrice = widget.order.cost;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Center(
              child: Text(
                'Make a ride offer',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15.sp, fontFamily: 'psr'),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 5),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            'The customer will be notified with your offer once the offer accepted the ride will automatically starts',
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: Get.width,
          child: Center(
            child: IncrementalComponent(
                maxVal: 1000,
                center: true,
                btnColors: Colors.black,
                increment: () {
                  setState(() {
                    _currentOfferPrice += 5;
                  });
                  widget.onPriceChanged(_currentOfferPrice);
                },
                value: _currentOfferPrice as int,
                decrement: () {
                  setState(() {
                    _currentOfferPrice -= 5;
                  });
                  widget.onPriceChanged(_currentOfferPrice);
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
          child: InkWell(
            onTap: () => widget.onCountOfferSent(_currentOfferPrice),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 172, 89, 252),
                  borderRadius: BorderRadius.circular(10)),
              width: 80.w,
              child: Center(
                  child: Text(
                'Send offer',
                style: TextStyle(color: Colors.white, fontFamily: 'psb'),
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
          child: Text(
            "Every offer you make have a timeout of 60 seconds if the customer doesn’t accept your offer the offer will be canceled",
            style: TextStyle(fontFamily: 'psr', fontSize: 10.sp),
          ),
        )
      ],
    );
  }
}
