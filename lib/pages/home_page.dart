import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chats_list_page.dart';
import 'nearby_page.dart';
import 'broadcast_page.dart';
import 'mesh_status_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ChatsListPage(),
    NearbyPage(),
    BroadcastPage(),
    MeshStatusPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                );
              }
              return GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.bodyLarge?.color?.withValues(alpha: 0.7),
              );
            }),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(color: Theme.of(context).primaryColor);
              }
              return IconThemeData(
                color: Theme.of(context).textTheme.bodyLarge?.color?.withValues(alpha: 0.7),
              );
            }),
          ),
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
            backgroundColor: Colors.transparent,
            elevation: 0,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline_rounded),
                selectedIcon: Icon(Icons.chat_bubble_rounded),
                label: 'Chats',
              ),
              NavigationDestination(
                icon: Icon(Icons.radar_rounded),
                selectedIcon: Icon(Icons.radar_rounded),
                label: 'Nearby',
              ),
              NavigationDestination(
                icon: Icon(Icons.cell_tower_rounded),
                selectedIcon: Icon(Icons.cell_tower_rounded),
                label: 'Broadcast',
              ),
              NavigationDestination(
                icon: Icon(Icons.hub_outlined),
                selectedIcon: Icon(Icons.hub_rounded),
                label: 'Mesh',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
