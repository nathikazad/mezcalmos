import 'package:flutter/material.dart';

class MezCard extends StatelessWidget {
  const MezCard(
      {super.key,
      this.margin,
      this.onClick,
      this.raidus = 25,
      this.contentPadding = const EdgeInsets.all(8),
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
      this.leading});
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
  final double raidus;
  final Widget content;
  final Widget? action;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onClick,
        child: Container(
          padding: contentPadding,
          child: Row(
            children: [
              // leading //
              leading != null
                  ? leading!
                  :
                  // first avatars//
                  Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: raidus,
                          backgroundColor: firstAvatarBgColor,
                          backgroundImage: firstAvatarBgImage,
                          child: Icon(
                            firstAvatarIcon,
                            color: firstAvatarIconColor,
                            size: raidus + 5,
                          ),
                        ),
                        if (secondAvatarBgImage != null ||
                            secondAvatarIcon != null)
                          Positioned(
                            right: -(raidus + 10),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: raidus + 2,
                              child: CircleAvatar(
                                radius: raidus,
                                backgroundColor: secondAvatarBgColor,
                                backgroundImage: secondAvatarBgImage,
                                child: Icon(
                                  secondAvatarIcon,
                                  size: raidus + 5,
                                  color: secondAvatarIconColor,
                                ),
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
      ),
    );
  }
}
