import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'dart:ui' as ui;

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

  final ByteData imageData = await rootBundle.load(altIconPath!);
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
}
