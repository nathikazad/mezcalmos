import 'package:mezcalmos/WebApp/screens/UserProfile/userProfile.dart';
import 'package:qlevar_router/qlevar_router.dart';

class UserProfileRoute {
  static const String userProfile = "profile";

  final routes = QRoute(
      // this will define how to find this route with [QR.to]
      path: '/profile',
      // this will define how to find this route with [QR.toName]
      name: userProfile,
      // The page to show when this route is called
      builder: () => const UserProfile(),
      children: []);
}
