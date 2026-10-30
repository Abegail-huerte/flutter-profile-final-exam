import 'package:flutter/material.dart';

class GlobalappbarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const GlobalappbarComponent({super.key, this.title = 'News Feed'});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
    );
  }
}
