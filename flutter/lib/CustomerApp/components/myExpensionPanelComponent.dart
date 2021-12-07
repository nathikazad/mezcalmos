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
                borderRadius: !_isExpanded
                    ? BorderRadius.circular(8)
                    : BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
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
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          color: const Color.fromRGBO(237, 237, 237, 1),
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 14,
                          color: Color.fromRGBO(38, 50, 56, 1),
                        ),
                      ),
                      onTap: widget.onEdit,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(64)),
                          color: const Color.fromRGBO(172, 89, 252, 0.8),
                        ),
                        child: RotationTransition(
                          turns: _iconTurns,
                          child: const Icon(
                            Icons.expand_more,
                            color: Color(0xffffffff),
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
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
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
