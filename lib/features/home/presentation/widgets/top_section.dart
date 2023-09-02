import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/gradient_slider.dart';
import 'package:najeeb_academy/app/widgets/link_text.dart';
import 'package:najeeb_academy/app/widgets/nav_bar.dart';
import 'package:najeeb_academy/core/Enum/enum.dart';
import 'package:najeeb_academy/core/error/failures.dart';
import 'package:najeeb_academy/features/home/bloc/home_bloc.dart';

class TopSection extends StatefulWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  void initState() {
    super.initState();
    if (!mounted) {
      Timer.periodic(const Duration(seconds: 3), (timer) => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("buildingTopSection");
    LinearGradient gradient =
        LinearGradient(colors: <Color>[Colors.white, Colors.red.shade500]);
    return Column(
      children: [
        const Navbar(),
        Container(
          alignment: Alignment.centerRight,
          child: const Text(
            "ابدأ التعلم معنا الآن",
            style: TextStyle(
              height: 1.4,
              color: Colors.white,
              fontSize: 24,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.035),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 18),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 120,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x669e9e9e),
                      spreadRadius: 0.5,
                      blurRadius: 7,
                      offset: Offset(2, 6))
                ]),
            child: DI.userInfo.isAuthenticated
                ? BlocConsumer<HomeBloc,HomeState>(
              builder:(context,state){
                if(state is HomeLoad){
                  return const Text(
                    "ابدأ التعلم معنا الآن",
                    style: TextStyle(
                      height: 1.4,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textDirection: TextDirection.rtl,
                  );
                }
                if(state is GetNumberOfViewsState){
                  switch(state.requestState){
                    case RequestState.loading:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "تعلمت اليوم",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.black54,
                                height: 1,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "0",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                  ),
                                ),
                                Text(
                                  " درس من أصل ${DI.lectureServices.getLectures.length}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: SizedBox(
                              height: 10,
                              child: SliderTheme(
                                  data: SliderThemeData(
                                      activeTickMarkColor: Colors.white,
                                      trackShape: GradientRectSliderTrackShape(
                                          gradient: gradient,
                                          darkenInactive: false),
                                      thumbShape: SliderComponentShape.noThumb,
                                      activeTrackColor: Colors.white,
                                      trackHeight: 6),
                                  child: Slider(
                                    min: 0,
                                    max: 10,
                                    value: (DI.lectureServices
                                        .getWatchedLecturesIds.length /
                                        DI.lectureServices.getLectures
                                            .length) *
                                        10,
                                    onChanged: (double value) {},
                                  )),
                            ),
                          ),
                        ],
                      );
                    case RequestState.loaded:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "تعلمت اليوم",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.black54,
                                height: 1,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${state.numberOfViews}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                  ),
                                ),
                                Text(
                                  " درس من أصل ${DI.lectureServices.getLectures.length}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: SizedBox(
                              height: 10,
                              child: SliderTheme(
                                  data: SliderThemeData(
                                      activeTickMarkColor: Colors.white,
                                      trackShape: GradientRectSliderTrackShape(
                                          gradient: gradient,
                                          darkenInactive: false),
                                      thumbShape: SliderComponentShape.noThumb,
                                      activeTrackColor: Colors.white,
                                      trackHeight: 6),
                                  child: Slider(
                                    min: 0,
                                    max: DI.lectureServices.getLectures.length.toDouble() == 0 ? 10 : DI.lectureServices.getLectures.length.toDouble(),
                                    value:state.numberOfViews.toDouble(),
                                    onChanged: (double value) {},
                                  )),
                            ),
                          ),
                        ],
                      );
                    case RequestState.error:
                      var failure = state.failure;
                      if(failure is ServerFailure){
                        return const Text(
                          'خطأ غير معروف',
                          style: TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          textDirection: TextDirection.rtl,
                        );
                      }if(failure is HttpFailure){
                        return Text(
                          failure.message,
                          style:const TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          textDirection: TextDirection.rtl,
                        );
                      }
                      return const Text(
                        "ابدأ التعلم معنا الآن",
                        style: TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        textDirection: TextDirection.rtl,
                      );
                  }
                }
                return const Text(
                  "ابدأ التعلم معنا الآن",
                  style: TextStyle(
                    height: 1.4,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  textDirection: TextDirection.rtl,
                );
              } ,
              listener: (context,state){},)
                : alternativeWidget(
                    "اشترك في الدروس وسجل دخولك الان", true, context)),
      ],
    );
  }

  Widget alternativeWidget(String text, bool isUnAuth, BuildContext context) =>
      InkWell(
        onTap: () {
          isUnAuth
              ? DI.router
                  .push(AllCoursesRoute())
                  .then((value) => DI.coursesServices.resetLists())
              : AutoTabsRouter.of(context).setActiveIndex(2);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: isUnAuth
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        text,
                        style: const TextStyle(
                            color: Colors.black,
                            height: 1.3,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LinkText("لديك حساب؟", onTap: () {
                            DI.userInfo.logout().then((success) {
                              if (success) {
                                DI.router.replaceAll([
                                  WelcomeRoute(
                                      service: DI.welcomeServiceFactory(),
                                      lastPage: true)
                                ]);
                                DI.router.push(const LoginRoute());
                              }
                            });
                          })
                        ],
                      )
                    ],
                  )
                : Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
          ),
        ),
      );
}
