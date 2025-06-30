import 'package:get/get.dart';
import 'package:ropay_app/pages/analytics/analytics_page.dart';
import 'package:ropay_app/pages/device_selection/device_selection_screen.dart';
import 'package:ropay_app/pages/home_screen/home_screen.dart';
import 'package:ropay_app/pages/login_screen/login_screen.dart';
import 'package:ropay_app/pages/register/register_screen.dart';
import 'package:ropay_app/pages/settings/settings_screen.dart';
import 'package:ropay_app/pages/subscription/subscription_page.dart';
abstract class AppRoutes {
  static const register = '/register';
  static const login = '/login';
  static const home = '/home';
  static const deviceSelection = '/device-selection';
  static const analytics = '/analytics';
  static const subscriptions = '/subscriptions';
  static const settings = '/settings';

  static final routes = [
    GetPage(name: register, page: () => const RegisterPage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: deviceSelection, page: () => const DeviceSelectionPage()),
    GetPage(name: analytics, page: () => const AnalyticsPage()),
    GetPage(name: subscriptions, page: () => const SubscriptionsPage()),
    GetPage(name: settings, page: () => const SettingsPage()),
  ];
}