import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';

class NavItemData {
  final String label;
  final String iconPath;
  const NavItemData(this.label, this.iconPath);
}

Widget buildNavIcon(String path, Color color, {double size = AppSize.iconM}) {
  if (path.endsWith('.svg')) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
  return Image.asset(path, width: size, height: size, color: color);
}

class NavTileWidget extends StatelessWidget {
  final NavItemData data;
  final bool isSelected;
  final VoidCallback onTap;

  const NavTileWidget({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected
        ? AppColor.selectedNavText
        : AppColor.unselectedNavText;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.s4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSize.radiusM),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s12,
              vertical: AppSize.s10,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppColor.selectedNavBg : Colors.transparent,
              borderRadius: BorderRadius.circular(AppSize.radiusM),
            ),
            child: Row(
              children: [
                buildNavIcon(data.iconPath, iconColor),
                const SizedBox(width: AppSize.s12),
                Flexible(
                  child: Text(
                    data.label,
                    style: isSelected
                        ? AppTextStyle.navItemSelected
                        : AppTextStyle.navItem,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
