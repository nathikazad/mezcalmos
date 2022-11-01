import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/WebApp/services/Models/blogModle.dart';
import 'package:webfeed/webfeed.dart';

class BolgController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  List<String> _blogLinks = <String>[
    "https://core1998.herokuapp.com/feeds?url=https://nathikazad.wordpress.com/feed/",
  ];
  RxList<BlogModel> blogs = <BlogModel>[].obs;

  @override
  void onInit() {
    getFeeds();

    super.onInit();
  }

  Future<List<BlogModel>> getFeeds() async {
    List<BlogModel> _blogs = <BlogModel>[];

    int index = 0;
    await _databaseHelper.firebaseDatabase
        .ref()
        .child('blog')
        .once()
        .then<dynamic>((event) {
      try {
        var value = event.snapshot.value as dynamic;
        value["items"].forEach((dynamic val) {
          _blogs.add(BlogModel(
              index: index,
              date: _getDate(val["pubDate"] ?? DateTime.now().toString()),
              title: val["title"],
              content: val["content"],
              authorName: val["author"] ?? "Mezcalmos",
              img: val["image"] ??
                  "https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/webApp%2FnathikBlogImg.jpeg?alt=media&token=971f4974-51c2-4a87-bc6d-7634b1c5a263",
              durationOfReding: "Read in 15 minutes"));
        });
      } catch (e) {
        print(e);
      }
    });
    blogs.value = _blogs;
    return _blogs;
  }

  // Future<void> getFeed() async {
  //   for (var i = 0; i < _blogLinks.length; i++) {
  //     final url = Uri.parse('${_blogLinks[i]}');
  //     final response = await http.get(
  //       url,
  //     );

  //     if (response.statusCode == 200) {
  //       var channel = RssFeed.parse(response.body);

  //       String? img = null;
  //       for (var i = 0; i < channel.items!.length; i++) {
  //         if (channel.items?[i].content?.images.length != 0) {
  //           channel.items?[i].content?.images.forEach((element) {
  //             if (element != null) {
  //               img = element;
  //             }
  //           });
  //         }
  //       }
  //       if (img == null) {
  //         for (var i = 0; i < channel.items!.length; i++) {
  //           if (channel.items?[i].enclosure?.url != null) {
  //             img = channel.items?[i].enclosure?.url;
  //             // if (img != null) {
  //             //   break;
  //             // }
  //           }
  //         }
  //       }

  //       blogs.value.add(BlogModel(
  //           index: i,
  //           date: channel.lastBuildDate ?? DateTime.now().toString(),
  //           title: channel.items![0].title!,
  //           content: "",
  //           authorName: channel.items![0].author ?? "Mezcalmos",
  //           img: img ??
  //               "https://images.pexels.com/photos/1591056/pexels-photo-1591056.jpeg",
  //           durationOfReding: "Read in 15 minutes"));
  //     } else {
  //       // do something
  //     }
  //   }
  // }

  Future<BlogModel?> getBlogByID(int id) async {
    return blogs.value.firstWhere(
      (element) => element.index == id,
    );
  }

  String _getDate(String date) {
    try {
      var ddd = DateTime.parse(date);
      return DateFormat(
        'd MMMM y',
      ).format(ddd);
    } catch (e) {
      var x = date.split(" ");
      var dateTime = DateFormat(
        'd MMM y',
      ).parse("${x[1]} ${x[2]} ${x[3]}");
      return DateFormat(
        'd MMMM y',
      ).format(dateTime);
    }
  }
}
