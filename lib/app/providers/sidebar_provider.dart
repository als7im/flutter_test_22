import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSidebarExpandedProvider = StateProvider<bool>((ref) => true);

void toggleSidebar(WidgetRef ref) {
  final isExpanded = ref.read(isSidebarExpandedProvider);
  ref.read(isSidebarExpandedProvider.notifier).state = !isExpanded;
}