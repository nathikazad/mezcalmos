import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ContextHelper on BuildContext {
  TextTheme get txt => Theme.of(this).textTheme;

  void showSlowInternet() {}
  void hideSlowInternet() {}
}

class MezDelegate extends SliverPersistentHeaderDelegate {
  final Color? backgroundColor;
  final Widget child;
  final double max;
  final double min;

  MezDelegate(
      {this.backgroundColor,
      required this.child,
      this.max = kToolbarHeight,
      this.min = kToolbarHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor ?? context.theme.primaryColor,

      // padding: const EdgeInsets.all(5),
      child: Center(child: child),
    );
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
