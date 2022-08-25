import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AuthAppBar(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CloseButton(onPressed: () => Navigator.pop(context)),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
