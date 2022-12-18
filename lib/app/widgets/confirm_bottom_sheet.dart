import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_sheet_container.dart';

class ConfirmBottomSheet extends StatelessWidget {
  final String? message;
  final Widget? child;
  final String primaryButtonLabel;
  final String secondaryButtonLabel;
  final String type;
  static const _deleteType = 'delete';
  static const _confirmType = 'confirm';
  const ConfirmBottomSheet.delete({
    super.key,
    this.message,
    this.child,
    this.primaryButtonLabel = 'حذف',
    this.secondaryButtonLabel = 'إلغاء',
  })  : type = _deleteType,
        assert(child != null || message != null);
  const ConfirmBottomSheet.confirm({
    super.key,
    this.message,
    this.child,
    this.primaryButtonLabel = 'نعم',
    this.secondaryButtonLabel = 'لا',
  })  : type = _confirmType,
        assert(child != null || message != null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomSheetContainer(
      child: Column(
        children: [
          child ?? Text(message!, style: theme.textTheme.headline5),
          24.verticalSpace,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: type == _deleteType
                      ? ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.error,
                          foregroundColor: theme.colorScheme.onError,
                        )
                      : null,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(primaryButtonLabel),
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(secondaryButtonLabel),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
