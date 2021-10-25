// Usefull when trying to make Sizes adptable!
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:location/location.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void mezDbgPrint(dynamic log) {
  String d = DateFormat('HH:mm:ss').format(DateTime.now());
  print("[MZL][$d] $log\n");
}

Widget emptyOrWidgetSmallPhones({Widget? empty, required Widget child}) {
  if (Get.width > 320) {
    return child;
  } else {
    return empty == null
        ? SizedBox(
            height: 0,
            width: 0,
          )
        : empty;
  }
}

String? hoursMinsShortner(String? original) {
  return original
      ?.replaceFirst('hours', 'hr')
      .replaceFirst('hour', 'hr')
      .replaceFirst('mins', 'min')
      .replaceFirst('min', 'min');
}

void responsiveSize(BuildContext context) {
  ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(375, 667),
      orientation: Orientation.portrait);
}

void mezcalmosLogger(String text, {bool isError = false}) =>
    mezDbgPrint("[MZL][ GETX ] $text");

double getSizeRelativeToScreen(
        double v, double screenHeight, double screenWidth) =>
    (screenHeight / screenWidth) * v;

void notificationSnackBar(
    String imgUrl, String title, String msg, String time, Function onClick) {
  Get.rawSnackbar(
      onTap: (_) async {
        mezDbgPrint("ONTAP ====> $_");
        await onClick();
      },
      maxWidth: Get.width,
      margin: EdgeInsets.all(0),
      duration: Duration(milliseconds: 5000),
      icon: Container(
        height: 50,
        width: 10,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: Colors.grey.shade100,
                width: 1,
                style: BorderStyle.solid)),
        child: imgUrl.startsWith("http")
            ? Image.network(
                imgUrl,
                fit: BoxFit.cover,
                height: 50,
                width: 10,
              )
            : Image.asset(imgUrl),
      ),
      backgroundColor: Colors.white,
      borderWidth: 1,
      borderColor: const Color(0xECECEC),
      borderRadius: 0,
      messageText: Text(msg),
      titleText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontFamily: 'psb'),
          ),
          Text(time)
        ],
      ),
      padding: EdgeInsets.all(25),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED);
}

//Our default snackBar
void mezcalmosSnackBar(String _title, String _msg,
        {SnackPosition position = SnackPosition.BOTTOM}) =>
    Get.snackbar(_title, _msg,
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        snackPosition: position,
        snackStyle: SnackStyle.FLOATING);

dynamic responseStatusChecker(dynamic resp,
    {String? onSuccessMessage, String? onErrorMessage}) {
  // basically
  if (resp == null) {
    mezDbgPrint("Given Response is null !");
    return null;
  } else if (resp['status'] == "Error") {
    mezDbgPrint("[RESPONSE ERROR] -> $resp['status'] ");
    return resp['errorMessage'] ?? onErrorMessage ?? resp['status'];
  } else if (resp['status'] == "Success") {
    mezDbgPrint("[RESPONSE SUCCESS] -> $resp['status'] ");
    return onSuccessMessage ?? resp['status'];
  } else {
    mezDbgPrint("[RESPONSE UNKNOWN] -> $resp['status'] ");
    return null;
  }
}

// BitmapLoading stuff -------------------

Future<BitmapDescriptor> BitmapDescriptorLoader(
    dynamic asset, int width, int height,
    {bool isBytes = false}) async {
  return BitmapDescriptor.fromBytes(
      await getBytesFromCanvas(width, height, asset, isBytes: isBytes));
  // return await getBytesFromCanvas(width, height, asset, isBytes: isBytes);
}

Future<Uint8List> getBytesFromCanvas(int width, int height, urlAsset,
    {bool isBytes = false}) async {
  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final ui.Canvas canvas = ui.Canvas(pictureRecorder);
  late final ByteData datai;

  if (!isBytes) datai = await rootBundle.load(urlAsset);
  var imaged =
      await loadImage(!isBytes ? new Uint8List.view(datai.buffer) : urlAsset);
  canvas.drawImageRect(
    imaged,
    ui.Rect.fromLTRB(
        0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble()),
    ui.Rect.fromLTRB(0.0, 0.0, width.toDouble(), height.toDouble()),
    new ui.Paint(),
  );

  final img = await pictureRecorder.endRecording().toImage(width, height);
  final data = await img.toByteData(format: ui.ImageByteFormat.png);
  return data!.buffer.asUint8List();
}

Future<ui.Image> loadImage(Uint8List img) async {
  final Completer<ui.Image> completer = new Completer();
  ui.decodeImageFromList(img, (ui.Image img) {
    return completer.complete(img);
  });
  return completer.future;
}
// ------------------------

Future<void> mapLauncher(lat, lng) async {
  String url = "https://www.google.com/maps/dir/?api=1&destination=$lat,$lng";
  if (await canLaunch(url))
    await launch(url);
  else {
    mezcalmosSnackBar("Error", "Failed to launch that on Map!");
  }
}

Future<List<int>> cropRonded(Uint8List bytes) async {
  ui.Image image = await loadImage(bytes);
  var recorder = ui.PictureRecorder();
  var canvas = Canvas(recorder);
  var imageSize = Size(image.width.toDouble(), image.height.toDouble());
  var boundsToCrop = Rect.fromCenter(
      center: imageSize.center(Offset.zero),
      width: imageSize.shortestSide,
      height: imageSize.shortestSide);
  var matrix = Matrix4.translationValues(
          -boundsToCrop.topLeft.dx, -boundsToCrop.topLeft.dy, 0)
      .storage;
  var paint = Paint()
    ..shader = ImageShader(image, TileMode.clamp, TileMode.clamp, matrix);
  var radius = imageSize.shortestSide / 2;
  canvas.drawCircle(Offset(radius, radius), radius, paint);

  ui.Image cropped = await recorder
      .endRecording()
      .toImage(imageSize.shortestSide.toInt(), imageSize.shortestSide.toInt());
  var byteData = await cropped.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}

Future<bool> getLocationPermission() async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();

    if (!_serviceEnabled) {
      return false;
    }
  }
  mezDbgPrint("[+] Location Service Enabled !");
  _permissionGranted = await location.hasPermission();

  if (_permissionGranted == PermissionStatus.denied ||
      _permissionGranted == PermissionStatus.deniedForever) {
    _permissionGranted = await location
        .requestPermission(); // problem is when the user gives deniedForever it wont pop dialog again

    if (_permissionGranted != PermissionStatus.granted ||
        _permissionGranted != PermissionStatus.grantedLimited) {
      return false;
    }
  }
  mezDbgPrint("[+] Location Permissions Granted !");
  return true;
}
