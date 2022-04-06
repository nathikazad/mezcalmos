import 'package:flutter/material.dart';

/// I Made this for some special cases where there is no way to handle some gestures,
/// Example : MGoogleMap:doubleTap
abstract class MezSmartPointer {
// Future ref:
/*
    How i came up with this plane :
    So basically this mainly has 3 parts :
    - 1 : Checks - setting instance variables'values .. etc  => This is done upon each [Down] event aka Fingers contacted Screen.
    - 2 : Triggering callbacks (overridden ones).
    - 3 : Reseting the whole flow => which happens upon a cancel event (in case frame skipping) or after [Second Part done].

    HOW TO USE IT ?
    Simply wrap MGoogleMap or any other widgets with it  and call [detector] at the end, to get the actual widget.
    Ex : return ChildOfMezSmartPointer(child : MGoogleMap()).detector;
 */

  Widget child;
  HitTestBehavior behavior;

  DateTime? _lastPtrDownTime = null;
  // DateTime? _lastPtrUpTime = null;
  bool _isInMoveMode = false;
  bool _isInDoubleTapMode = false;

  MezSmartPointer({
    this.behavior = HitTestBehavior.translucent,
    required this.child,
  });

  // Handling shit My own way cuz GoogleMap still needs work

  /// Override this and put your logic upon a doubleTap on [child]
  void onDoubleTap();

  /// Override this and put your logic upon a Tap on [child]
  void onTap();

  /// Override this and put your logic upon a move on [child]
  void onMove();

  /// Override this and put your logic upon a moveEnd on [child]
  void onMoveEnd() {}

  /// Override this and put your logic upon a moveStart on [child]
  ///
  /// By default it calls onMove(), override it for ur uses.
  void onMoveStart() {}

  /// Override this and put your logic upon a longPress on [child]
  void onLongPress();

  // --------------------- Private Callbacks ----------------------

  /// This is a _callback for Listener::onPointerDown
  void _onPointerDown(PointerDownEvent event) {
    final DateTime _nowSnapshot = DateTime.now();

    // means User has no active Fingers on Screen yet
    if (_lastPtrDownTime == null) {
      // we set finger down time :
      _lastPtrDownTime = _nowSnapshot;
    } else {
      // only do if not in doubleTapMode, cuz we're only handling double taps for now.
      if (!_isInDoubleTapMode) {
        // check if it is actually a double tap that is gonna happen.
        final int _rightOnDiffCalc =
            _lastPtrDownTime!.difference(_nowSnapshot).inMilliseconds.abs();
        if (_rightOnDiffCalc <= 500) {
          // If we're hear it means , there is two clicks happened withing 0.5s
          // so we set [_isInDoubleTapMode] to true;
          _isInDoubleTapMode = true;
        }
        _lastPtrDownTime = _nowSnapshot;
      }
    }
  }

  /// This is a _callback for Listener::onPointerCancel In case frames got skipped.
  void _onPointerCancel(PointerCancelEvent event) {
    _resetInstance();
  }

  /// Resets state and call [onMove] | [onMoveStart].
  void _onPointerMove(PointerMoveEvent event) {
    if (_isInMoveMode) {
      onMove();
    } else {
      _isInMoveMode = true;
      onMoveStart();
    }
  }

  /// Call [onTap] or [onDoubleTap] depending on [_isInDoubleTapMode] and then reset via [_resetInstance]
  void _onPointerUp(PointerUpEvent event) {
    final DateTime _nowSnapshot = DateTime.now();

    if (_isInMoveMode) {
      _resetInstance();
      onMoveEnd();
    } else if (_isInDoubleTapMode) {
      // a tap is ended when down-up done.
      _resetInstance();
      onDoubleTap();
    } else {
      // check if it was a long press.

      if (_lastPtrDownTime != null &&
          _lastPtrDownTime!.difference(_nowSnapshot).inMilliseconds.abs() >=
              1000) {
        _resetInstance();
        onLongPress();
      } else
        // we do not reset in one Taps ,inOrder to keep track of our [lastTapDownTime]
        onTap();
    }
  }

  /// This resets the class's configs back to default when an Event is done being handled.
  void _resetInstance() {
    _isInDoubleTapMode = false;
    _isInMoveMode = false;
    _lastPtrDownTime = null;
  }

  Listener get detector => Listener(
        behavior: behavior,
        child: child,
        onPointerDown: _onPointerDown,
        onPointerCancel: _onPointerCancel,
        onPointerMove: _onPointerMove,
        onPointerUp: _onPointerUp,
      );
}
