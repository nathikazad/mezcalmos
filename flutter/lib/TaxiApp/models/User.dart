import 'package:firebase_auth/firebase_auth.dart' as fireAuth;

class User {
  String uid;
  String email;
  String displayName;
  String image;

  User(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.image});

  // Get props as list.
  List<Object> get props => [uid, email, displayName, image];

  // Removed parse from json , Since we will be working with Snapshots
  User.fromSnapshot(fireAuth.User user)
      : uid = user.uid,
        email = user.email!,
        displayName = user.displayName!,
        image = user.photoURL!;
  // id                  = snapshot.key ?? "",
  // customer            = snapshot.value['customer'],
  // estimatedPrice      = snapshot.value['estimatedPrice'],
  // from                = snapshot.value['from'],
  // to                  = snapshot.value['to'],
  // orderTime           = snapshot.value['orderTime'],
  // paymentType         = snapshot.value['paymentType'],
  // routeInformation    = snapshot.value['routeInformation'];

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() =>
      {"uid": uid, "email": email, "displayName": displayName, "image": image};
}
