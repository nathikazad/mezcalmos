import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class HomesServiceListView extends StatefulWidget {
  const HomesServiceListView({super.key});

  @override
  State<HomesServiceListView> createState() => _HomesServiceListViewState();
}

class _HomesServiceListViewState extends State<HomesServiceListView> {
  @override
  Widget build(BuildContext context) {
    var txt = Theme.of(context).textTheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RentalServiceCardView(
                title: "House for rent in Puerto Escondido",
                image: AssetImage(aRentals),
                lBottomText: "Company Name",
                subtitleWidget: Text("Hello"),
                needBottomTitleText: false,
                needDivider: false,
                needLeadingImage: true,
                needTrailingImage: false,
              ),
            );
          },
        ),
      ),
    );
  }
}

class RentalServiceCardView extends StatelessWidget {
  const RentalServiceCardView({
    super.key,
    required this.title,
    required this.subtitleWidget,
    required this.lBottomText,
    required this.image,
    this.rBottomText = "",
    this.needDivider = true,
    this.needBottomTitleText = true,
    this.needLeadingImage = false,
    this.needTrailingImage = true,
  });

  final String title;
  final Widget subtitleWidget;
  final String lBottomText;
  final String rBottomText;
  final AssetImage image;
  final bool needDivider;
  final bool needBottomTitleText;
  final bool needLeadingImage;
  final bool needTrailingImage;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return MezCard(
      contentPadding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 6,
      ),
      leading: needLeadingImage
          ? CircleAvatar(
              radius: 20,
              backgroundImage: image,
            )
          : const Offstage(),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: style.headlineMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitleWidget,
                  ],
                ),
              ),
              needTrailingImage
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ColoredBox(
                        color: Colors.grey.withOpacity(0.1),
                        child: SizedBox(
                          height: 64,
                          width: 64,
                          child: Image(
                            height: 64,
                            width: 64,
                            image: AssetImage(
                              aHomes,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Offstage(),
            ],
          ),
          needDivider ? const Divider() : const Offstage(),
          needBottomTitleText
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lBottomText),
                    Text(rBottomText),
                  ],
                )
              : const Offstage(),
        ],
      ),
    );
  }
}
