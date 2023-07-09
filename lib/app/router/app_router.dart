import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/auth/ui/login/login_page.dart';
import 'package:najeeb_academy/features/auth/ui/register/register_page.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/courses/presentation/pages/all_courses_page.dart';
import 'package:najeeb_academy/features/courses/presentation/pages/courses_page.dart';
import 'package:najeeb_academy/features/home/presentation/home_page.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/notifications/services/notifications_service.dart';
import 'package:najeeb_academy/features/notifications/ui/notifications_page.dart';
import 'package:najeeb_academy/features/payment/presentation/payments_page.dart';
import 'package:najeeb_academy/features/profile/presentation/profile_page.dart';
import 'package:najeeb_academy/features/video_player/presentation/video_player_page.dart';
import 'package:najeeb_academy/features/welcome/services/welcome_service.dart';
import 'package:najeeb_academy/features/welcome/welcome_page.dart';

import '../../features/main/main_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: WelcomePage,
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
      path: '',
      page: MainPage,
      children: [
        AutoRoute(path: '', page: HomePage),
        AutoRoute(path: 'courses', page: CoursesPage),
        AutoRoute(path: 'all-courses', page: AllCoursesPage),
        AutoRoute(path: 'payments', page: PaymentsPage),
        AutoRoute(path: 'profile', page: ProfilePage),
      ],
    ),
    
    // AutoRoute(
    //   path: '/all-courses',
    //   page: AllCoursesPage,
    // ),
    AutoRoute(path: '/lectures/video/:id', page: VideoPlayerPage),
    AutoRoute(
      path: '/notifications',
      page: NotificationsPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
