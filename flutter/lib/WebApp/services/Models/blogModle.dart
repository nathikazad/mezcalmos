import 'package:webfeed/webfeed.dart';

class BlogModel {
  final int index;
  final String date;
  final String img;
  final String title;
  final String durationOfReding;
  final List<RssItem>? items;
  final String? authorName;
  BlogModel(
      {required this.index,
      required this.date,
      required this.durationOfReding,
      required this.img,
      this.items,
      this.authorName,
      required this.title});
}
