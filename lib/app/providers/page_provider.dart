import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/page_model.dart';

final currentPageProvider = StateProvider<PageModel?>((ref) => pages[0]);

void setCurrentPage(WidgetRef ref, PageModel page) {
  ref.read(currentPageProvider.notifier).state = page;
}
