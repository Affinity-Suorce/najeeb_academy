import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/pages/welcome/welcome_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomePage, initial: true, path: '/'),
  ],
)
class AppRouter extends _$AppRouter {}
