// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart' as review;

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

extension InfluencePriceExtension on InfluencePrice {
  IconData get icon {
    switch (this) {
      case InfluencePrice.InstagramPost:
      case InfluencePrice.InstagramStory:
        return Ionicons.logo_instagram;
      case InfluencePrice.TiktokVideo:
        return Ionicons.logo_tiktok;
      case InfluencePrice.YoutubeVideo:
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
  Lifestyle,
  Fitness,
  Technology,
  Gaming
}

enum InfluencerState { Waiting, Partner, None, RequestSentByInfluencer }

enum InfluencePrice {
  InstagramStory,
  InstagramPost,
  TiktokVideo,
  YoutubeVideo,
}

class Influencer {
  int id;
  String name;
  double rate;
  String description;
  String image;
  String username;
  InfluencerState state;
  Map<SocialMediaPlatform, double> platforms;
  Map<InfluencePrice, double> prices;
  List<InfluenceCategory> categories;
  List<SalesIncrease> saleIncreases;
  List<review.Review> reviews;
  Influencer({
    required this.id,
    required this.name,
    this.rate = 4.3,
    required this.reviews,
    required this.state,
    required this.saleIncreases,
    required this.description,
    required this.username,
    required this.prices,
    required this.image,
    required this.platforms,
    required this.categories,
  });

  num get totalSalesIncrease {
    num totalIncrease = 0;
    for (SalesIncrease saleIncrease in saleIncreases) {
      totalIncrease += saleIncrease.increaseValue;
    }
    return totalIncrease;
  }
}

class SalesIncrease {
  String serviceName;
  String serviceImage;
  num increaseValue;
  SalesIncrease({
    required this.serviceName,
    required this.serviceImage,
    required this.increaseValue,
  });
}

List<Influencer> mockInfluencers = [
  Influencer(
    id: 0,
    state: InfluencerState.Partner,
    name: 'Alice Johnson',
    description:
        "Born in Cuernavaca, Morelos, Mexico. Her given name, Mariand, is a combination of her parents' names, Maribel and Andrés.",
    username: 'alice_j',
    image:
        'https://media.gettyimages.com/id/1313649377/photo/young-african-influencer-adjusting-her-smart-phone-before-a-vlog-post.jpg?s=612x612&w=0&k=20&c=eNLEcqtZi2UCNX4GGLck9j51e1yjtNR_-kcZXk9azFs=',
    platforms: {
      SocialMediaPlatform.Instagram: 170000,
      SocialMediaPlatform.Tiktok: 90000,
    },
    saleIncreases: [
      SalesIncrease(
          serviceName: "FitLife",
          serviceImage:
              "https://t4.ftcdn.net/jpg/01/11/97/03/360_F_111970319_8UEeH6AAEa8vWnc5TVUCPhKKsYtLzm5y.jpg",
          increaseValue: 500),
      SalesIncrease(
          serviceName: "HealthyEats",
          serviceImage:
              "https://media.istockphoto.com/id/1038356020/vector/restaurant-icon.jpg?s=612x612&w=0&k=20&c=Tk_v3JuJA4lz_8ZRJi78xS4p75Idqt97uEtYJciVtFI=",
          increaseValue: 120)
    ],
    prices: {
      InfluencePrice.InstagramStory: 110,
      InfluencePrice.InstagramPost: 210,
      InfluencePrice.TiktokVideo: 160,
    },
    categories: [
      InfluenceCategory.Beauty,
      InfluenceCategory.Fashion,
      InfluenceCategory.Lifestyle,
    ],
    rate: 4.2,
    reviews: [
      review.Review(
          rating: 4,
          fromEntityId: 0,
          reviewTime: DateTime.now(),
          fromEntityType: ServiceProviderType.Customer,
          toEntityId: 0,
          fromName: "Montassare",
          toEntityType: ServiceProviderType.Customer,
          comment: "Great collaboration, looking forward to more!")
    ],
  ),
  Influencer(
    id: 1,
    state: InfluencerState.Partner,
    rate: 4.8,
    name: 'David Smith',
    description:
        "Born in Cuernavaca, Morelos, Mexico. His given name, Mariand, is a combination of his parents' names, Maribel and Andrés.",
    image:
        'https://media.gettyimages.com/id/1320778127/photo/young-influencer-and-z-generation-model-streaming-with-a-smartphone-and-microphone.jpg?s=612x612&w=0&k=20&c=bLX0QF5mt6ZtWXW0ROQ3I8fMaWzDogKjEeUV4dBgBxE=',
    username: 'david_s',
    platforms: {
      SocialMediaPlatform.Instagram: 30000,
      SocialMediaPlatform.Facebook: 75000,
      SocialMediaPlatform.Youtube: 60000,
    },
    prices: {
      InfluencePrice.InstagramStory: 60,
      InfluencePrice.InstagramPost: 120,
      InfluencePrice.YoutubeVideo: 180,
    },
    categories: [
      InfluenceCategory.Health,
      InfluenceCategory.Sports,
      InfluenceCategory.Lifestyle,
    ],
    saleIncreases: [
      SalesIncrease(
          serviceName: "FitLife",
          serviceImage:
              "https://t4.ftcdn.net/jpg/01/11/97/03/360_F_111970319_8UEeH6AAEa8vWnc5TVUCPhKKsYtLzm5y.jpg",
          increaseValue: 500),
      SalesIncrease(
          serviceName: "HealthyEats",
          serviceImage:
              "https://media.istockphoto.com/id/1038356020/vector/restaurant-icon.jpg?s=612x612&w=0&k=20&c=Tk_v3JuJA4lz_8ZRJi78xS4p75Idqt97uEtYJciVtFI=",
          increaseValue: 120)
    ],
    reviews: [
      review.Review(
          rating: 4.8,
          fromEntityId: 2,
          reviewTime: DateTime.now(),
          fromEntityType: ServiceProviderType.Customer,
          toEntityId: 2,
          fromName: "Sophia",
          toEntityType: ServiceProviderType.Customer,
          comment: "Absolutely outstanding experience, recommended!")
    ],
  ),
  Influencer(
    id: 3,
    state: InfluencerState.RequestSentByInfluencer,
    name: 'Olivia Martinez',
    description:
        "Born in Guadalajara, Jalisco, Mexico. Her given name, Mariand, is a combination of her parents' names, Maribel and Andrés.",
    username: 'alice_j',
    image:
        'https://cdn.pixabay.com/photo/2019/03/26/04/30/influencer-4081842_640.jpg',
    platforms: {
      SocialMediaPlatform.Instagram: 160000,
      SocialMediaPlatform.Tiktok: 85000,
    },
    prices: {
      InfluencePrice.InstagramStory: 90,
      InfluencePrice.InstagramPost: 190,
      InfluencePrice.TiktokVideo: 140,
    },
    saleIncreases: [
      SalesIncrease(
          serviceName: "FitLife",
          serviceImage:
              "https://t4.ftcdn.net/jpg/01/11/97/03/360_F_111970319_8UEeH6AAEa8vWnc5TVUCPhKKsYtLzm5y.jpg",
          increaseValue: 500),
      SalesIncrease(
          serviceName: "HealthyEats",
          serviceImage:
              "https://media.istockphoto.com/id/1038356020/vector/restaurant-icon.jpg?s=612x612&w=0&k=20&c=Tk_v3JuJA4lz_8ZRJi78xS4p75Idqt97uEtYJciVtFI=",
          increaseValue: 120)
    ],
    categories: [
      InfluenceCategory.Fashion,
      InfluenceCategory.Lifestyle,
    ],
    rate: 4.1,
    reviews: [
      review.Review(
          rating: 4.5,
          fromEntityId: 3,
          reviewTime: DateTime.now(),
          fromEntityType: ServiceProviderType.Customer,
          toEntityId: 3,
          fromName: "Luis",
          toEntityType: ServiceProviderType.Customer,
          comment: "Pleasure working together, exceeded expectations!")
    ],
  ),
  Influencer(
    id: 5,
    state: InfluencerState.None,
    rate: 4.7,
    name: 'Sophia Anderson',
    description:
        "Born in Los Angeles, California, USA. Her unique style and creativity make her stand out.",
    image:
        'https://media.gettyimages.com/id/947989088/photo/attractive-woman-vlogging-from-vienna.jpg?s=612x612&w=0&k=20&c=6_OsztkQX1np_SHkcxZVZ4wYa7sy37Esbp6LosvAgvY=',
    username: 'sophia_a',
    platforms: {
      SocialMediaPlatform.Instagram: 190000,
      SocialMediaPlatform.Tiktok: 110000,
    },
    prices: {
      InfluencePrice.InstagramStory: 120,
      InfluencePrice.InstagramPost: 220,
      InfluencePrice.TiktokVideo: 170,
    },
    categories: [
      InfluenceCategory.Fashion,
      InfluenceCategory.Lifestyle,
      InfluenceCategory.Travel,
    ],
    saleIncreases: [
      SalesIncrease(
          serviceName: "FitLife",
          serviceImage:
              "https://t4.ftcdn.net/jpg/01/11/97/03/360_F_111970319_8UEeH6AAEa8vWnc5TVUCPhKKsYtLzm5y.jpg",
          increaseValue: 500),
      SalesIncrease(
          serviceName: "HealthyEats",
          serviceImage:
              "https://media.istockphoto.com/id/1038356020/vector/restaurant-icon.jpg?s=612x612&w=0&k=20&c=Tk_v3JuJA4lz_8ZRJi78xS4p75Idqt97uEtYJciVtFI=",
          increaseValue: 120)
    ],
    reviews: [
      review.Review(
          rating: 4.7,
          fromEntityId: 0,
          reviewTime: DateTime.now(),
          fromEntityType: ServiceProviderType.Customer,
          toEntityId: 0,
          fromName: "Emma",
          toEntityType: ServiceProviderType.Customer,
          comment: "Amazing collaboration, brought my vision to life!")
    ],
  ),
  Influencer(
    id: 12,
    state: InfluencerState.None,
    rate: 4.2,
    name: 'Daniel Brown',
    description:
        "Based in New York City, Michael is a tech enthusiast and lifestyle influencer.",
    image:
        'https://media.istockphoto.com/id/1213200051/photo/friendly-young-man-vlogging.jpg?s=612x612&w=0&k=20&c=47s6XzsHCKyKNt5mCTCjAqiLRtPoWI0nggQ6q9JrK8g=',
    username: 'michael_j',
    platforms: {
      SocialMediaPlatform.Instagram: 28000,
      SocialMediaPlatform.Youtube: 55000,
    },
    prices: {
      InfluencePrice.InstagramStory: 70,
      InfluencePrice.InstagramPost: 130,
      InfluencePrice.YoutubeVideo: 190,
    },
    categories: [
      InfluenceCategory.Technology,
      InfluenceCategory.Lifestyle,
      InfluenceCategory.Gaming,
    ],
    saleIncreases: [
      SalesIncrease(
          serviceName: "FitLife",
          serviceImage:
              "https://t4.ftcdn.net/jpg/01/11/97/03/360_F_111970319_8UEeH6AAEa8vWnc5TVUCPhKKsYtLzm5y.jpg",
          increaseValue: 500),
      SalesIncrease(
          serviceName: "HealthyEats",
          serviceImage:
              "https://media.istockphoto.com/id/1038356020/vector/restaurant-icon.jpg?s=612x612&w=0&k=20&c=Tk_v3JuJA4lz_8ZRJi78xS4p75Idqt97uEtYJciVtFI=",
          increaseValue: 120)
    ],
    reviews: [
      review.Review(
          rating: 4.2,
          fromEntityId: 2,
          reviewTime: DateTime.now(),
          fromEntityType: ServiceProviderType.Customer,
          toEntityId: 2,
          fromName: "Chris",
          toEntityType: ServiceProviderType.Customer,
          comment: "Invaluable insights, will definitely collaborate again!")
    ],
  ),
];
