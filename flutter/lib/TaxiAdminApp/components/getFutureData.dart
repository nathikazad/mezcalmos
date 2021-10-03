import 'package:flutter/material.dart';

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
      const Icon(
        Icons.check_circle_outline,
        color: Colors.green,
        size: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: func(snapshot.data),
      )
    ];
  } else if (snapshot.hasError) {
    children = <Widget>[
      const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text('Error: ${snapshot.error}'),
      )
    ];
  } else {
    children = const <Widget>[
      SizedBox(
        child: CircularProgressIndicator(),
        width: 60,
        height: 60,
      ),
      Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text('Awaiting result...'),
      )
    ];
  }
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
}
