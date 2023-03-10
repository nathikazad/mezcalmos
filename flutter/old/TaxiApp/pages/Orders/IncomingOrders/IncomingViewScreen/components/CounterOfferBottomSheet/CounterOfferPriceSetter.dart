import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
        ['Orders']['IncomingOrders']['IncomingViewScreen']['components']
    ['CounterOfferBottomSheet']['CounterOfferPriceSetter'];

typedef void OnCounterOfferSent(num cOfferPrice);

class CounterOfferPriceSetter extends StatefulWidget {
  final Rxn<CounterOffer> counterOffer;
  final IncomingOrdersController controller;
  final TaxiOrder order;
  final OnCounterOfferSent onCountOfferSent;
  final Function() onCloseClick;

  const CounterOfferPriceSetter({
    required this.onCloseClick,
    required this.counterOffer,
    required this.controller,
    required this.order,
    required this.onCountOfferSent,
  });

  @override
  State<StatefulWidget> createState() {
    return _CounterOfferPriceSetterState();
  }
}

class _CounterOfferPriceSetterState extends State<CounterOfferPriceSetter> {
  late int _currentPrice;
  @override
  void initState() {
    super.initState();
    _currentPrice = (widget.order.cost + 5) as int;
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: Get.width,
          child: Stack(
            children: [
              Positioned(
                left: 31,
                top: 5,
                child: InkWell(
                  onTap: widget.onCloseClick,
                  child: Icon(
                    Icons.close,
                    size: 20,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(172, 89, 252, 1),
                        Color.fromRGBO(85, 130, 255, 1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Icon(
                    Icons.local_taxi,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 7, left: 50, right: 50),
          child: Center(
            child: Text(
              'Make a ride offer',
              // _i18n()["rideOffer"],
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 32),
          child: Divider(),
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 5, bottom: 5),
        //   child: Text(
        //     _i18n()["firstTxt"],
        //     textAlign: TextAlign.center,
        //   ),
        // ),
        Container(
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  int _p = (widget.order.cost as int) + 5;
                  if (_p < _currentPrice) {
                    setState(() {
                      _currentPrice -= 5;
                    });
                  }
                },
                child: Icon(
                  MezcalmosIcons.minus_circle,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19),
                child: Text(
                  "\$${_currentPrice.toString()}",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  int _p = _currentPrice + 5;
                  if (_p < 1000) {
                    setState(() {
                      _currentPrice += 5;
                    });
                  }
                },
                child: Icon(
                  MezcalmosIcons.plus_circle,
                  color: Colors.black,
                  size: 32,
                ),
              )
            ],
          ),

          //  Center(
          //   child: IncrementalComponent(
          //     minVal: (widget.order.cost as int) + 5,
          //     maxVal: 1000,
          //     center: true,
          //     btnColors: Colors.black,
          //     incrementCallback: () {
          //       setState(() {
          //         _currentPrice += 5;
          //       });
          //     },
          //     value: _currentPrice,
          //     decrementCallback: () {
          //       setState(() {
          //         _currentPrice -= 5;
          //       });
          //     },
          //   ),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 32),
          child: InkWell(
            onTap: () => widget.onCountOfferSent(_currentPrice),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(233, 219, 245, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 80.w,
              child: Center(
                  child: Text(
                _i18n()["sendOffer"],
                style: TextStyle(
                  color: Color.fromRGBO(172, 89, 252, 1),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 16),
          child: Text(
            _i18n()["secondTxt"],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(120, 120, 120, 1),
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
