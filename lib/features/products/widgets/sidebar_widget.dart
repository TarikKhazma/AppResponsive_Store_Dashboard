import 'package:flutter/material.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/theme/app_color.dart';
import 'logout_tile_widget.dart';
import 'nav_tile_widget.dart';
import 'user_profile_widget.dart';

const _navItems = [
  NavItemData(AppString.home, IconImages.home),
  NavItemData(AppString.orders, IconImages.shopping),
  NavItemData(AppString.products, IconImages.features),
  NavItemData(AppString.customers, IconImages.customersuccess),
  NavItemData(AppString.settings, IconImages.setting),
];

class SidebarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final VoidCallback? onLogout;

  const SidebarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sidebarWidth,
      color: AppColor.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(bottom: false, child: SizedBox(height: AppSize.s24)),
          const UserProfileWidget(),
          const SizedBox(height: AppSize.s24),
          const Divider(),
          const SizedBox(height: AppSize.s8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
              itemCount: _navItems.length,
              itemBuilder: (_, i) => NavTileWidget(
                data: _navItems[i],
                isSelected: i == selectedIndex,
                onTap: () => onItemSelected(i),
              ),
            ),
          ),
          const Divider(),
          LogoutTileWidget(onLogout: onLogout),
          const SafeArea(top: false, child: SizedBox(height: AppSize.s8)),
        ],
      ),
    );
  }
}
