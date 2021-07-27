// Usefull when trying to make Sizes adptable!
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void mezcalmosLogger(String text, {bool isError = false}) =>
    print("[ MEZCALMOS ][ GETX ] $text");

double getSizeRelativeToScreen(
        double v, double screenHeight, double screenWidth) =>
    (screenHeight / screenWidth) * v;

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
    print("Given Response is null !");
    return null;
  } else if (resp['status'] == "Error") {
    print("[RESPONSE ERROR] -> $resp['status'] ");
    return resp['errorMessage'] ?? onErrorMessage ?? resp['status'];
  } else if (resp['status'] == "Success") {
    print("[RESPONSE SUCCESS] -> $resp['status'] ");
    return onSuccessMessage ?? resp['status'];
  } else {
    print("[RESPONSE UNKNOWN] -> $resp['status'] ");
    return null;
  }
}

// BitmapLoading stuff -------------------

Future<BitmapDescriptor> BitmapDescriptorLoader(
    dynamic asset, int width, int height,
    {bool isBytes = false}) async {
  return BitmapDescriptor.fromBytes(
      await getBytesFromCanvas(width, height, asset, isBytes: isBytes));
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
