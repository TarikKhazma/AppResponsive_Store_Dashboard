import 'package:flutter/material.dart';
import 'sidebar_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SidebarWidget(
        selectedIndex: selectedIndex,
        onItemSelected: (i) {
          onItemSelected(i);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
