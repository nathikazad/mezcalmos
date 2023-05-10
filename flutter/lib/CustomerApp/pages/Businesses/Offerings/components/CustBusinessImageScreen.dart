import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustBusinessImageScreen extends StatefulWidget {
  const CustBusinessImageScreen({super.key});

  @override
  State<CustBusinessImageScreen> createState() =>
      _CustBusinessImageScreenState();

  static Future<void> navigate({required List<String> images}) {
    return MezRouter.toPath(
      CustBusinessRoutes.custImageViewRoute,
      arguments: {
        "images": images,
      },
    );
  }
}

class _CustBusinessImageScreenState extends State<CustBusinessImageScreen> {
  List<String> images = [];
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    images = MezRouter.bodyArguments!["images"] as List<String>;
    _pageController = PageController(initialPage: _currentPage);
  }

  void animate() {
    _pageController.animateToPage(
      _currentPage,
      duration: Duration(
        milliseconds: 400,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return _backgroundImageComponent(images[index]);
                },
              ),
            ),
            _CloseButton(),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxHeight: 40,
                      maxWidth: 40,
                    ),
                    decoration: BoxDecoration(
                      color:
                          _currentPage == 0 ? Colors.white : primaryBlueColor,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      child: Icon(
                        Icons.chevron_left,
                        size: 25,
                        color:
                            _currentPage == 0 ? primaryBlueColor : Colors.white,
                      ),
                      onTap: () {
                        if (_currentPage == 0) {
                          return;
                        }
                        setState(() {
                          _currentPage--;
                          animate();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxHeight: 40,
                      maxWidth: 40,
                    ),
                    decoration: BoxDecoration(
                      color: _currentPage == images.length - 1
                          ? Colors.white
                          : primaryBlueColor,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      child: Icon(
                        Icons.chevron_right,
                        size: 25,
                        color: _currentPage == images.length - 1
                            ? primaryBlueColor
                            : Colors.white,
                      ),
                      onTap: () {
                        if (_currentPage == images.length - 1) {
                          return;
                        }
                        setState(() {
                          _currentPage++;
                          animate();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _CloseButton() {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxHeight: 40,
          maxWidth: 40,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          child: Icon(
            Icons.close,
            size: 25,
            color: primaryBlueColor,
          ),
          onTap: () {
            MezRouter.back();
          },
        ),
      ),
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
