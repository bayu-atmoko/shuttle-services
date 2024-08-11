import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String role = '';

  Future<String?> getRole() async {
    return await FlutterSecureStorageHelper.getRole();
  }

  void onNavigationBarPressed(BuildContext context, int index) {
    if (role == UserRoleEnum.petugas.value) {
      widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    } else {
      final actualIndex = index == 0 ? index : index + 1;
      widget.navigationShell.goBranch(
        actualIndex,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    }
  }

  int _getCurrentIndex() {
    if (role == UserRoleEnum.petugas.value) {
      return widget.navigationShell.currentIndex;
    } else {
      final navigationIndex = widget.navigationShell.currentIndex;
      return navigationIndex == 0 ? navigationIndex : navigationIndex - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.selectedTheme;

    return FutureBuilder<String?>(
      future: getRole(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            role = snapshot.data.orEmpty().toLowerCase();
          }
        }

        if (role.isNotNullOrEmpty) {
          return Scaffold(
            key: const ValueKey(MorphemeDataTesId.pageMain),
            body: widget.navigationShell,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: context.color.grey,
              selectedItemColor: context.color.primary,
              backgroundColor: context.color.white,
              currentIndex: _getCurrentIndex(),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: context.s.home,
                ),
                if (role == UserRoleEnum.petugas.value) ...[
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.map),
                    label: context.s.mapsRoute,
                  ),
                ],
                BottomNavigationBarItem(
                  icon: const Icon(Icons.call),
                  label: context.s.help,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: context.s.account,
                ),
              ],
              onTap: (index) => onNavigationBarPressed(context, index),
            ),
          );
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
