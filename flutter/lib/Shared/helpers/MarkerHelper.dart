import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'dart:ui' as ui;

import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

class LabelMarker {
  final String? label;
  final String? altIconPath;
  final MarkerId markerId;
  final LatLng position;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double alpha;
  final Offset anchor;
  final bool consumeTapEvents;
  final bool draggable;
  final bool flat;
  final BitmapDescriptor icon;
  final InfoWindow infoWindow;
  final double rotation;
  final bool visible;
  final double zIndex;
  final VoidCallback? onTap;
  final ValueChanged<LatLng>? onDragStart;
  final ValueChanged<LatLng>? onDragEnd;
  final ValueChanged<LatLng>? onDrag;

  LabelMarker({
    required this.label,
    this.altIconPath,
    required this.markerId,
    required this.position,
    this.backgroundColor = softPurple,
    this.textStyle = const TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 45,
      color: primaryBlueColor,
    ),
    this.alpha = 1.0,
    this.anchor = const Offset(0.5, 1.0),
    this.consumeTapEvents = false,
    this.draggable = false,
    this.flat = false,
    this.icon = BitmapDescriptor.defaultMarker,
    this.infoWindow = InfoWindow.noText,
    this.rotation = 0.0,
    this.visible = true,
    this.zIndex = 0.0,
    this.onTap,
    this.onDrag,
    this.onDragStart,
    this.onDragEnd,
  });
}

extension AddExtension on Set<Marker> {
  Future<bool> addLabelMarker(LabelMarker labelMarker) async {
    bool result = false;
    await createCustomMarkerBitmap(
      title: labelMarker.label,
      altIconPath: labelMarker.altIconPath,
      backgroundColor: labelMarker.backgroundColor,
      textStyle: labelMarker.textStyle,
    ).then((value) {
      add(Marker(
          markerId: labelMarker.markerId,
          position: labelMarker.position,
          icon: value,
          alpha: labelMarker.alpha,
          anchor: labelMarker.anchor,
          consumeTapEvents: labelMarker.consumeTapEvents,
          draggable: labelMarker.draggable,
          flat: labelMarker.flat,
          infoWindow: labelMarker.infoWindow,
          rotation: labelMarker.rotation,
          visible: labelMarker.visible,
          zIndex: labelMarker.zIndex,
          onTap: labelMarker.onTap,
          onDragStart: labelMarker.onDragStart,
          onDrag: labelMarker.onDrag,
          onDragEnd: labelMarker.onDragEnd));
      result = true;
    });
    return (result);
  }
}

Future<BitmapDescriptor> createCustomMarkerBitmap(
    {String? title,
    String? altIconPath,
    required TextStyle textStyle,
    Color backgroundColor = Colors.blueAccent}) async {
  final TextSpan span = TextSpan(
    style: textStyle,
    text: title ?? '       ',
  );
  final TextPainter painter = TextPainter(
    text: span,
    textAlign: TextAlign.center,
    textDirection: ui.TextDirection.ltr,
  );
  painter.text = TextSpan(
    text: title ?? '       ',
    style: textStyle,
  );
  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  painter.layout();
  painter.paint(canvas, const Offset(20.0, 10.0));
  final int textWidth = painter.width.toInt();
  final int textHeight = painter.height.toInt();

  final Path path = Path();
  final Paint myPaint = Paint();

  myPaint.color = Colors.white;

  final imageData = await rootBundle.load(mezHomeIconMarker);
  final ui.Image assetImage =
      await decodeImageFromList(imageData.buffer.asUint8List());

  path.addRRect(RRect.fromLTRBAndCorners(0, 0, textWidth + 40, textHeight + 20,
      bottomLeft: const Radius.circular(50),
      bottomRight: const Radius.circular(50),
      topLeft: const Radius.circular(50),
      topRight: const Radius.circular(50)));

  canvas.drawShadow(path, Color(0xff000000), 2, true);
  canvas.drawPath(path, myPaint);

  painter.layout();

  if (title == null) {
    canvas.drawImage(assetImage, Offset(30, 12.5), Paint());
  }

  painter.paint(canvas, const Offset(20.0, 10.0));

  final ui.Picture p = pictureRecorder.endRecording();
  final ByteData? pngBytes = await (await p.toImage(
          painter.width.toInt() + 40, painter.height.toInt() + 50))
      .toByteData(format: ui.ImageByteFormat.png);
  final Uint8List data = Uint8List.view(pngBytes!.buffer);
  return BitmapDescriptor.fromBytes(data);

//---------------------------------------------------------------

// final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//   final Canvas canvas = Canvas(pictureRecorder);
//   painter.layout();
//   painter.paint(canvas, const Offset(20.0, 10.0));
//   final int textWidth = painter.width.toInt();
//   final int textHeight = painter.height.toInt();

//   final Path path = Path();
//   final Paint myPaint = Paint();

//   myPaint.color = Colors.white;

//   path.addRRect(RRect.fromLTRBAndCorners(0, 0, textWidth + 40, textHeight + 20,
//       bottomLeft: const Radius.circular(50),
//       bottomRight: const Radius.circular(50),
//       topLeft: const Radius.circular(50),
//       topRight: const Radius.circular(50)));

//   canvas.drawShadow(path, Color(0xff000000), 2, true);
//   canvas.drawPath(path, myPaint);

//   painter.layout();
//   painter.paint(canvas, const Offset(20.0, 10.0));

  //---------------------------------------------------------------

  // final double width = 45;
  // final double height = 25;
  // final double radius = 25;

  // final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  // final Canvas canvas = Canvas(pictureRecorder);

  // final Paint labelPainter = Paint()..color = Colors.white;
  // final Path path = Path();
  // final Rect rect =
  //     Rect.fromCenter(center: Offset(0, 0), width: width, height: height);

  // path.addRRect(RRect.fromRectAndRadius(
  //     Rect.fromCenter(center: Offset(1, 1), width: width, height: height),
  //     Radius.circular(radius)));
  // canvas.drawShadow(path, Colors.grey.shade300, 2, true);

  // canvas.drawRRect(
  //     RRect.fromRectAndRadius(rect, Radius.circular(radius)), labelPainter);

  // if (1 == 1) {
  //   final TextPainter textPainter = TextPainter(
  //     text: TextSpan(
  //       text: '\$115',
  //       style: const TextStyle(
  //         fontFamily: "Poppins",
  //         fontWeight: FontWeight.w600,
  //         fontSize: 12.5,
  //         color: primaryBlueColor,
  //       ),
  //     ),
  //     textDirection: TextDirection.ltr,
  //   )..layout();

  //   final Offset offset = Offset(screenSize.width / 2 - textPainter.width / 2,
  //       screenSize.height / 2 - textPainter.height / 2);
  //   textPainter.paint(canvas, offset);
  // } else {
  //   ui.Image? image;
  //   final data = await rootBundle.load(mezHomeIconMarker);
  //   image = await decodeImageFromList(data.buffer.asUint8List());

  //   print('dddddddddddddd ${image.width}');
  //   // Calculate the position of the image to center it
  //   final imageSize = Size(50, 50);
  //   final imageOffset = Offset((screenSize.width - imageSize.width) / 2,
  //       (screenSize.height - imageSize.height) / 2);

  //   // Draw the image onto the canvas
  //   canvas.drawImage(image!, imageOffset, Paint());
  // }

  // final ui.Picture p = pictureRecorder.endRecording();
  // final ByteData? pngBytes = await (await p.toImage(45, 25))
  //     .toByteData(format: ui.ImageByteFormat.png);
  // final Uint8List data = Uint8List.view(pngBytes!.buffer);
  // return BitmapDescriptor.fromBytes(data);
}



