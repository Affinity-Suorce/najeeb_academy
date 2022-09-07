import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/link_text.dart';
import 'package:najeeb_academy/app/widgets/loading.dart';
import 'package:najeeb_academy/app/widgets/logo.dart';
import 'package:najeeb_academy/features/auth/models/governorate.dart';
import 'package:najeeb_academy/features/auth/models/student_class.dart';
import 'package:najeeb_academy/features/auth/services/register_form_services.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/syrian_mobile_form_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final service = RegisterFormService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StudentClass>>(
        future: service.loadData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('غير متصل بالإنترنت'));
          }
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
                            child: FormBuilderDropdown<StudentClass>(
                              name: 'class',
                              items: snapshot.data!
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            e.imgUrl,
                                            width: 28.r,
                                            height: 28.r,
                                            cacheWidth: 28.r.toInt(),
                                            cacheHeight: 28.r.toInt(),
                                          ),
                                          8.horizontalSpace,
                                          Expanded(
                                            child: Text(e.name),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              decoration: const InputDecoration(
                                hintText: 'الصف',
                              ),
                            ),
                          ),
                          const Spacer(),
                          12.verticalSpace,
                          ElevatedButton(
                            onPressed: () {},
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
        });
  }
}
