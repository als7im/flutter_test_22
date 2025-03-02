import 'package:flutter/material.dart';
import 'package:flutter_test_22/app/pages/add_user.dart';

import '../constants/app_icons.dart';
import '../pages/about_page.dart';
import '../pages/home_page.dart';
import '../pages/settings_page.dart';

class PageModel {
  final String title;
  final IconData icon;
  final Widget page;

  PageModel({required this.title, required this.icon, required this.page});
}

final pages = <PageModel>[
  PageModel(title: 'Home', icon: AppIcons.home, page: const HomePage()),
  PageModel(
    title: 'Settings',
    icon: AppIcons.settings,
    page: const SettingsPage(),
  ),
  PageModel(title: 'About', icon: AppIcons.info, page: const AboutPage()),
  PageModel(title: 'bill', icon: AppIcons.bill, page: const AddUser()),
];
