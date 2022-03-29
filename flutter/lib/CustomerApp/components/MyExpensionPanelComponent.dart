import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class MyExpansionPanelComponent extends StatefulWidget {
  final Widget child;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final bool initiallyExpanded;
  final bool maintainState;
  final GestureTapCallback? onEdit;

  const MyExpansionPanelComponent({
    required this.child,
    this.onExpansionChanged,
    required this.children,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.onEdit,
  });

  @override
  _MyExpansionPanelComponentState createState() =>
      _MyExpansionPanelComponentState();
}

class _MyExpansionPanelComponentState extends State<MyExpansionPanelComponent>
    with SingleTickerProviderStateMixin {
  /// _easeOutTween
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);

  /// _easeInTween
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  /// _halfTween
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  /// _controller
  late AnimationController _controller;

  /// _iconTurns
  late Animation<double> _iconTurns;

  /// _heightFactor
  late Animation<double> _heightFactor;

  /// _isExpanded
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    /// Initialize _controller
    _controller = AnimationController(duration: _kExpand, vsync: this);

    /// Initialize _heightFactor
    _heightFactor = _controller.drive(_easeInTween);

    /// Initialize _iconTurns
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));

    /// Initialize _isExpanded
    _isExpanded = (PageStorage.of(context)?.readState(context) as bool?) ??
        widget.initiallyExpanded;

    if (_isExpanded) _controller.value = 1.0;
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
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: !_isExpanded
                  ? BorderRadius.circular(8)
                  : BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    widget.child,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
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
                        const SizedBox(width: 10),
                        InkWell(
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(64)),
                              color: const Color.fromRGBO(172, 89, 252, 0.8),
                            ),
                            child: RotationTransition(
                              turns: _iconTurns,
                              child: const Icon(
                                Icons.expand_more,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onTap: _handleTap,
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            child: Align(
              alignment: Alignment.center,
              heightFactor: _heightFactor.value,
              child: Container(
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
