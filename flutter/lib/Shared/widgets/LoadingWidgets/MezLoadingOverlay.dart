import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MezLoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final String? label;
  final TextStyle? labelStyle;
  final Widget child;

  const MezLoadingOverlay(
      {required this.isLoading,
      required this.child,
      this.label,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.75),
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 20,
                ),
                if (label != null)
                  Text(
                    label!,
                    textAlign: TextAlign.center,
                    style: labelStyle ??
                        context.textTheme.bodyLarge
                            ?.copyWith(color: Colors.white),
                  )
              ],
            ),
          ),
      ],
    );
  }
}
