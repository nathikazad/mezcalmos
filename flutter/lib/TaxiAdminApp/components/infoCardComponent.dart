import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoCardComponent extends StatelessWidget {
  final String? title_0;
  final String? subTitle_0;
  final String? title_0_1;
  final String? subTitle_0_1;
  final String? title_1_0;
  final String? subTitle_1_0;
  final String? title_1_1;
  final String? subTitle_1_1;
  final String? title_2_0;
  final String? subTitle_2_0;
  final String? title_2_1;
  final String? subTitle_2_1;
  final String? title_3_0;
  final String? subTitle_3_0;
  final String? subTitle_3_1;
  final String? subTitle_3_2;
  InfoCardComponent(
      {this.title_0,
      this.subTitle_0,
      this.title_0_1,
      this.subTitle_0_1,
      this.title_1_0,
      this.subTitle_1_0,
      this.title_1_1,
      this.subTitle_1_1,
      this.title_2_0,
      this.subTitle_2_0,
      this.title_2_1,
      this.subTitle_2_1,
      this.title_3_0,
      this.subTitle_3_0,
      this.subTitle_3_1,
      this.subTitle_3_2});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16,
            ),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(155, 178, 254, 1),
              Color.fromRGBO(223, 153, 253, 1),
              Color.fromRGBO(242, 217, 217, 1)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemWidget([
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title_0",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: Get.width * 0.34,
                            child: Text(
                              "$subTitle_0",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Expanded(flex: 1, child: Container()),
                  itemWidget([
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title_0_1",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: 100,
                              child: Text(
                                "$subTitle_0_1",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    )
                  ]),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemWidget([
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title_1_0",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$subTitle_1_0",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Expanded(flex: 1, child: Container()),
                  itemWidget([
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title_1_1",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: 100,
                              child: Text(
                                "$subTitle_1_1",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    )
                  ]),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemWidget([
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title_2_0",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$subTitle_2_0",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Expanded(flex: 1, child: Container()),
                  itemWidget([
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title_2_1",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: 100,
                              child: Text(
                                "$subTitle_2_1",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    )
                  ]),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$title_3_0",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Text(
                      "$subTitle_3_0",
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    child: Text(
                      "$subTitle_3_1",
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    child: Text(
                      "$subTitle_3_2",
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemWidget(List<Widget> x) {
  return Expanded(
    flex: 3,
    child: Container(
      child: Column(
        children: [
          Row(children: x),
        ],
      ),
    ),
  );
}
