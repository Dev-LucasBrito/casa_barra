import 'package:app_votacao/context/auth/pages/login_page.dart';
import 'package:app_votacao/context/auth/pages/register_page.dart';
import 'package:app_votacao/context/home/pages/home_pages.dart';
import 'package:app_votacao/context/splash/page/splash_page.dart';
import 'package:app_votacao/context/votacao/page/votacao_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.register,
        page: () => const RegisterPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomePage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.votacao,
        page: () => const VotacaoPage(),
        transition: Transition.rightToLeft),
  ];
}
