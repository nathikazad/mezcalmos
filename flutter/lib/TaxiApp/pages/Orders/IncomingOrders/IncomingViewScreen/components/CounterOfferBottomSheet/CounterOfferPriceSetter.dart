import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ListOrdersScreen/components/LaundryOrdersListComponent.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
          ['Orders']['IncomingOrders']['IncomingViewScreen']['components']
      ['CounterOfferBottomSheet']['CounterOfferPriceSetter'];


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
      _currentOfferPrice = widget.order.cost + 5;
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
                _i18n()["rideOffer"],
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
            _i18n()["firstTxt"],
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: Get.width,
          child: Center(
            child: IncrementalComponent(
                minVal: (widget.order.cost as int) + 5,
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
                -i18n()["sendOffer"],
                style: TextStyle(color: Colors.white, fontFamily: 'psb'),
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
          child: Text(
           _i18n()["secondTxt"],
            style: TextStyle(fontFamily: 'psr', fontSize: 10.sp),
          ),
        )
      ],
    );
  }
}
