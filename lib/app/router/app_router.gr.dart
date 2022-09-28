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
    AllCoursesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const AllCoursesPage());
    },
    VideoPlayerRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<VideoPlayerRouteArgs>(
          orElse: () => VideoPlayerRouteArgs(id: pathParams.getString('id')));
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: VideoPlayerPage(key: args.key, id: args.id));
    },
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    CoursesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const CoursesPage());
    },
    LecturesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const LecturesPage());
    },
    PaymentsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PaymentsPage());
    },
    ProfileRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ProfilePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/welcome', fullMatch: true),
        RouteConfig(WelcomeRoute.name, path: '/welcome'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(RegisterRoute.name, path: '/register'),
        RouteConfig(MainRoute.name, path: '', children: [
          RouteConfig(HomeRoute.name, path: '', parent: MainRoute.name),
          RouteConfig(CoursesRoute.name,
              path: 'courses', parent: MainRoute.name),
          RouteConfig(LecturesRoute.name,
              path: 'lectures', parent: MainRoute.name),
          RouteConfig(PaymentsRoute.name,
              path: 'payments', parent: MainRoute.name),
          RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainRoute.name)
        ]),
        RouteConfig(AllCoursesRoute.name, path: '/all-courses'),
        RouteConfig(VideoPlayerRoute.name, path: '/lectures/video/:id')
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
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, path: '', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [AllCoursesPage]
class AllCoursesRoute extends PageRouteInfo<void> {
  const AllCoursesRoute() : super(AllCoursesRoute.name, path: '/all-courses');

  static const String name = 'AllCoursesRoute';
}

/// generated route for
/// [VideoPlayerPage]
class VideoPlayerRoute extends PageRouteInfo<VideoPlayerRouteArgs> {
  VideoPlayerRoute({Key? key, required String id})
      : super(VideoPlayerRoute.name,
            path: '/lectures/video/:id',
            args: VideoPlayerRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'VideoPlayerRoute';
}

class VideoPlayerRouteArgs {
  const VideoPlayerRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'VideoPlayerRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [CoursesPage]
class CoursesRoute extends PageRouteInfo<void> {
  const CoursesRoute() : super(CoursesRoute.name, path: 'courses');

  static const String name = 'CoursesRoute';
}

/// generated route for
/// [LecturesPage]
class LecturesRoute extends PageRouteInfo<void> {
  const LecturesRoute() : super(LecturesRoute.name, path: 'lectures');

  static const String name = 'LecturesRoute';
}

/// generated route for
/// [PaymentsPage]
class PaymentsRoute extends PageRouteInfo<void> {
  const PaymentsRoute() : super(PaymentsRoute.name, path: 'payments');

  static const String name = 'PaymentsRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
