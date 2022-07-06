import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/WebApp/services/Models/blogModle.dart';
import 'package:webfeed/webfeed.dart';

class BolgController extends GetxController {
  List<String> _blogLinks = <String>[
    "https://nathikazad.wordpress.com/feed/",
    "https://www.nasa.gov/rss/dyn/breaking_news.rss",
    "https://abcnews.go.com/abcnews/usheadlines",
    'https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss',
    'https://www.nasa.gov/rss/dyn/educationnews.rss'
  ];
  RxList<BlogModel> blogs = <BlogModel>[].obs;

  @override
  void onInit() {
    getFeed();
    super.onInit();
  }

  Future<void> getFeed() async {
    for (var i = 0; i < _blogLinks.length; i++) {
      var url = Uri.parse('${_blogLinks[i]}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var channel = RssFeed.parse(response.body);

        String? img = null;
        for (var i = 0; i < channel.items!.length; i++) {
          if (channel.items?[i].content?.images.length != 0) {
            channel.items?[i].content?.images.forEach((element) {
              if (element != null) {
                img = element;
              }
            });
          }
        }
        if (img == null) {
          for (var i = 0; i < channel.items!.length; i++) {
            if (channel.items?[i].enclosure?.url != null) {
              img = channel.items?[i].enclosure?.url;
              // if (img != null) {
              //   break;
              // }
            }
          }
        }

        blogs.value.add(BlogModel(
            index: i,
            date: channel.lastBuildDate ?? DateTime.now().toString(),
            title: channel.items![0].title!,
            items: channel.items,
            authorName: channel.items![0].author ?? "Mezcalmos",
            img: img ??
                "https://images.pexels.com/photos/1591056/pexels-photo-1591056.jpeg",
            durationOfReding: "Read in 15 minutes"));
      } else {
        // do something
      }
    }
  }

  Future<BlogModel?> getBlogByID(int id) async {
    return blogs.value.firstWhere(
      (element) => element.index == id,
    );
  }
}
