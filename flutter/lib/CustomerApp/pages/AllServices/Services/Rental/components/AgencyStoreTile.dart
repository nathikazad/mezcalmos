import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class AgencyStoreTile extends StatelessWidget {
  const AgencyStoreTile({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.unitTime,
  });

  final String title;
  final NetworkImage image;
  final double price;
  final String unitTime;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MezCard(
        firstAvatarBgImage: image,
        content: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: style.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "\$$price/$unitTime",
                style: style.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        onClick: () {},
      ),
    );
  }
}
