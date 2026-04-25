import 'package:flutter/material.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSize.avatarRadius,
            backgroundColor: AppColor.primary.withValues(alpha: 0.15),
            backgroundImage: const AssetImage(AppImages.userAvatar),
            onBackgroundImageError: (_, _) {},
            child: null,
          ),
          const SizedBox(width: AppSize.s12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.userName,
                  style: AppTextStyle.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  AppString.userRole,
                  style: AppTextStyle.caption,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
