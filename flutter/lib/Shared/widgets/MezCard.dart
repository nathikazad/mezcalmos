import 'package:flutter/material.dart';

class MezCard extends StatelessWidget {
  const MezCard(
      {super.key,
      this.margin,
      this.onClick,
      this.radius = 25,
      this.contentPadding = const EdgeInsets.all(8),
      required this.content,
      this.action,
      this.firstAvatarBgColor,
      this.firstAvatarBgImage,
      this.firstAvatarIcon,
      this.firstAvatarIconColor,
      this.secondAvatarBgColor,
      this.secondAvatarBgImage,
      this.borderRadius = 10,
      this.secondAvatarIcon,
      this.secondAvatarIconColor,
      this.leading,
      this.elevation});
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final Function()? onClick;
  final Color? firstAvatarBgColor;
  final Color? firstAvatarIconColor;
  final ImageProvider? firstAvatarBgImage;
  final IconData? firstAvatarIcon;
  final Color? secondAvatarBgColor;
  final Color? secondAvatarIconColor;
  final ImageProvider? secondAvatarBgImage;
  final IconData? secondAvatarIcon;
  final double radius;
  final Widget content;
  final Widget? action;
  final Widget? leading;
  final double borderRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(radius),
      // ),
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onClick,
        child: Container(
          padding: contentPadding,
          child: Row(
            children: [
              // leading //
              if (leading != null) leading!,

              // first avatars//
              if (firstAvatarBgImage != null ||
                  firstAvatarIcon != null ||
                  firstAvatarBgColor != null)
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: radius,
                      backgroundColor: firstAvatarBgColor,
                      backgroundImage: firstAvatarBgImage,
                      child: Icon(
                        firstAvatarIcon,
                        color: firstAvatarIconColor,
                        size: radius + 3,
                      ),
                    ),
                    if (secondAvatarBgImage != null ||
                        secondAvatarIcon != null ||
                        secondAvatarBgColor != null)
                      Positioned(
                        right: -35,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: radius + 2,
                          child: CircleAvatar(
                            radius: radius,
                            backgroundColor: secondAvatarBgColor,
                            backgroundImage: secondAvatarBgImage,
                            child: Icon(
                              secondAvatarIcon,
                              size: radius + 3,
                              color: secondAvatarIconColor,
                            ),
                          ),
                        ),
                      )
                  ],
                ),

              SizedBox(
                width: ((firstAvatarBgImage != null ||
                            firstAvatarIcon != null ||
                            firstAvatarBgColor != null) &&
                        (secondAvatarBgColor != null ||
                            secondAvatarBgImage != null ||
                            secondAvatarIcon != null))
                    ? 40
                    : 12,
              ),
              Flexible(fit: FlexFit.tight, child: content),

              // buttons //
              SizedBox(
                width: 5,
              ),
              if (action != null) action!,
            ],
          ),
        ),
      ),
    );
  }
}
