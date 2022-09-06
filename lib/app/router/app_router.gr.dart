// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const WelcomePage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: LoginPage(key: args.key),
          fullscreenDialog: true);
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: RegisterPage(key: args.key),
          fullscreenDialog: true);
    },
    MainRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const MainPage());
    },
    CoursesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const CoursesPage());
    },
    AllCoursesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const AllCoursesPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/welcome', fullMatch: true),
        RouteConfig(WelcomeRoute.name, path: '/welcome'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(RegisterRoute.name, path: '/register'),
        RouteConfig(MainRoute.name, path: '/main'),
        RouteConfig(CoursesRoute.name, path: '/courses'),
        RouteConfig(AllCoursesRoute.name, path: '/all-courses')
      ];
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({Key? key})
      : super(LoginRoute.name, path: '/login', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({Key? key})
      : super(RegisterRoute.name,
            path: '/register', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [CoursesPage]
class CoursesRoute extends PageRouteInfo<void> {
  const CoursesRoute() : super(CoursesRoute.name, path: '/courses');

  static const String name = 'CoursesRoute';
}

/// generated route for
/// [AllCoursesPage]
class AllCoursesRoute extends PageRouteInfo<void> {
  const AllCoursesRoute() : super(AllCoursesRoute.name, path: '/all-courses');

  static const String name = 'AllCoursesRoute';
}
