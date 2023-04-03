import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../components/AssetCard.dart';

class HomeServiceView extends StatefulWidget {
  const HomeServiceView({super.key});

  @override
  State<HomeServiceView> createState() => _HomeServiceViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(RentalRoutes.homeServiceRoute);
  }
}

class _HomeServiceViewState extends State<HomeServiceView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final List<IconData> tabs = [
    Icons.store,
    Icons.article_outlined,
    Icons.info_outline,
  ];
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              customAppBar(),
            ];
          },
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: TabBar(
                  tabs: [
                    for (int index = 0; index < tabs.length; index++)
                      Tab(
                        icon: Icon(tabs[index]),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CompanyDataList(),
                    CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Text("Tab 2 Data");
                            },
                            childCount: 5,
                          ),
                        )
                      ],
                    ),
                    Text("Tab 3 Data"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customAppBar() {
    final style = Theme.of(context).textTheme;
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      centerTitle: true,
      expandedHeight: 250,
      leadingWidth: 35,
      automaticallyImplyLeading: false,
      pinned: true,
      leading: backButtonAppBar(),
      actions: [
        MezIconButton(
          icon: Icons.history,
          onTap: () {},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.6,
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        title: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Text(
                      "Puetro Estate",
                      style: style.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        background: _backgroundImageComponent(),
      ),
    );
  }

  Widget _backgroundImageComponent() {
    return CachedNetworkImage(
      imageUrl: customImageUrl,
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
              Colors.white.withOpacity(0),
              Colors.black.withOpacity(0.1),
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
            "Error Name",
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

  Widget backButtonAppBar() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: InkWell(
          onTap: () {
            MezRouter.back();
          },
          child: Ink(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: primaryBlueColor,
                size: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CompanyDataList extends StatelessWidget {
  const CompanyDataList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                for (int index = 0; index < 5; index++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AssetCard(
                      title: "Home for rent in Av Juan Pablo II, Pu..",
                      image: NetworkImage(customImageUrl),
                      onClick: () {},
                      needCustomSubtitle: false,
                      needLeadingImage: true,
                      needTrailingImage: false,
                      needDivider: false,
                      needBottomTitleText: false,
                      subtitleIconData: [
                        aPriceCheck,
                        aSingleBed,
                        aHouseSliding,
                      ],
                      subtitleIconString: [
                        "\$234/day",
                        "3 bedrooms",
                        "330m²",
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
