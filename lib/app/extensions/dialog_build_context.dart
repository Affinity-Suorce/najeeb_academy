import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart' as material_dialog show showDialog;

extension DialogBuildContextExtension on BuildContext{
  void showDialog(Widget dialog, {bool barrierDismissible = true}) {
    material_dialog.showDialog(
      context: this,
      builder: (context) => dialog,
      barrierDismissible: barrierDismissible,
    );
  }
}