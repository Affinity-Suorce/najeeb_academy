import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/extensions/bottom_sheet_widget.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/confirm_send_message_to_number_bottom_sheet.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_class_step.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_communication_info_step.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_password_step.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_personal_info_step.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_verify_mobile_step.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/auth_app_bar.dart';

import 'widgets/register_bottom_buttons.dart';
import 'widgets/register_header.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static const _titles = [
    'أختر صفك',
    'المعلومات الشخصية',
    'معلومات التواصل',
    'كلمة المرور',
    'التأكد من رقم الجوال',
  ];

  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(keepPage: true);
  }

  int _currentPageIndex = 0;
  int get _lastIndex => _titles.length - 1;
  bool get _isLastPage => _currentPageIndex == _lastIndex;
  String get _title => _titles[_currentPageIndex];
  Widget? get _nextTitle {
    final captionTheme = Theme.of(context).textTheme.caption;

    return RichText(
        text: TextSpan(
      style: captionTheme,
      children: [
        WidgetSpan(
          child: Icon(
            Icons.forward,
            size: 12,
            color: captionTheme?.color,
          ),
        ),
        TextSpan(
          text:
              ' ${_isLastPage ? 'إنشاء الحساب' : _titles[_currentPageIndex + 1]}',
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar('إنشاء حساب'),
      body: Column(
        children: [
          RegisterHeader(
            currentPageIndex: _currentPageIndex,
            lastIndex: _lastIndex,
            title: _title,
            nextTitle: _nextTitle,
          ),
          Expanded(
            child: WillPopScope(
              onWillPop: () async {
                if (_currentPageIndex > 0) {
                  _prevPage();
                  return false;
                }
                return true;
              },
              child: Form(
                child: PageView(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const RegisterClassStep(),
                    RegisterPersonalInfoStep(
                      onLastFieldSubmitted: (_) => _nextPage(),
                    ),
                    RegisterCommunicationInfoStep(
                      onLastFieldSubmitted: (_) => _nextPage(),
                    ),
                    RegisterPasswordStep(
                      onLastFieldSubmitted: (_) => _nextPage(),
                    ),
                    RegisterVerifyMobileStep(
                      verifyCodeLength: 4,
                      onLastFieldSubmitted: (_) => _register(),
                    ),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RegisterBottomButtons(
        nextPage: _nextPage,
        prevPage: _prevPage,
        register: _register,
        isLastPage: _isLastPage,
      ),
    );
  }

  Future<void> _nextPage() async {
    final isToSendMessageScreen = _currentPageIndex == 3;
    if (isToSendMessageScreen) {
      final confirmed = await const ConfirmSendMessageToNumberBottomSheet(
                  number: '0987654321')
              .showAsBottomSheet<bool>(context) ??
          false;
      if (!confirmed) return;
    }
    _toPage(_currentPageIndex + 1);
  }

  void _prevPage() => _toPage(_currentPageIndex - 1);

  void _toPage(int page) {
    if (page < 0 || page > _lastIndex) return;
    _controller.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  void _register() {
    //
  }
}
