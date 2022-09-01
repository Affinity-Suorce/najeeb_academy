import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:najeeb_academy/app/constants/assets.dart';
import 'package:najeeb_academy/features/auth/models/student_class.dart';

class RegisterFormService extends ChangeNotifier {
  RegisterFormService();
  final formKey = GlobalKey<FormBuilderState>();

  Future<List<StudentClass>> get loadData async {
    Future.delayed(const Duration(milliseconds: 500));
    return [
      StudentClass(
          id: '0', name: 'بكالوريا', imgUrl: Assets.images.boarding(0)),
      StudentClass(id: '1', name: 'تاسع', imgUrl: Assets.images.boarding(1)),
    ];
    
  }

  Future<void> register() async {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      // final userId = formState.fields['user_id']!.value;
      // final password = formState.fields['password']!.value;
      // print('user id: $userId\npassword: $password');
    }
  }
}
