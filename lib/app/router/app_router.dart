import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/all_courses/all_courses_page.dart';
import 'package:najeeb_academy/features/auth/ui/login/login_page.dart';
import 'package:najeeb_academy/features/auth/ui/register/register_page.dart';
import 'package:najeeb_academy/features/courses/courses_page.dart';
import 'package:najeeb_academy/features/welcome/welcome_page.dart';

import '../../features/main/main_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: WelcomePage,
      initial: true,
      path: '/welcome',
    ),
    AutoRoute(
      page: LoginPage,
      initial: true,
      path: '/login',
      fullscreenDialog: true,
    ),
    AutoRoute(
      page: RegisterPage,
      path: '/register',
      fullscreenDialog: true,
    ),
    AutoRoute(
      path: '/main',
      page: MainPage,
    ),
    AutoRoute(
      path: '/courses',
      page: CoursesPage,
    ),
    AutoRoute(
      path: '/all-courses',
      page: AllCoursesPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
