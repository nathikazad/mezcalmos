import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key, required this.review});
  final Review review;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  Rxn<MainUserInfo> user = Rxn();
  Future<void> getUser() async {
    user.value = await Get.find<CustomerAuthController>()
        .getUserInfoById(widget.review.authorId!);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (user.value != null) {
        return Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.value!.name!,
                          style: Get.textTheme.bodyText1,
                        ),
                        Text(
                          widget.review.reviewTime!.timeAgo(),
                          style: Get.textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.review.comment,
                          style: Get.textTheme.bodyText2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    )),
                RatingBarIndicator(
                  rating: widget.review.rating.toDouble(),
                  itemBuilder: (BuildContext context, int index) => Icon(
                    Icons.star,
                    color: primaryBlueColor,
                  ),
                  itemCount: 5,
                  itemSize: 18.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          ),
        );
      } else
        return SizedBox();
    });
  }
}
