import 'package:flutter/material.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';

class OverlayController {
  OverlayEntry? _overlayEntry;

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

mixin OverlayStateMixin<T extends StatefulWidget> on State<T> {
  OverlayController controller = OverlayController();
  // 2

  // 4
  Widget _dismissibleOverlay(Widget child) => Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: controller.removeOverlay,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.only(
                      right: MezCalmosResizer.getWepPageHorizontalPadding(
                          context)),
                  child: child)),
        ],
      );

  // Widget _dismissibleOverlay(Widget child) {
  //   return Container(
  //     // margin: const EdgeInsets.symmetric(horizontal: 10),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         child,
  //         SizedBox(
  //           height: kToolbarHeight * 1.75,
  //         )
  //       ],
  //     ),
  //   );
  // }

  // 5
  void _insertOverlay(Widget child) {
    // 6
    controller._overlayEntry = OverlayEntry(
      builder: (_) => _dismissibleOverlay(child),
    );

    // 7
    Overlay.of(context)?.insert(controller._overlayEntry!);
  }

  // 1
  bool get isOverlayShown => controller._overlayEntry != null;

// 2
  void toggleOverlay(Widget child) =>
      isOverlayShown ? controller.removeOverlay() : _insertOverlay(child);
}
