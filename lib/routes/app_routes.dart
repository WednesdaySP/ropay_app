import 'package:get/get.dart';
import 'package:ropay_app/pages/bills/bills_page.dart';
import 'package:ropay_app/pages/device_Id/device_id_screen.dart';
import 'package:ropay_app/pages/device_selection/device_selection_screen.dart';
import 'package:ropay_app/pages/home_screen/home_screen.dart';
import 'package:ropay_app/pages/login_screen/login_screen.dart';
import 'package:ropay_app/pages/register/register_screen.dart';
import 'package:ropay_app/pages/settings/settings_screen.dart';
import 'package:ropay_app/pages/signIn/sign_in_screen.dart';
import 'package:ropay_app/pages/splash/splash_screen.dart';
import 'package:ropay_app/pages/subscription/subscription_page.dart';
import 'package:ropay_app/widgets/main_navigation.dart';
abstract class AppRoutes {
  static const register = '/register';
  static const login = '/login';
  static const home = '/home';
  static const deviceSelection = '/device-selection';
  static const bills = '/bills';
  static const subscriptions = '/subscriptions';
  static const settings = '/settings';
  static const deviceId = '/device-id';
  static const mainNavigation = '/mainNaviagtion';
  static const splashScreen = '/splash';
  static const signInScreen = '/signIn';

  static final routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: mainNavigation, page: () =>  MainNavigation()),
    GetPage(name: register, page: () => const RegisterPage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: deviceSelection, page: () => const DeviceSelectionPage()),
    GetPage(name: deviceId, page: ()=> const DeviceIdScreen()),
    GetPage(name: bills, page: () => const BillsPage()),
    GetPage(name: subscriptions, page: () => const SubscriptionsPage()),
    GetPage(name: settings, page: () => const SettingsPage()),
  ];
}