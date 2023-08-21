// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class ServiceInfluencersViewController {
  late int serviceId;
  late ServiceProviderType serviceProviderType;
  late TabController tabController;
  RxList<Influencer> partners = RxList.empty();

  void init(
      {required int serviceId,
      required ServiceProviderType type,
      required TickerProvider vsync}) {
    this.serviceId = serviceId;
    serviceProviderType = type;
    tabController = TabController(length: 3, vsync: vsync);
    partners.value = mockInfluencers;
  }
}

enum SocialMediaPlatform { Facebook, Instagram, Tiktok, Youtube }

extension SocialMediaPlatformExtension on SocialMediaPlatform {
  IconData get icon {
    switch (this) {
      case SocialMediaPlatform.Facebook:
        return Ionicons.logo_facebook;
      case SocialMediaPlatform.Instagram:
        return Ionicons.logo_instagram;
      case SocialMediaPlatform.Tiktok:
        return Ionicons.logo_tiktok;
      case SocialMediaPlatform.Youtube:
        return Ionicons.logo_youtube;
      default:
        return Ionicons.help_circle_outline;
    }
  }
}

enum InfluenceCategory {
  Health,
  Makeup,
  Beauty,
  Food,
  Sports,
  Fashion,
  Travel,
  Lifestyle
}

enum InfluencePrice {
  InstagramStory,
  InstagramPost,
  TiktokVideo,
  YoutubeVideo,
}

class Influencer {
  String name;
  String image;
  String username;
  Map<SocialMediaPlatform, double> platforms;
  Map<InfluencePrice, double> prices;
  List<InfluenceCategory> categories;
  Influencer({
    required this.name,
    required this.username,
    required this.prices,
    required this.image,
    required this.platforms,
    required this.categories,
  });
}

List<Influencer> mockInfluencers = [
  Influencer(
    name: 'Alice Johnson',
    username: 'alice_j',
    image:
        'https://media.gettyimages.com/id/1313649377/photo/young-african-influencer-adjusting-her-smart-phone-before-a-vlog-post.jpg?s=612x612&w=0&k=20&c=eNLEcqtZi2UCNX4GGLck9j51e1yjtNR_-kcZXk9azFs=',
    platforms: {
      SocialMediaPlatform.Instagram: 150000,
      SocialMediaPlatform.Tiktok: 80000,
    },
    prices: {
      InfluencePrice.InstagramStory: 100,
      InfluencePrice.InstagramPost: 200,
      InfluencePrice.TiktokVideo: 150,
    },
    categories: [
      InfluenceCategory.Beauty,
      InfluenceCategory.Fashion,
      InfluenceCategory.Lifestyle,
    ],
  ),
  Influencer(
    name: 'David Smith',
    image:
        'https://media.gettyimages.com/id/1320778127/photo/young-influencer-and-z-generation-model-streaming-with-a-smartphone-and-microphone.jpg?s=612x612&w=0&k=20&c=bLX0QF5mt6ZtWXW0ROQ3I8fMaWzDogKjEeUV4dBgBxE=',
    username: 'david_s',
    platforms: {
      SocialMediaPlatform.Instagram: 120000,
      SocialMediaPlatform.Facebook: 80000,
      SocialMediaPlatform.Youtube: 50000,
    },
    prices: {
      InfluencePrice.InstagramStory: 80,
      InfluencePrice.InstagramPost: 150,
      InfluencePrice.YoutubeVideo: 200,
    },
    categories: [
      InfluenceCategory.Health,
      InfluenceCategory.Sports,
      InfluenceCategory.Lifestyle,
    ],
  ),
  // Add more mock influencers here...
];
