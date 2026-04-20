import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';

class LogoutTileWidget extends StatelessWidget {
  final Function()? onLogout;

  const LogoutTileWidget({super.key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onLogout,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgImages.logout,
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColor.unselectedNavText,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    AppString.logOut,
                    style: AppTextStyle.navItem,
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
