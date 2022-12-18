// import 'package:auto_route/auto_route.dart';
// import 'package:najeeb_academy/app/router/app_router.dart';
// import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';

// class AuthGuard extends AutoRouteGuard {
//   final UserInfoRepository userInfo;

//   AuthGuard(this.userInfo);
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) async {
//     if (userInfo.isAuthenticated) {
//       return resolver.next(true);
//     }
//     router.push(AllCoursesRoute(onResult: (success) {
//       resolver.next(success);
//     }));
//   }
// }
