import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/extensions/bottom_sheet_widget.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/confirm_send_message_to_number_bottom_sheet.dart';

class RegisterFormService extends ChangeNotifier {
  static const _titles = [
    'أختر صفك',
    'المعلومات الشخصية',
    'معلومات التواصل',
    'كلمة المرور',
    'التأكد من رقم الجوال',
  ];
  late final List<GlobalKey<FormState>> formsKeys;
  late final PageController pageController;
  int currentPageIndex;
  RegisterFormService({
    this.currentPageIndex = 0,
  }) {
    pageController =
        PageController(keepPage: true, initialPage: currentPageIndex);
    formsKeys = List.generate(5, (index) => GlobalKey());
  }

  int get lastIndex => _titles.length - 1;
  bool get isLastPage => currentPageIndex == lastIndex;
  String get title => _titles[currentPageIndex];
  String get nextTitle {
    return isLastPage ? 'إنشاء الحساب' : _titles[currentPageIndex + 1];
  }

  void onPageChanged(int page) {
    currentPageIndex = page;
    notifyListeners();
  }

  Future<void> nextPage(BuildContext context) async {
    final valid = formsKeys[currentPageIndex].currentState?.validate() ?? false;
    if (!valid) return;
    final isToSendMessageScreen = currentPageIndex == 3;
    if (isToSendMessageScreen) {
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      final confirmed =
          await ConfirmSendMessageToNumberBottomSheet(number: mobile ?? '')
                  .showAsBottomSheet<bool>(context) ??
              false;
      if (!confirmed) return;
    }
    toPage(currentPageIndex + 1);
  }

  void prevPage() => toPage(currentPageIndex - 1);

  void toPage(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int? studentClass;
  String? firstName,
      fatherName,
      lastName,
      mobile,
      landline,
      parentMobile,
      password,
      confirmedPassword,
      verifyMobileCode;

  Future<void> register() async {
    for (final formKey in formsKeys) {
      formKey.currentState?.save();
    }
    print(
        'first name: $firstName\nlast name: $lastName\nmobile: $mobile\nlandline: $landline\nparent mobile: $parentMobile\npassword: $password\nconfirm password: $confirmedPassword\nverify code: $verifyMobileCode');
  }
}