// class MarkerPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) async {
//     final double width = 45;
//     final double height = 25;
//     final double radius = 25;

//     final Paint labelPainter = Paint()..color = Colors.white;
//     final Path path = Path();
//     final Rect rect =
//         Rect.fromCenter(center: Offset(0, 0), width: width, height: height);

//     path.addRRect(RRect.fromRectAndRadius(
//         Rect.fromCenter(center: Offset(1, 1), width: width, height: height),
//         Radius.circular(radius)));
//     canvas.drawShadow(path, Colors.grey.shade300, 2, true);

//     canvas.drawRRect(
//         RRect.fromRectAndRadius(rect, Radius.circular(radius)), labelPainter);

//     if (1 == 1) {
//       final TextPainter textPainter = TextPainter(
//         text: TextSpan(
//           text: '\$115',
//           style: const TextStyle(
//             fontFamily: "Poppins",
//             fontWeight: FontWeight.w600,
//             fontSize: 12.5,
//             color: primaryBlueColor,
//           ),
//         ),
//         textDirection: TextDirection.ltr,
//       )..layout();

//       final Offset offset = Offset(size.width / 2 - textPainter.width / 2,
//           size.height / 2 - textPainter.height / 2);
//       textPainter.paint(canvas, offset);
//     } else {
//       ui.Image? image;
//       final data = await rootBundle.load(mezHomeIconMarker);
//       image = await decodeImageFromList(data.buffer.asUint8List());

//       print('dddddddddddddd ${image.width}');
//       // Calculate the position of the image to center it
//       final imageSize = Size(50, 50);
//       final imageOffset = Offset((size.width - imageSize.width) / 2,
//           (size.height - imageSize.height) / 2);

//       // Draw the image onto the canvas
//       canvas.drawImage(image!, imageOffset, Paint());
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// import 'dart:ui' as ui;

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mezcalmos/Shared/constants/global.dart';

// class CustomLabelMarker {
//   static Future<Uint8List> createLabelImage(String label, Size labelSize,
//       Color backgroundColor, Color labelColor, double borderRadius) async {
//     final ui.PictureRecorder recorder = ui.PictureRecorder();

//     final imageData = await rootBundle.load(mezHomeIconMarker);
//     final ui.Image assetImage =
//         await decodeImageFromList(imageData.buffer.asUint8List());

//     final Canvas canvas = Canvas(recorder);

//     final Paint paint = Paint()..color = backgroundColor;

//     final RRect rect = RRect.fromRectAndRadius(
//         Offset.zero & labelSize, Radius.circular(borderRadius));
//     canvas.drawRRect(rect, paint);

//     final TextPainter textPainter = TextPainter(
//       text: TextSpan(
//         text: label,
//         style: const TextStyle(
//           fontFamily: "Poppins",
//           fontWeight: FontWeight.w600,
//           fontSize: 45,
//           color: primaryBlueColor,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     )..layout();

//     final imageOffset = Offset(0, 0); // specify the position of the image
  
//     canvas.drawImage(assetImage, imageOffset, Paint());

//     final Offset textOffset = Offset((labelSize.width - textPainter.width) / 2,
//         (labelSize.height - textPainter.height) / 2);
//     textPainter.paint(canvas, textOffset);

//     final ui.Picture picture = recorder.endRecording();
//     final ui.Image image = await picture.toImage(
//         labelSize.width.toInt(), labelSize.height.toInt());
//     final ByteData? data =
//         await image.toByteData(format: ui.ImageByteFormat.png);

//     return data!.buffer.asUint8List();
//   }
// }
