import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MezMarker extends Marker {
  final bool fitWithinBounds;
  const MezMarker(
      {required MarkerId markerId,
      this.fitWithinBounds = true,
      double alpha = 1.0,
      Offset anchor = const Offset(0.5, 1.0),
      bool consumeTapEvents = false,
      bool draggable = false,
      bool flat = false,
      BitmapDescriptor icon = BitmapDescriptor.defaultMarker,
      InfoWindow infoWindow = InfoWindow.noText,
      LatLng position = const LatLng(0.0, 0.0),
      double rotation = 0.0,
      bool visible = true,
      double zIndex = 0.0,
      VoidCallback? onTap,
      ValueChanged<LatLng>? onDrag,
      ValueChanged<LatLng>? onDragStart,
      ValueChanged<LatLng>? onDragEnd})
      : super(
            markerId: markerId,
            alpha: alpha,
            anchor: anchor,
            consumeTapEvents: consumeTapEvents,
            draggable: draggable,
            flat: flat,
            icon: icon,
            infoWindow: infoWindow,
            position: position,
            rotation: rotation,
            visible: visible,
            zIndex: zIndex,
            onTap: onTap,
            onDrag: onDrag,
            onDragStart: onDragStart,
            onDragEnd: onDragEnd);
}
