import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MezImageSlider extends StatefulWidget {
  final List<String> images;

  const MezImageSlider({Key? key, required this.images}) : super(key: key);

  @override
  _MezImageSliderState createState() => _MezImageSliderState();
}

class _MezImageSliderState extends State<MezImageSlider> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return _backgroundImageComponent(widget.images[index]);
            },
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (int index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.white
                      : Colors.grey.shade400,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _backgroundImageComponent(String image) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,
      imageBuilder: (BuildContext context, ImageProvider<Object> image) =>
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.black.withOpacity(0.8),
              const Color(0x00000000).withOpacity(0.1),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
      ),
      placeholder: (_, __) {
        return Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            height: double.infinity,
          ),
          highlightColor: Colors.grey[400]!,
          enabled: true,
          //   period: Duration(milliseconds: 100),
          baseColor: Colors.grey[300]!,
          direction: ShimmerDirection.ltr,
        );
      },
      errorWidget: (_, __, ___) {
        return Container(
          height: 63,
          width: 63,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            "ERROR",
            style: const TextStyle(
              color: Color.fromRGBO(172, 89, 252, 0.8),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
