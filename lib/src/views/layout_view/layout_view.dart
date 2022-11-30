import 'package:ems/utils/app_size_configuration.dart';
import 'package:flutter/material.dart';
import 'conversations_view/conversations_view.dart';
import 'explore_view/explore_view.dart';
import 'home_view/home_view.dart';
import 'profile_view/profile_view.dart';
import 'widgets.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final List<Widget> _views = [
    const HomeView(),
    const ExploreView(),
    const ConversationsView(),
    const ProfileView(),
  ];

  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    AppSizeConfiguration.onInit(context);
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: _views
            .asMap()
            .map((index, page) => MapEntry(
                index,
                Offstage(
                  offstage: _selectedPage != index,
                  child: page,
                )))
            .values
            .toList(),
      ),
      floatingActionButton: const CreateEventFloatingButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBarWidget(
          activeIndex: _selectedPage,
          onTap: (index) => setState(() {
                _selectedPage = index;
              })),
    );
  }
}
