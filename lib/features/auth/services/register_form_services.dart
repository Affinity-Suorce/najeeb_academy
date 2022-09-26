import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:najeeb_academy/app/constants/assets.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/auth/models/student_class.dart';

class RegisterFormService extends ChangeNotifier {
  final Dio _api;

  RegisterFormService(this._api);
  final formKey = GlobalKey<FormBuilderState>();

  Future<List<StudentClass>> get loadData async {
    Future.delayed(const Duration(milliseconds: 500));
    return [
      StudentClass(
          id: '0', name: 'بكالوريا', imgUrl: Assets.images.boarding(0)),
      StudentClass(id: '1', name: 'تاسع', imgUrl: Assets.images.boarding(1)),
    ];
  }

  Future<void> register({
    required void Function(DioError e) onFailed,
  }) async {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      final firstName = formState.fields['first_name']!.value;
      final lastName = formState.fields['last_name']!.value;
      final fatherName = formState.fields['father_name']!.value;
      final mobile = formState.fields['mobile']!.value;
      final landline = formState.fields['landline']!.value;
      final governorate = formState.fields['governorate']!.value;
      final parentMobile = formState.fields['parent_mobile']!.value;
      final classId = formState.fields['class']!.value;
      try {
        final response = await _api.post(
          registerUrl,
          data: {
            'first_name': firstName,
            'lastName': lastName,
            'father_name': fatherName,
            'mobile': mobile,
            'landline': landline,
            'governorate': governorate,
            'parent_mobile': parentMobile,
            'my_class_id': classId,
          },
        );
        debugPrint(response.data);
      } on DioError catch (e) {
        onFailed(e);
        debugPrint(e.message);
      }
    }
  }
}
