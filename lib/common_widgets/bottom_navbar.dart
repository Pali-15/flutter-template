import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/extensions/context_design_extension.dart';

class BottomNavbar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavbar({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: navigationShell,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Page 1',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Page 2'),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (newIndex) {
            if (navigationShell.currentIndex != newIndex) {
              navigationShell.goBranch(newIndex);
            }
          },
          selectedItemColor: context.colors.navbarItem,
          selectedLabelStyle:
              context.textStyles.subtitle.copyWith(fontWeight: FontWeight.bold),
          unselectedLabelStyle: context.textStyles.subtitle),
    );
  }
}
