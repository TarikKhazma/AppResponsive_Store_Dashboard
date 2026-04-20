import 'package:flutter/material.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';

class PageBtnWidget extends StatelessWidget {
  final String? label;
  final Widget? child;
  final bool isSelected;
  final bool enabled;
  final VoidCallback? onTap;

  const PageBtnWidget({
    super.key,
    this.label,
    this.child,
    this.isSelected = false,
    this.enabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? AppColor.primary
        : enabled
            ? AppColor.textPrimary
            : AppColor.iconMuted;

    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: isSelected ? null : Border.all(color: AppColor.cardBorder),
        ),
        child: child != null
            ? IconTheme(
                data: IconThemeData(color: color, size: 18),
                child: child!,
              )
            : Text(
                label ?? '',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: isSelected ? AppColor.surface : AppColor.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
      ),
    );
  }
}
