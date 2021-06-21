import 'package:get/get.dart'; // getX
import 'package:mezcalmos/TaxiApp/bindings/orderBinding.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SignUpScreen.dart';

// Widgets 
import 'package:mezcalmos/TaxiApp/pages/HomeScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/SplashScreen.dart';



// Routes Keys.
const String kMainRoute                 = '/';
const String kSplashRoute               = '/splash';
const String kSignInRoute               = '/sign_in';
const String kSignUpRoute               = '/sign_up';


// GetX based Router (For navigating)
class XRouter {

  static dynamic mainRoutes = [
    GetPage(name: kMainRoute , page: () => HomeScreen() , binding: OrderBinding()),
    GetPage(name: kSplashRoute , page: () => SplashScreen()),
    GetPage(name: kSignInRoute , page: () => SignIn()),
    GetPage(name: kSignUpRoute , page: () => SignUp())
  ];

}
