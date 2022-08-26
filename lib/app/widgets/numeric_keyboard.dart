import 'package:flutter/material.dart';

class NumericKeyboard extends StatelessWidget {
  final ValueChanged<String> onTap;
  final VoidCallback onBackspace;
  final double buttonAspectRatio;
  const NumericKeyboard({
    super.key,
    required this.onTap,
    required this.onBackspace,
    this.buttonAspectRatio = 1.4,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Table(
      textDirection: TextDirection.ltr,
      children: List.generate(
        4,
        (row) {
          return TableRow(
            children: List.generate(
              3,
              (column) {
                if (row == 3) {
                  if (column == 2) {
                    return AspectRatio(
                      aspectRatio: buttonAspectRatio,
                      child: IconButton(
                        onPressed: onBackspace,
                        icon: const Icon(Icons.backspace_rounded),
                      ),
                    );
                  }
                  if (column == 0) {
                    return const SizedBox.shrink();
                  }
                }
                final character =
                    row == 3 ? '0' : ((column + 1) + (row * 3) % 10).toString();
                return AspectRatio(
                  aspectRatio: buttonAspectRatio,
                  child: IconButton(
                    onPressed: () => onTap(character),
                    icon: Text(
                      character,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
