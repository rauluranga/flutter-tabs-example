import 'package:flutter/material.dart';
import 'package:flutter_tabs_example/posts_screen.dart';
import 'package:flutter_tabs_example/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> tabs = const [
    PostsScreen(),
    SettingsScreen(),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    //disable animation between tabs
    _tabController = TabController(
        length: tabs.length, vsync: this, animationDuration: Duration.zero);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((Widget tab) {
          return Navigator(
            key: UniqueKey(),
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => tab,
              );
            },
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _tabController.index,
        onTap: (int index) {
          _tabController.animateTo(index);
        },
      ),
    );
  }
}
