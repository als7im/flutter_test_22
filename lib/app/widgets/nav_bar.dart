import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_constants.dart';
import '../constants/app_icons.dart';
import '../providers/sidebar_provider.dart';
import '../providers/theme_provider.dart';

class NavBar extends ConsumerWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text(AppConstants.appName),
      actions: [
        IconButton(
          icon: const Icon(AppIcons.menu),
          onPressed: () => toggleSidebar(ref),
        ),
        IconButton(
          icon: const Icon(AppIcons.brightness),
          onPressed: () => toggleTheme(ref),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}