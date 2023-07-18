import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class FeedCardPost extends StatelessWidget {
  const FeedCardPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(12.5),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=826&t=st=1689667492~exp=1689668092~hmac=ab9aac635bfe09ad58d100992046c307b73e99863d850fc3f4860258fa83ed45'),
            ),
            title: Text('Iyadh Souissi'),
            titleTextStyle: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700),
            subtitleTextStyle:
                context.textTheme.bodyMedium?.copyWith(fontSize: 10),
            subtitle: Text('Now'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
                'Hello dear community, we only have limited Tuna Sashimi for today, pre-order now before it’s out of stock !',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15)),
          ),
          smallSepartor,
          smallSepartor,
          CachedNetworkImage(
            imageUrl:
                'https://www.pcworld.com/wp-content/uploads/2023/04/windows-10-logo-onscreen-100809733-orig-3.jpg?resize=1024%2C684&quality=50&strip=all',
            width: double.infinity,
          ),
          smallSepartor,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 25,
                ),
                hSmallSepartor,
                Text('10 Likes',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 10)),
                hBigSeperator,
                Icon(
                  Icons.messenger_outline,
                  size: 22.5,
                ),
                hSmallSepartor,
                Text('2 Comments',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 10)),
              ],
            ),
          ),
          smallSepartor,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          smallSepartor,
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=826&t=st=1689667492~exp=1689668092~hmac=ab9aac635bfe09ad58d100992046c307b73e99863d850fc3f4860258fa83ed45'),
            ),
            title: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Write your comment..',
                  suffix: GestureDetector(
                    onTap: () {},
                    child: Text('Post',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: primaryBlueColor)),
                  ),
                  hintStyle: TextStyle(fontSize: 16),
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(75),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            ),
          ),
          smallSepartor
        ],
      ),
    );
  }
}
