import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/constants/assets.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/features/welcome/services/welcome_service.dart';

import 'widgets/boarding_widget.dart';
import 'widgets/indicator.dart';

class WelcomePage extends StatefulWidget {
  final WelcomeService service;
  final bool lastPage;
  const WelcomePage({super.key, required this.service, this.lastPage = false});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static const _titles = [
    'نجيب معك\nلتبدأ النجاح وتصل إلى حلمك',
    'نجيب ينظم وقتك\nويضع لك خطتك الدراسية',
    'اجعل الدراسة أكثر تحفيزاً\nأكثر تميزاً وأكثر متعة وابدأ خطوتك الأولى معنا',
  ];

  late final PageController _controller;
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.lastPage ? _lastIndex : 0;
    _controller = PageController(initialPage: _currentPageIndex);
  }

  int get _lastIndex => _titles.length - 1;

  bool get _isLastPage => _currentPageIndex == _lastIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            16.verticalSpace,
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  if (index == _lastIndex) {
                    widget.service.setIsFirstTime(false);
                  }
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) => BoardingWidget(
                  imagePath: Assets.images.boarding(index),
                  title: _titles[index],
                ),
                itemCount: _titles.length,
              ),
            ),
            16.verticalSpace,
            Center(
              child: Indicator(controller: _controller, length: _titles.length),
            ),
            16.verticalSpace,
            Row(
              children: [
                8.horizontalSpace,
                Expanded(
                  child: _isLastPage
                      ? OutlinedButton(
                          onPressed: () {
                            DI.router.replace(const MainRoute());
                          },
                          child: const Text('ابدأ'),
                        )
                      : TextButton(
                          onPressed: _skip,
                          child: const Text('تخطي'),
                        ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isLastPage /*login*/) {
                        DI.router.push(LoginRoute());

                        return;
                      }
                      _nextPage();
                    },
                    child: Text(_isLastPage ? 'تسجيل الدخول' : 'التالي'),
                  ),
                ),
                8.horizontalSpace,
              ],
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _nextPage() => _toPage(_currentPageIndex + 1);
  void _skip() => _toPage(_lastIndex);

  void _toPage(int page) {
    if (page < 0 || page > _lastIndex) return;

    _controller.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
