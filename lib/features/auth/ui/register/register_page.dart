import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/snack_bar_build_context.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/link_text.dart';
import 'package:najeeb_academy/app/widgets/logo.dart';
import 'package:najeeb_academy/features/auth/models/governorate.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/syrian_mobile_form_field.dart';

class RegisterPage extends StatelessWidget {
  final List<int> subjectsIds;
  final List<int> myClassesIds;
  RegisterPage({
    super.key,
    required this.subjectsIds,
    required this.myClassesIds,
  });
  final service = DI.registerFormServiceFactory();
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<List<StudentClass>>(
    //     future: service.loadData,
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Loading();
    //       }
    //       if (snapshot.hasError || !snapshot.hasData) {
    //         return const Center(child: Text('غير متصل بالإنترنت'));
    //       }
    return Scaffold(
      appBar: const AuthAppBar('إنشاء حساب'),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: FormBuilder(
                key: service.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                      child: Align(
                        child: SizedBox(
                          height: 56.h,
                          child: const Logo(),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: FormBuilderTextField(
                              name: 'first_name',
                              autofocus: true,
                              decoration: const InputDecoration(
                                hintText: 'الاسم الأول',
                              ),
                              validator: (input) {
                                if (input == null || input.trim().isEmpty) {
                                  return 'هذا الحقل مطلوب';
                                }
                                if (input.codeUnits.any((char) =>
                                    (char < 1569 && char != 32) ||
                                    char > 1610)) {
                                  return 'الرجاء إدخال الاسم باللغة العربية';
                                }
                                if (input.trim().length < 2) {
                                  return 'يجب إدخال حرفين على الأقل';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        8.horizontalSpace,
                        Expanded(
                          child: Card(
                            child: FormBuilderTextField(
                              name: 'last_name',
                              decoration: const InputDecoration(
                                hintText: 'الكنية',
                              ),
                              validator: (input) {
                                if (input == null || input.trim().isEmpty) {
                                  return 'هذا الحقل مطلوب';
                                }
                                if (input.codeUnits.any((char) =>
                                    (char < 1569 && char != 32) ||
                                    char > 1610)) {
                                  return 'الرجاء إدخال الاسم باللغة العربية';
                                }
                                if (input.trim().length < 2) {
                                  return 'يجب إدخال حرفين على الأقل';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                      ],
                    ),
                    8.verticalSpace,
                    Card(
                      child: FormBuilderTextField(
                        name: 'father_name',
                        decoration: const InputDecoration(
                          hintText: 'اسم الأب',
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return null;
                          }
                          if (input.codeUnits.any((char) =>
                              (char < 1569 && char != 32) || char > 1610)) {
                            return 'الرجاء إدخال الاسم باللغة العربية';
                          }
                          if (input.trim().length < 2) {
                            return 'يجب إدخال حرفين على الأقل';
                          }
                          return null;
                        },
                      ),
                    ),
                    8.verticalSpace,
                    const Card(
                      child: SyrianMobileFormField(
                        decoration: InputDecoration(
                          hintText: 'الجوال',
                        ),
                      ),
                    ),
                    8.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: FormBuilderTextField(
                              name: 'landline',
                              decoration: const InputDecoration(
                                hintText: 'الهاتف الأرضي',
                              ),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                        8.horizontalSpace,
                        Expanded(
                          child: Card(
                            child: FormBuilderDropdown<Governorate>(
                              name: 'governorate',
                              initialValue: Governorate.all.first,
                              items: Governorate.all
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e.name),
                                    ),
                                  )
                                  .toList(),
                              decoration: const InputDecoration(
                                hintText: 'المحافظة',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    8.verticalSpace,
                    Card(
                      child: SyrianMobileFormField(
                        name: 'parent_mobile',
                        decoration: const InputDecoration(
                          hintText: 'هاتف ولي الأمر',
                        ),
                        onFieldSubmitted: (_) {
                          FocusManager.instance.primaryFocus?.nextFocus();
                        },
                      ),
                    ),
                    8.verticalSpace,
                    Card(
                      child: FormBuilderTextField(
                        name: 'bill_number',
                        decoration: const InputDecoration(
                          hintText: 'رقم الفاتورة',
                        ),
                        textInputAction: TextInputAction.go,
                        onSubmitted: (_) => service.register(
                          context: context,
                          onFailed: (message) => onFailed(context, message),
                          subjectsIds: subjectsIds,
                          myClassesIds: myClassesIds,
                        ),
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'رقم الفاتورة مطلوب';
                          }
                          return null;
                        },
                      ),
                    ),
                    // 8.verticalSpace,
                    // const IsInstallmentField(),

                    // 8.verticalSpace,
                    // Card(
                    //   child: FormBuilderDropdown<String>(
                    //     name: 'class',
                    //     items: snapshot.data!
                    //         .map(
                    //           (e) => DropdownMenuItem(
                    //             value: e.id,
                    //             child: Row(
                    //               children: [
                    //                 Image.asset(
                    //                   e.imgUrl,
                    //                   width: 28.r,
                    //                   height: 28.r,
                    //                   cacheWidth: 28.r.toInt(),
                    //                   cacheHeight: 28.r.toInt(),
                    //                 ),
                    //                 8.horizontalSpace,
                    //                 Expanded(
                    //                   child: Text(e.name),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         )
                    //         .toList(),
                    //     decoration: const InputDecoration(
                    //       hintText: 'الصف',
                    //     ),
                    //   ),
                    // ),
                    const Spacer(),
                    12.verticalSpace,
                    ElevatedButton(
                      onPressed: () => service.register(
                        context: context,
                        onFailed: (message) => onFailed(context, message),
                        subjectsIds: subjectsIds,
                        myClassesIds: myClassesIds,
                      ),
                      child: const Text('إنشاء الحساب'),
                    ),
                    8.verticalSpace,
                    Align(
                      child: LinkText(
                        'لديك حساب بالفعل؟',
                        onTap: () {
                          DI.router.replace(LoginRoute());
                        },
                      ),
                    ),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
    // });
  }

  void onFailed(BuildContext context, String message) {
    context.showFailSnackBar(message);
  }
}
