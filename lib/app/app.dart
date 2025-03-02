import 'package:flutter/material.dart';
import 'models/page_model.dart';
import 'widgets/nav_bar.dart';
import 'widgets/side_bar.dart';
import 'widgets/content_area.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.center,
      appBar: NavBar(),
      body: Row(children: [SideBar(pages: pages), const ContentArea()]),
    );
  }
}
