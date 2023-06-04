import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:najeeb_academy/app/extensions/dialog_build_context.dart';
import 'package:najeeb_academy/app/widgets/loading.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/registration_complete_dialog.dart';

class RegisterFormService extends ChangeNotifier {
  final Dio _api;

  RegisterFormService(this._api);
  final formKey = GlobalKey<FormBuilderState>();

  // Future<List<StudentClass>> get loadData async {
  //   Future.delayed(const Duration(milliseconds: 500));
  //   return [
  //     StudentClass(
  //         id: '0', name: 'بكالوريا', imgUrl: Assets.images.boarding(0)),
  //     StudentClass(id: '1', name: 'تاسع', imgUrl: Assets.images.boarding(1)),
  //   ];
  // }

  Future<void> register({
    required BuildContext context,
    required void Function(String message) onFailed,
    required List<int> subjectsIds,
    required List<int> myClassesIds,
  }) async {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      context
          .showDialog(const Loading(), barrierDismissible: false)
          .then((value) {
        // cancelToken.cancel('cancel');
      });
      final firstName = formState.fields['first_name']!.value;
      final lastName = formState.fields['last_name']!.value;
      final fatherName = formState.fields['father_name']!.value;
      final mobile = formState.fields['mobile']!.value;
      final landline = formState.fields['landline']!.value;
      final governorate = formState.fields['governorate']!.value;
      final parentMobile = formState.fields['parent_mobile']!.value;
      // final billNumber = formState.fields['bill_number']!.value;
      // final isInstallment = formState.fields['is_installment']!.value;
      // final classId = formState.fields['class']!.value;
      try {
        final response = await _api.post(
          registerUrl,
          data: {
            'name': firstName + ' ' + lastName,
            'first_name': firstName,
            'last_name': lastName,
            'father_name': fatherName,
            'mobile': mobile,
            'landline': landline ?? '6666666',
            'parent_phone': parentMobile,
            'governorate': governorate
          },
        );

        final data = response.data;
        if (data is Map<String, dynamic>) {
          if (data.containsKey('data')) {
            // ignore: use_build_context_synchronously
            context.showDialog(const RegistrationCompleteDialog(),
                barrierDismissible: false);
          }
        }
      } on DioError catch (e) {
        if (e.message != 'cancel') {
          Navigator.pop(context);
          final data = e.response?.data;
          if (data is Map<String, dynamic>) {
            if (data.containsKey('message') &&
                data['message'].contains('invalid')) {
              return onFailed('تم استخدام رقم الفاتورة من قبل');
            }
          }
          if ([
            DioErrorType.other,
            DioErrorType.connectTimeout,
            DioErrorType.receiveTimeout,
            DioErrorType.sendTimeout,
          ].contains(e.type)) {
            return onFailed('لايمكن الاتصال بالشبكة');
          }

          onFailed('حدث خطأ غير متوقع');
          // onFailed(e.message);
        }
      }
    }
  }
}
