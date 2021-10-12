import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class MyExpensionPanelComponent extends StatefulWidget {
  final Widget child;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final bool initiallyExpanded;
  final bool maintainState;
  final GestureTapCallback? onEdit;

  MyExpensionPanelComponent(
      {required this.child,
      this.onExpansionChanged,
      required this.children,
      this.initiallyExpanded = false,
      this.maintainState = false,
      this.onEdit});

  @override
  _MyExpensionPanelComponentState createState() =>
      _MyExpensionPanelComponentState();
}

class _MyExpensionPanelComponentState extends State<MyExpensionPanelComponent>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffffffff)),
            child: Column(
              children: [
                Row(
                  children: [
                    widget.child,
                    Spacer(),
                    InkWell(
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(64)),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x33c5c5c5),
                                offset: Offset(0, 5),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                          color: const Color(0xffffffff),
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 14,
                          color: Color(0xff5c7fff),
                        ),
                      ),
                      onTap: widget.onEdit,
                    ),
                    InkWell(
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(64)),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x33c5c5c5),
                                offset: Offset(0, 5),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                          color: const Color(0xffffffff),
                        ),
                        child: RotationTransition(
                          turns: _iconTurns,
                          child: const Icon(
                            Icons.expand_more,
                            color: Color(0xff5c7fff),
                          ),
                        ),
                      ),
                      onTap: _handleTap,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  height: 0.5,
                  decoration: BoxDecoration(
                    color: const Color(0xffececec),
                  ),
                ),
              ],
            ),
          ),
          // ListTileTheme.merge(
          //   child: ListTile(
          //     onTap: _handleTap,
          //     contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          //     title: Text("hey"),
          //     subtitle: Text("hey"),
          // trailing: RotationTransition(
          //   turns: _iconTurns,
          //   child: const Icon(Icons.expand_more),
          // ),
          // ),
          // ),

          ClipRect(
            child: Align(
              alignment: Alignment.center,
              heightFactor: _heightFactor.value,
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: Column(
                  children: widget.children,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;
    final Widget result = Offstage(
      child: TickerMode(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
        enabled: !closed,
      ),
      offstage: closed,
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: result,
    );
  }
}
