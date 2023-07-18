import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class Post {
  int id;
  int serviceProviderId;
  ServiceProviderType serviceProviderType;
  String? serviceProviderName;
  String? serviceProviderImage;
  String message;
  String? image;
  List<int> likes;
  List<Comment> comments;
  DateTime postedOn;
  String? link;

  Post({
    required this.id,
    required this.serviceProviderId,
    required this.serviceProviderType,
    this.serviceProviderName,
    this.serviceProviderImage,
    required this.message,
    required this.likes,
    required this.comments,
    required this.postedOn,
    this.image,
    this.link,
  });
}

class Comment {
  String message;
  DateTime? commentedOn;
  List<int> likes;

  Comment({
    required this.message,
    required this.likes,
    this.commentedOn,
  });
}

Comment commentFromJson(Map<String, dynamic> json) {
  return Comment(
    message: json['message'],
    likes: json['likes'].cast<int>(),
    commentedOn: DateTime.parse(json['commented_on']),
  );
}
