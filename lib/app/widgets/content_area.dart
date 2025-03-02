import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../providers/page_provider.dart';

class ContentArea extends ConsumerWidget {
  const ContentArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        color: AppColors.backgroundLight,
        child: currentPage?.page ?? const Center(child: Text('No Page Selected')),
      ),
    );
  }
}