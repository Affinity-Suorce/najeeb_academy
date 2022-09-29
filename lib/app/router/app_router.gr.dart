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
      final args = routeData.argsAs<WelcomeRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: WelcomePage(
              key: args.key, service: args.service, lastPage: args.lastPage));
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
      final args = routeData.argsAs<RegisterRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: RegisterPage(key: args.key, subjectIds: args.subjectIds),
          fullscreenDialog: true);
    },
    MainRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const MainPage());
    },
    AllCoursesRoute.name: (routeData) {
      final args = routeData.argsAs<AllCoursesRouteArgs>(
          orElse: () => const AllCoursesRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: AllCoursesPage(key: args.key, onResult: args.onResult));
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
            path: '/', redirectTo: '/login', fullMatch: true),
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
class WelcomeRoute extends PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute(
      {Key? key, required WelcomeService service, bool lastPage = false})
      : super(WelcomeRoute.name,
            path: '/welcome',
            args: WelcomeRouteArgs(
                key: key, service: service, lastPage: lastPage));

  static const String name = 'WelcomeRoute';
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs(
      {this.key, required this.service, this.lastPage = false});

  final Key? key;

  final WelcomeService service;

  final bool lastPage;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, service: $service, lastPage: $lastPage}';
  }
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
  RegisterRoute({Key? key, required List<int> subjectIds})
      : super(RegisterRoute.name,
            path: '/register',
            args: RegisterRouteArgs(key: key, subjectIds: subjectIds));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.subjectIds});

  final Key? key;

  final List<int> subjectIds;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, subjectIds: $subjectIds}';
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
class AllCoursesRoute extends PageRouteInfo<AllCoursesRouteArgs> {
  AllCoursesRoute({Key? key, void Function(bool)? onResult})
      : super(AllCoursesRoute.name,
            path: '/all-courses',
            args: AllCoursesRouteArgs(key: key, onResult: onResult));

  static const String name = 'AllCoursesRoute';
}

class AllCoursesRouteArgs {
  const AllCoursesRouteArgs({this.key, this.onResult});

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'AllCoursesRouteArgs{key: $key, onResult: $onResult}';
  }
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
