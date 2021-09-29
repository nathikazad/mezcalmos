import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getFutureData(Future<dynamic> list, Function func) {
  return FutureBuilder<dynamic>(
      future: list, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return build(context, snapshot, func);
      });
}

Widget getStreamData(Stream<dynamic> list, Function func) {
  return StreamBuilder<dynamic>(
      stream: list, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return build(context, snapshot, func);
      });
}

Widget build(
    BuildContext context, AsyncSnapshot<dynamic> snapshot, Function func) {
  List<Widget> children;
  if (snapshot.hasData) {
    children = <Widget>[
      Expanded(
        child: func(snapshot.data),
      )
      // const Icon(
      //   Icons.check_circle_outline,
      //   color: Colors.green,
      //   size: 60,
      // ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 16),
      //   child: func(snapshot.data),
      // )
    ];
  } else if (snapshot.hasError) {
    children = <Widget>[
      Expanded(
          child: Container(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ],
        ),
      ))
    ];
  } else {
    children = <Widget>[
      Expanded(
          child: Container(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ],
        ),
      ))
    ];
  }
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: children,
    ),
  );
}
