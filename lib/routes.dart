
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:social_feed/view/feed/feed_screen.dart';
import 'package:social_feed/view/login_screen.dart';

class RouterHelper {
  static const String main = '/';
  static const String loginScreen = '/loginScreen';

  static String getMainRoute() => main;

  static List<GetPage> routes = [
    GetPage(name: main, page: () => const FeedScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen())
  ];
}