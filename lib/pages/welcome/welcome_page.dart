import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/assets.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/secondary_button.dart';

import 'widgets/boarding_widget.dart';
import 'widgets/indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static const _titles = [
    'دورات عديدة مجانية\nدورات تجريبية',
    'تعلم\nسريع وسهل',
    'أنشئ خطة دراسية\nخاصة بك',
  ];
  static const _subtitles = [
    'دورات مجانية لك\nجد طريقك إلى التعلم',
    'تعلم سريع وسهل\nفي أي وقت لمساعدتك\nلتحسين المهارات المختلفة',
    'الدراسة حسب\nخطة الدراسة ، اجعل الدراسة\nأكثر تحفيزًا',
  ];

  late final PageController _controller;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  int get _lastIndex => _titles.length - 1;

  bool get _isLastPage => _currentPageIndex == _lastIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 10,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) => BoardingWidget(
                  imagePath: Assets.images.boarding(index),
                  title: _titles[index],
                  subtitle: _subtitles[index],
                ),
                itemCount: _titles.length,
              ),
            ),
            const Spacer(),
            Center(
              child: Indicator(controller: _controller, length: _titles.length),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 24),
                Expanded(
                  child: _isLastPage
                      ? SecondaryButton(
                          onPressed: () {
                            DI.router.push(const RegisterRoute());
                          },
                          child: const Text('إنشاء حساب'),
                        )
                      : TextButton(
                          onPressed: _skip,
                          child: const Text('تخطي'),
                        ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isLastPage /*login*/) {
                        DI.router.push(const LoginRoute());

                        return;
                      }
                      _nextPage();
                    },
                    child: Text(_isLastPage ? 'تسجيل الدخول' : 'التالي'),
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
            const Spacer(),
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
