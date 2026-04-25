import 'package:flutter/material.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchBarWidget({super.key, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyle.bodyMedium,
      decoration: InputDecoration(
        hintText: AppString.searchHint,
        hintStyle: AppTextStyle.bodyMedium.copyWith(
          color: AppColor.unselectedNavText,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColor.iconMuted,
          size: AppSize.iconM,
        ),
      ),
    );
  }
}
