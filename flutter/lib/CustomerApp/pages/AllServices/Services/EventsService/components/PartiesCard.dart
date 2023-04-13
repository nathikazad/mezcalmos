import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AssetCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/AssetServiceView/AssetServiceView.dart';

class PartiesCard extends StatelessWidget {
  const PartiesCard({
    super.key,
    required this.title,
    required this.price,
    required this.priceUnit,
    required this.image,
    required this.rating,
  });

  final String title;
  final double price;
  final String priceUnit;
  final NetworkImage image;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return AssetCard(
      title: title,
      image: image,
      needTrailingImage: false,
      needLeadingImage: true,
      needCustomSubtitle: true,
      subtitleWidget: Row(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Image(
                  image: AssetImage(aPriceCheck),
                ),
              ),
              Text("\$$price/$priceUnit"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Icon(
              Icons.payments_outlined,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Icon(
              Icons.credit_card,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 2.0,
            ),
            child: Icon(
              Icons.star,
              color: primaryBlueColor,
            ),
          ),
          Text(rating),
        ],
      ),
      needDivider: false,
      needBottomTitleText: false,
      onClick: () {
        // AssetServiceView.navigate();
      },
    );
  }
}
