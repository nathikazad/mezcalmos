import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:sizer/sizer.dart';

class CounterOfferScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterOfferScreenState();
  }
}

class _CounterOfferScreenState extends State<CounterOfferScreen> {
  late Timer _timer;
  int _start = 20;

  void startTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: InkWell(
            child: Container(
              color: Colors.green.shade300,
              height: 50,
              child: Center(
                child: Text(
                  'Accept',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'psb', fontSize: 15.sp),
                ),
              ),
            ),
          )),
          Expanded(
              child: InkWell(
            child: Container(
              color: Colors.red.shade300,
              height: 50,
              child: Center(
                child: Text(
                  'Ignore',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'psb', fontSize: 15.sp),
                ),
              ),
            ),
          )),
        ],
      ),
      body: SafeArea(
        child: Container(
            child: Center(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ends in ${_start}s',
                style: TextStyle(
                    fontSize: 18, decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                        image: Image.network(defaultUserImgUrl).image,
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "544D sent you an offer",
                style: TextStyle(color: Colors.black, fontSize: 20.sp),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$40",
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'psb',
                        fontSize: 15.sp,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.black,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 2),
                  ),
                  Icon(Icons.arrow_forward),
                  Text(
                    "\$47",
                    style: TextStyle(
                        fontFamily: 'psb',
                        fontSize: 15.sp,
                        color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
