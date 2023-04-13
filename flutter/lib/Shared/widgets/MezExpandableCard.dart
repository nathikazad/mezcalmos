import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class MezExpandableCard extends StatefulWidget {
  const MezExpandableCard(
      {super.key,
      this.showImage = true,
      this.imageUrl,
      this.marging = const EdgeInsets.only(bottom: 15),
      required this.title,
      this.imageShape = BoxShape.rectangle,
      required this.expandableWidget,
      this.onTapHeaderImage});
  final bool showImage;
  final Function()? onTapHeaderImage;
  final EdgeInsets marging;

  final String? imageUrl;
  final Widget title;
  final BoxShape imageShape;
  final List<Widget> expandableWidget;

  @override
  State<MezExpandableCard> createState() => _MezExpandableCardState();
}

class _MezExpandableCardState extends State<MezExpandableCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: widget.marging,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: (widget.expandableWidget.isEmpty)
            ? Container(
                margin: EdgeInsets.only(top: 4.5, bottom: 4.5),
                child: _itemHeader(),
              )
            : _itemExpandableComponent(context),
      ),
    );
  }

  Widget _itemExpandableComponent(
    BuildContext context,
  ) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.all(5),
        collapsedIconColor: primaryBlueColor,
        textColor: primaryBlueColor,

        onExpansionChanged: (bool v) {
          setState(() {
            isExpanded = v;
          });
        },
        iconColor: primaryBlueColor,
        trailing: Container(
          margin: const EdgeInsets.only(right: 14),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: secondaryLightBlueColor, shape: BoxShape.circle),
          child:
              (isExpanded) ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
        ),

        //  tilePadding: EdgeInsets.all(5),
        tilePadding: EdgeInsets.zero,
        title: _itemHeader(),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,

        children: [
          Theme(
              data: Theme.of(context)
                  .copyWith(dividerColor: Colors.grey.shade400),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.expandableWidget,
                ),
              )),
        ],
      ),
    );
  }

  Widget _itemHeader() {
    return Container(
        child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 8,
          ),
          if (widget.showImage && widget.imageUrl != null)
            Container(
              //  padding: const EdgeInsets.all(5),
              height: 55,
              width: 55,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  shape: widget.imageShape,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: (widget.imageUrl != null && widget.imageUrl!.isURL)
                        ? CachedNetworkImageProvider(widget.imageUrl!)
                        : AssetImage(aNoImage) as ImageProvider<Object>,
                  )),
              child: widget.onTapHeaderImage == null
                  ? null
                  : MezIconButton(
                      elevation: 0,
                      materialColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      icon: Icons.zoom_in_outlined,
                      iconColor: Colors.white,
                      onTap: widget.onTapHeaderImage,
                    ),
            ),
          SizedBox(
            width: 10,
          ),
          widget.title
        ],
      ),
    ]));
  }
}
