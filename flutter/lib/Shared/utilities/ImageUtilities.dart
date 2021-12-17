// Usefull when trying to make Sizes adptable!
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

Image mLoadImage(
    {required String? url,
    double? height,
    double? width,
    fit: BoxFit.cover,
    String assetInCaseFailed = aNoImgAsset}) {
  Image _img;

  if (url == null ||
      url.toLowerCase().contains('.svg') ||
      !url.startsWith('http')) {
    try {
      _img = Image.asset(
        url!,
        height: height,
        width: width,
        fit: BoxFit.contain,
      );
    } catch (e) {
      _img = Image.asset(
        assetInCaseFailed,
        height: height,
        width: width,
        fit: BoxFit.contain,
      );
    }
  } else {
    _img = Image.network(
      url,
      height: height,
      width: width,
      fit: fit,
    );
  }

  return _img;
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
