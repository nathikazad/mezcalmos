import 'package:mezcalmos/WebApp/screens/AuthScreen/SignInScreen/SignInScreen.dart'
    deferred as signIn;
import 'package:mezcalmos/WebApp/screens/AuthScreen/VerificationScreen/verificationScreen.dart'
    deferred as verification;
import 'package:mezcalmos/WebApp/routes/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AuthRoutes {
  static const String signInScreen = "signIn";
  static const String verificationScreen = "verification";

  final routes = QRoute(
      // this will define how to find this route with [QR.to]
      path: '/signIn',
      // this will define how to find this route with [QR.toName]
      name: signInScreen,
      // The page to show when this route is called
      builder: () => signIn.SignInScreen(),
      middleware: [
        DefferedLoader(signIn.loadLibrary)
      ],
      children: [
        QRoute(
          path: '/verification',
          name: verificationScreen,
          middleware: [DefferedLoader(verification.loadLibrary)],
          builder: () => verification.VerificationScreen(),
        )
      ]);
}
