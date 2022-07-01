import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/WebApp/services/Models/blogModle.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';

class BlogPartComponent extends StatelessWidget {
  BlogPartComponent({Key? key}) : super(key: key);
  final LanguageController langController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getSpaceOnTop(context),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MezCalmosResizer.getWepPageHorizontalPadding(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Obx(
                () => Text(
                  "${langController.strings["WebApp"]["blogTitle"]}",
                  style: txt.headline1!.copyWith(
                      fontSize: getSizeForTitle(context),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                      color: Colors.black),
                ),
              ),
              Spacer(),
              Obx(
                () => Text(
                  "${langController.strings["WebApp"]["showAll"]}",
                  style: txt.headline1!.copyWith(
                      fontSize: getSizeShowMoreText(context),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      fontFamily: "Montserrat",
                      color: Color.fromRGBO(103, 121, 254, 1)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 11.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MezCalmosResizer.isMobile(context)
                  ? MezCalmosResizer.getWepPageHorizontalPadding(context)
                  : (MezCalmosResizer.getWepPageHorizontalPadding(context) -
                      20)),
          child: GetBolgsGridList(context),
        ),
      ],
    );
  }

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 7.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 15.sp;
    } else {
      return 0;
    }
  }

  double getSizeShowMoreText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 8.sp;
    } else {
      return 0;
    }
  }

  double getSpaceOnTop(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 15.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 14.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 25.sp;
    } else {
      return 0;
    }
  }
}

List<BlogModel> blogs = <BlogModel>[
  BlogModel(
    date: "8 June",
    img: "https://images.pexels.com/photos/45980/pexels-photo-45980.jpeg",
    title: "6 REASONS WHY YOU SHOULD SWITCH TO A WASH AND FOLD SERVICE",
    durationOfReding: "Read in 15 minutes",
  ),
  BlogModel(
    date: "25 May",
    img: "https://images.pexels.com/photos/5317182/pexels-photo-5317182.jpeg",
    title: "SPRING SALAD WITH HOMEMADE GREEN GODDESS DRESSING",
    durationOfReding: "Read in 15 minutes",
  ),
  BlogModel(
    date: "15 May",
    img: "https://images.pexels.com/photos/6461325/pexels-photo-6461325.jpeg",
    title: "LAUNDRY TIPS TO KEEP YOUR CLOTHES LAST-LONG & LOOKING THEIR BEST",
    durationOfReding: "Read in 15 minutes",
  )
];
Widget GetBolgsGridList(BuildContext context) {
  return Container(
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MezCalmosResizer.isMobile(context) ? 2 : 3,
      ),
      itemCount: blogs.length,
      itemBuilder: (BuildContext context, int index) {
        return BlogCardComponent(
          title: blogs[index].title,
          imgURL: blogs[index].img,
          readingTime: blogs[index].durationOfReding,
          date: blogs[index].date,
        );
      },
    ),
  );
}

class BlogCardComponent extends StatelessWidget {
  BlogCardComponent(
      {Key? key,
      required this.imgURL,
      required this.title,
      required this.date,
      required this.readingTime})
      : super(key: key);
  final String imgURL;
  final String title;
  final String date;
  final String readingTime;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: MezCalmosResizer.isMobile(context) ? 75.sp : 50.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imgURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
            child: Text(
              date,
              style: txt.subtitle1!.copyWith(
                fontSize: getSizeForDateText(context),
                color: Colors.grey,
                fontFamily: "Nunito",
              ),
            ),
          ),
          SizedBox(
            height: MezCalmosResizer.isMobile(context) ? 10 : 15,
          ),
          Flexible(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: txt.bodyText1!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat",
                  fontSize: getSizeForTitle(context)),
            ),
          ),
          SizedBox(
            height: MezCalmosResizer.isMobile(context) ? 15 : 20,
          ),
          Text(
            readingTime,
            style: txt.bodySmall!.copyWith(
                color: Color.fromRGBO(103, 121, 254, 1),
                fontSize: getSizeForTimeOrReadingText(context),
                decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 5.sp;
    } else {
      return 7.sp;
    }
  }

  double getSizeForDateText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 5.sp;
    } else {
      return 0;
    }
  }

  double getSizeForTimeOrReadingText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 7.sp;
    } else {
      return 0;
    }
  }
}
