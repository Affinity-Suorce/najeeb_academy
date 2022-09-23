import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/link_text.dart';
import 'package:najeeb_academy/app/widgets/logo.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/password_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final service = DI.loginFormServiceFactory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar('تسجيل الدخول'),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: FormBuilder(
                key: service.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.2.sw, vertical: 16.h),
                          child: const Logo(),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Card(
                      child: FormBuilderTextField(
                        name: 'username',
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: 'اسم المستخدم'),
                        textInputAction: TextInputAction.next,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'هذا الحقل مطلوب';
                          }
                          return null;
                        },
                      ),
                    ),
                    8.verticalSpace,
                    Card(
                      child: PasswordFormField(
                        decoration:
                            const InputDecoration(hintText: 'كلمة المرور'),
                        textInputAction: TextInputAction.go,
                        onFieldSubmitted: (_) => service.login(),
                      ),
                    ),
                    16.verticalSpace,
                    ElevatedButton(
                      onPressed: service.login,
                      child: const Text('تسجيل الدخول'),
                    ),
                    8.verticalSpace,
                    Align(
                      child: LinkText(
                        'ليس لديك حساب؟',
                        onTap: () {
                          DI.router.replace(RegisterRoute());
                        },
                      ),
                    ),
                    const Spacer(),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
