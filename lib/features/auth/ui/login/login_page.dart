import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/snack_bar_build_context.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/button.dart';
import 'package:najeeb_academy/app/widgets/link_text.dart';
import 'package:najeeb_academy/app/widgets/logo.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/password_form_field.dart';
import 'package:najeeb_academy/features/home/presentation/privacy_poilcy.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final service = DI.loginFormServiceFactory();

  late AnimationController _controllerPassword;
  late Animation _animationPassword;

  final FocusNode _focusNodePassword = FocusNode(),_focusNodeUserName= FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            title: const Text('سياسة الخصوصية:'),
            content: const SizedBox(height: 250, child: PrivacyPolicy()),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        buttonColor: AppColors.indigo,
                        verticalPadding: 8,
                        title: 'موافق',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });

    _controllerPassword = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _animationPassword = Tween(begin: 0.0, end: 300.0).animate(_controllerPassword)
      ..addListener(() {
        setState(() {});
      });


    _focusNodePassword.addListener(() {
      if (_focusNodePassword.hasFocus) {
        _controllerPassword.forward();
      } else {
        _controllerPassword.reverse();
      }
    });

    _focusNodeUserName.addListener(() {
      if (_focusNodeUserName.hasFocus) {
        _controllerPassword.forward();
      } else {
        _controllerPassword.reverse();
      }
    });

  }

  @override
  void dispose() {
    _controllerPassword.dispose();
    _focusNodePassword.dispose();
    _focusNodeUserName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const AuthAppBar('تسجيل الدخول'),
        body: InkWell(
          // to dismiss the keyboard when the user tabs out of the TextField
          splashColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
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
                            focusNode: _focusNodeUserName,
                            scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                            focusNode: _focusNodePassword,
                            decoration:
                                const InputDecoration(hintText: 'كلمة المرور'),
                            isLogin: true,
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (_) => service.login(
                                context: context,
                                onFailed: (e) => onFailed(context, e)),
                          ),
                        ),
                        16.verticalSpace,
                        ElevatedButton(
                          onPressed: () async {
                            return service.login(
                                context: context,
                                onFailed: (e) => onFailed(context, e));
                          },
                          child: const Text('تسجيل الدخول'),
                        ),
                        8.verticalSpace,
                        ElevatedButton(
                          onPressed: () {
                            DI.router.replaceAll([
                              MainRoute(children: [AllCoursesRoute()])
                            ]);
                          },
                          child: const Text('حساب جديد'),
                        ),
                        // Align(
                        //   child: LinkText(
                        //     'تصفح الدورات والإشتراك',
                        //     onTap: () {
                        //       DI.router.replaceAll([
                        //         const MainRoute(children: [CoursesRoute()])
                        //       ]);
                        //     },
                        //   ),
                        // ),
                        8.verticalSpace,
                        Align(
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(height: 50.0,width: 50.0,decoration:const BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/images/IconWhatsApp.png")))),
                                LinkText(
                            "للتواصل : whatsApp",
                            onTap: () async {
                              // await _makePhoneCall();
                              launchUrl(Uri.parse("https://api.whatsapp.com/send?phone=963997424043&text=%20"),mode: LaunchMode.externalApplication);
                            },
                          ),
                          ]),
                        ),
                        SizedBox(height: _animationPassword.value),
                        16.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void onFailed(BuildContext context, String message) {
    if(message.isNotEmpty) {
      context.showFailSnackBar(message);
    }
  }
}
