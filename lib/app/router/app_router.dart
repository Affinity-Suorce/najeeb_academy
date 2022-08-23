import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:najeeb_academy/features/auth/ui/register/register_page.dart';
import 'package:najeeb_academy/pages/welcome/welcome_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomePage, initial: true, path: '/'),
    // AutoRoute(page: WelcomePage, initial: true, path: '/login'),
    AutoRoute(
      page: RegisterPage,
      initial: true,
      path: '/register',
      fullscreenDialog: true,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
