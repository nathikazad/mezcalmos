import 'package:flutter/material.dart';

class MezCard extends StatelessWidget {
  const MezCard({
    super.key,
    this.margin,
    this.contentPadding,
    required this.content,
    this.action,
    this.firstAvatarBgColor,
    this.firstAvatarBgImage,
    this.firstAvatarIcon,
    this.firstAvatarIconColor,
    this.secondAvatarBgColor,
    this.secondAvatarBgImage,
    this.secondAvatarIcon,
    this.secondAvatarIconColor,
  });
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final Color? firstAvatarBgColor;
  final Color? firstAvatarIconColor;
  final ImageProvider? firstAvatarBgImage;
  final IconData? firstAvatarIcon;
  final Color? secondAvatarBgColor;
  final Color? secondAvatarIconColor;
  final ImageProvider? secondAvatarBgImage;
  final IconData? secondAvatarIcon;
  final Widget content;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: Container(
        padding: contentPadding,
        child: Row(
          children: [
            // first avatars//
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundColor: firstAvatarBgColor,
                  backgroundImage: firstAvatarBgImage,
                  child: Icon(
                    firstAvatarIcon,
                    color: firstAvatarIconColor,
                    size: 25,
                  ),
                ),
                if (secondAvatarBgImage != null || secondAvatarIcon != null)
                  Positioned(
                    right: -35,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: secondAvatarBgColor,
                      backgroundImage: secondAvatarBgImage,
                      child: Icon(
                        Icons.delivery_dining,
                        size: 25,
                        color: secondAvatarIconColor,
                      ),
                    ),
                  )
              ],
            ),
            if (secondAvatarBgImage != null || secondAvatarIcon != null)
              SizedBox(
                width: 37,
              ),
            // content //
            SizedBox(
              width: 8,
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
    );
  }
}
