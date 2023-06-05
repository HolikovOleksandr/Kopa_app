import 'package:kopa/src/ui/screens/login/phone_auth_screen.dart';
import 'package:kopa/src/ui/screens/home/tabs/fovorite_page.dart';
import 'package:kopa/src/ui/screens/unknown/unknown_page.dart';
import 'package:kopa/src/ui/screens/splash/splash_screen.dart';
import 'package:kopa/src/ui/screens/home/tabs/user_page.dart';
import 'package:kopa/src/ui/screens/login/login_screen.dart';
import 'package:kopa/src/ui/screens/home/tab_screen.dart';
import 'package:kopa/router/route_pathes.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(
    name: AppRouter.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRouter.loginScreen,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: AppRouter.phoneAuthScreen,
    page: () => const PhoneAuthScreen(),
  ),
  GetPage(
    name: AppRouter.homeScreen,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRouter.favoriteScreen,
    page: () => const FavoritePage(),
  ),
  GetPage(
    name: AppRouter.userProfile,
    page: () => const ProfilePage(),
  ),
  // GetPage(
  //   name: AppRouter.productDescription,
  //   page: () => const ProductDescripton(),
  // ),
];

const String rootRoute = AppRouter.splashScreen;

final unknownRoute = GetPage(
  name: AppRouter.unknownScreen,
  page: () => const UnknownPage(),
);
