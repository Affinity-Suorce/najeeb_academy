import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/secondary_button.dart';

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
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: type == _deleteType
                      ? ElevatedButton.styleFrom(
                          primary: theme.colorScheme.error,
                          onPrimary: theme.colorScheme.onError,
                        )
                      : null,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(primaryButtonLabel),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SecondaryButton(
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
