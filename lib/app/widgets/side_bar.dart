import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
// import '../constants/app_icons.dart';
import '../providers/sidebar_provider.dart';
import '../providers/page_provider.dart';
import '../models/page_model.dart';

class SideBar extends ConsumerWidget {
  final List<PageModel> pages;

  const SideBar({super.key, required this.pages});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(isSidebarExpandedProvider);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width:
          isExpanded
              ? AppConstants.sidebarWidthExpanded
              : AppConstants.sidebarWidthCollapsed,
      color: AppColors.primary,
      // alignment: Alignment.center,
      padding: EdgeInsets.only(left: 5),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final page = pages[index];
          return ListTile(
            leading: Icon(page.icon, color: AppColors.textLight),
            title:
                isExpanded
                    ? Text(
                      page.title,
                      style: const TextStyle(
                        color: AppColors.textLight,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                    : null,
            onTap: () {
              setCurrentPage(ref, page);
            },
          );
        },
      ),
    );
  }
}
