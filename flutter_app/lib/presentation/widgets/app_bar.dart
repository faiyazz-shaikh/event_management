import 'package:flutter/material.dart';
import 'package:flutter_app/core/resources/app_colors.dart';

class EmsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmsAppBar({
    required this.title,
    this.centerTitle = true,
    super.key,
  });

  final String title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 22);
    return AppBar(
      title: Text(title, style: titleStyle),
      centerTitle: centerTitle,
      backgroundColor: AppColors.white,
      elevation: 1,
      leading: const Icon(
        Icons.keyboard_backspace_outlined,
        color: AppColors.black,
        size: 24,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + 6);
}
